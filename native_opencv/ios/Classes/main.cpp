//#include <iostream>
//#include <opencv2/opencv.hpp>
//#include <string>
//#include <chrono>
//#include <thread>
//#include <cstring>
//#include <sys/socket.h>
//#include <arpa/inet.h>
//#include <unistd.h>
//#include <nlohmann/json.hpp>
//#include "target_zone_detector.h"
//#include "scorer.h"
//
//using json = nlohmann::json;
//
//// Constants
//const char* CAMERA_IP = "192.168.42.1";
//const int COMMAND_PORT = 7878;
//const int DATA_PORT = 8787;
//const int BUFFER_SIZE = 1024;
//const int CALIBRATION_CHECK_INTERVAL = 20;
//const float MAX_ASPECT_RATIO = 1.04f;
//const int MIN_RINGS_REQUIRED = 6;
//
//// Simple state management
//struct AppState {
//    bool is_paused = false;
//    bool last_setup_valid = false;
//    int calibration_check_counter = 0;
//    int consecutive_failures = 0;
//    std::vector<cv::RotatedRect> last_detected_ellipses;
//
//        std::vector<cv::RotatedRect> user_approved_geometry;  // NEW: Store what user approved
//};
//
//// History Management
//struct PersistentShot {
//    cv::Point display_point;
//    int shot_number;
//    int score;
//};
//
//std::vector<PersistentShot> session_history;  // Keeps all shots for entire session
//int global_shot_counter = 0;
//
//
//// Draw session history function
//void draw_session_history(cv::Mat& frame, const cv::Rect& roi = cv::Rect()) {
//    cv::Point offset(roi.empty() ? 0 : roi.x, roi.empty() ? 0 : roi.y);
//
//    for (const auto& shot : session_history) {
//        cv::Point display_pos = shot.display_point + offset;
//
//        // Color: Green for hits, Red for misses
//        cv::Scalar color = shot.score > 0 ? cv::Scalar(0, 255, 0) : cv::Scalar(0, 0, 255);
//
//        cv::putText(frame, std::to_string(shot.shot_number), display_pos,
//                   cv::FONT_HERSHEY_COMPLEX, 0.7, color, 2);
//    }
//}
//
//// NEW function: Draw ONLY current shot for saved frames
//void draw_current_shot_for_save(cv::Mat& frame, const cv::Point& roi_offset) {
//    if (session_history.empty()) return;
//
//    // Get the latest (current) shot only
//    const auto& current_shot = session_history.back();
//    cv::Point display_pos = current_shot.display_point + roi_offset;
//
//    // Color: Green for hits, Red for misses
//    cv::Scalar color = current_shot.score > 0 ? cv::Scalar(0, 255, 0) : cv::Scalar(0, 0, 255);
//
//    // Show ONLY current shot number
//    cv::putText(frame, std::to_string(current_shot.shot_number), display_pos,
//               cv::FONT_HERSHEY_COMPLEX, 0.7, color, 2);
//}
//
//// Modified save function to show only current shot
//// Add this to save function
//void save_frame_if_new_shot(const cv::Mat& frame, const cv::Rect& current_roi) {
//    static int last_saved_shot = 0;
//    static int delay_counter = 0;
//    static bool pending_save = false;
//    static cv::Mat pending_frame;
//    static int pending_shot_number = 0;
//
//    // If we have a pending save, wait a few frames for stabilization
//    if (pending_save) {
//        delay_counter++;
//        if (delay_counter >= 3) { // Wait 3 frames for stabilization
//            // Save the stabilized frame
//            cv::Mat shot_frame = frame.clone();
//            draw_current_shot_for_save(shot_frame, cv::Point(current_roi.empty() ? 0 : current_roi.x,
//                                                             current_roi.empty() ? 0 : current_roi.y));
//
//            std::string filename = "shot_" + std::to_string(pending_shot_number) + ".jpg";
//            cv::imwrite(filename, shot_frame);
//            std::cout << "Saved (delayed): " << filename << std::endl;
//
//            pending_save = false;
//            delay_counter = 0;
//            last_saved_shot = pending_shot_number;
//        }
//        return;
//    }
//
//    // Check for new shot
//    if (global_shot_counter > last_saved_shot) {
//        pending_save = true;
//        pending_shot_number = global_shot_counter;
//        delay_counter = 0;
//    }
//}
//
//// Keep your original capture function simple - just update history
//void capture_shot_from_scorer(Scorer& scorer) {
//    const auto& scorer_history = scorer.get_history();
//    if (scorer_history.empty()) return;
//
//    const auto& latest_contour = scorer_history.back();
//    if (latest_contour.empty()) return;
//
//    // Find display point
//    cv::Point min_point = *std::min_element(latest_contour.begin(), latest_contour.end(),
//        [](const cv::Point &lhs, const cv::Point &rhs) {
//            return lhs.x < rhs.x || (lhs.x == rhs.x && lhs.y < rhs.y);
//        });
//
//    PersistentShot shot;
//    shot.display_point = min_point;
//    shot.shot_number = ++global_shot_counter;
//    shot.score = scorer.get_last_score();
//
//    session_history.push_back(shot);
//
//    std::cout << "📍 Shot #" << shot.shot_number << " captured (Score: " << shot.score << ")" << std::endl;
//}
//
//struct CameraResources {
//    int cmd_sock = -1;
//    int data_sock = -1;
//    int token = 0;
//    cv::VideoCapture* cap = nullptr;
//    bool is_running = true;
//};
//
//// Camera connection functions
//int createSocket(const char* host, int port) {
//    int sock = socket(AF_INET, SOCK_STREAM, 0);
//    if (sock < 0) {
//        std::cout << "Failed to create socket" << std::endl;
//        return -1;
//    }
//
//    struct sockaddr_in server_addr;
//    server_addr.sin_family = AF_INET;
//    server_addr.sin_port = htons(port);
//
//    if (inet_pton(AF_INET, host, &server_addr.sin_addr) <= 0) {
//        std::cout << "Invalid address" << std::endl;
//        close(sock);
//        return -1;
//    }
//
//    if (connect(sock, (struct sockaddr*)&server_addr, sizeof(server_addr)) < 0) {
//        std::cout << "Connection failed" << std::endl;
//        close(sock);
//        return -1;
//    }
//
//    return sock;
//}
//
//bool sendCommand(int sock, int msg_id, int token = 0, const char* param = nullptr) {
//    json command;
//    command["msg_id"] = msg_id;
//    command["token"] = token;
//    if (param) {
//        command["param"] = param;
//    }
//
//    std::string cmd_str = command.dump();
//    if (send(sock, cmd_str.c_str(), cmd_str.length(), 0) < 0) {
//        std::cout << "Failed to send command" << std::endl;
//        return false;
//    }
//
//    char buffer[BUFFER_SIZE] = {0};
//    if (recv(sock, buffer, BUFFER_SIZE, 0) < 0) {
//        std::cout << "Failed to receive response" << std::endl;
//        return false;
//    }
//
//    json response = json::parse(buffer);
//    return response["rval"] == 0;
//}
//
//bool startSession(int sock, int& token) {
//    json command;
//    command["msg_id"] = 257;
//    command["token"] = 0;
//
//    std::string cmd_str = command.dump();
//    if (send(sock, cmd_str.c_str(), cmd_str.length(), 0) < 0) {
//        std::cout << "Failed to send start session command" << std::endl;
//        return false;
//    }
//
//    char buffer[BUFFER_SIZE] = {0};
//    if (recv(sock, buffer, BUFFER_SIZE, 0) < 0) {
//        std::cout << "Failed to receive response" << std::endl;
//        return false;
//    }
//
//    json response = json::parse(buffer);
//    if (response["rval"] == 0) {
//        token = response["param"];
//        return true;
//    }
//    return false;
//}
//
//bool resetVF(int sock, int token) {
//    return sendCommand(sock, 259, token);
//}
//
//bool stopVF(int sock, int token) {
//    return sendCommand(sock, 260, token);
//}
//
//bool stopSession(int sock, int token) {
//    return sendCommand(sock, 258, token);
//}
//
//cv::VideoCapture* initializeVideoCapture(const char* host) {
//    std::string url = "rtsp://" + std::string(host) + "/live";
//    cv::VideoCapture* cap = new cv::VideoCapture();
//
//    cap->set(cv::CAP_PROP_BUFFERSIZE, 1);
//    cap->set(cv::CAP_PROP_FPS, 30);
//
//    if (!cap->open(url, cv::CAP_FFMPEG)) {
//        delete cap;
//        return nullptr;
//    }
//
//    return cap;
//}
//
//void cleanup(CameraResources& resources) {
//    if (resources.cap) {
//        resources.cap->release();
//        delete resources.cap;
//        resources.cap = nullptr;
//    }
//
//    if (resources.cmd_sock >= 0) {
//        if (resources.token > 0) {
//            stopVF(resources.cmd_sock, resources.token);
//            stopSession(resources.cmd_sock, resources.token);
//        }
//        close(resources.cmd_sock);
//        resources.cmd_sock = -1;
//    }
//
//    if (resources.data_sock >= 0) {
//        close(resources.data_sock);
//        resources.data_sock = -1;
//    }
//}
//
//// Simple validation function
//bool is_camera_setup_good(const std::vector<cv::RotatedRect>& ellipses) {
//    if (ellipses.size() < MIN_RINGS_REQUIRED) return false;
//
//    for (const auto& ellipse : ellipses) {
//        float aspect_ratio = std::max(ellipse.size.width, ellipse.size.height) /
//                            std::min(ellipse.size.width, ellipse.size.height);
//        if (aspect_ratio > MAX_ASPECT_RATIO) return false;
//    }
//    return true;
//}
//
//// Calibration mode processing
//void process_calibration_mode(cv::Mat& frame, cv::Mat& frame_gray, AppState& state,
//                             TargetZoneDetector& calibration_detector) {
//    // UI headers
//    cv::putText(frame, "CALIBRATION - Adjust camera angle for circular rings",
//               cv::Point(50, 50), cv::FONT_HERSHEY_SIMPLEX, 0.7, cv::Scalar(0, 255, 255), 2);
//
//    // Only check every N frames to reduce computation
//    state.calibration_check_counter++;
//    if (state.calibration_check_counter >= CALIBRATION_CHECK_INTERVAL) {
//        state.calibration_check_counter = 0;
//
//        // Run detection
//        state.last_detected_ellipses = calibration_detector._detect(frame_gray);
//
//                state.user_approved_geometry = state.last_detected_ellipses;  // NEW: Store this!
//
//        // Validate setup
//        bool new_setup_valid = is_camera_setup_good(state.last_detected_ellipses);
//
//        // Only print status when it changes
//        if (new_setup_valid != state.last_setup_valid) {
//            if (!new_setup_valid) {
//                if (state.last_detected_ellipses.size() < MIN_RINGS_REQUIRED) {
//                    std::cout << "⚠️ Only " << state.last_detected_ellipses.size() << " rings detected" << std::endl;
//                } else {
//                    std::cout << "🚨 Camera angle too steep - rings appear elliptical" << std::endl;
//                }
//            } else {
//                std::cout << "✅ Good setup - " << state.last_detected_ellipses.size() << " rings, good angles" << std::endl;
//            }
//        }
//        state.last_setup_valid = new_setup_valid;
//    }
//
//    // Draw the SAME rings user is approving
//    cv::Scalar ring_color = state.last_setup_valid ? cv::Scalar(0, 255, 0) : cv::Scalar(0, 0, 255);
//    for (const auto& ellipse : state.last_detected_ellipses) {
//        cv::ellipse(frame, ellipse, ring_color, 0);  // User sees these
//    }
//
//    // Status messages
//    if (state.last_setup_valid) {
//        cv::putText(frame, "Good angle! Press SPACE to start scoring",
//                   cv::Point(50, 100), cv::FONT_HERSHEY_SIMPLEX, 0.7, cv::Scalar(0, 255, 0), 2);
//    } else {
//        cv::putText(frame, "Adjust camera to more perpendicular view",
//                   cv::Point(50, 100), cv::FONT_HERSHEY_SIMPLEX, 0.7, cv::Scalar(0, 0, 255), 2);
//        cv::putText(frame, "Rings should appear circular, not elliptical",
//                   cv::Point(50, 130), cv::FONT_HERSHEY_SIMPLEX, 0.6, cv::Scalar(255, 255, 255), 1);
//    }
//
//    // Controls info
//    cv::putText(frame, "Controls: SPACE=Start | Q=Quit",
//               cv::Point(50, frame.rows - 30), cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(200, 200, 200), 1);
//}
//
//// Scoring mode processing
//void process_scoring_mode(cv::Mat& frame, cv::Mat& frame_gray, TargetZoneDetector& tz_detector,
//                         Scorer& scorer, int frame_idx, AppState& state) {
//    double t0 = cv::getTickCount();
//
//    int numEllipses = tz_detector.process(frame, frame_gray);
//    if (numEllipses <= 0) return;
//
//    std::vector<cv::RotatedRect> scoring_ellipses = tz_detector.get_ellipses_for_scoring();
//    if (scoring_ellipses.empty()) return;
//
//    cv::Rect current_roi = tz_detector.get_current_roi();
//    cv::Rect processing_region = current_roi.empty() ?
//        cv::Rect(0, 0, frame.cols, frame.rows) : current_roi;
//
//    cv::Point display_offset(current_roi.empty() ? 0 : current_roi.x,
//                            current_roi.empty() ? 0 : current_roi.y);
//
//    // Draw rings
//    for (const auto& ellipse : scoring_ellipses) {
//        cv::RotatedRect display_ellipse = ellipse;
//        display_ellipse.center.x += display_offset.x;
//        display_ellipse.center.y += display_offset.y;
//        cv::ellipse(frame, display_ellipse, cv::Scalar(255, 255, 255), 1);
//    }
//
//    // Draw original user-approved geometry
//    if (!state.user_approved_geometry.empty()) {
//        for (size_t i = 0; i < state.user_approved_geometry.size(); i++) {
//            const auto& original_ellipse = state.user_approved_geometry[i];
//            cv::ellipse(frame, original_ellipse, cv::Scalar(0, 255, 255), 1);
//            cv::putText(frame, "O" + std::to_string(i+1),
//                       cv::Point(original_ellipse.center.x - 20, original_ellipse.center.y),
//                       cv::FONT_HERSHEY_SIMPLEX, 0.6, cv::Scalar(0, 255, 255), 1);
//        }
//    }
//
//    // ROI visual elements
//    if (!current_roi.empty()) {
//        cv::rectangle(frame, current_roi, cv::Scalar(0, 255, 255), 2);
//        cv::putText(frame, "ROI MODE", cv::Point(current_roi.x, current_roi.y - 10),
//                   cv::FONT_HERSHEY_SIMPLEX, 0.6, cv::Scalar(0, 255, 255), 2);
//    }
//
//    // SHOT DETECTION - MINIMAL MEMORY IMPACT
//    if (!tz_detector.is_shifting()) {
//        std::map<std::string, std::vector<cv::RotatedRect>> target_zone;
//        target_zone["ellipses"] = scoring_ellipses;
//        int timestamp = frame_idx * 33;
//
//        cv::Mat processing_frame = frame(processing_region);
//        cv::Mat processing_gray = frame_gray(processing_region);
//
//        size_t history_size_before = scorer.get_history().size();
//        int score = scorer.process(processing_frame, processing_gray, target_zone, timestamp);
//        size_t history_size_after = scorer.get_history().size();
//
//        // Save shot immediately when detected
//        if (history_size_after > history_size_before && score >= 0) {
//capture_shot_from_scorer(scorer);
//// Save BEFORE drawing all history (frame has no shot numbers yet)
//    //save_frame_if_new_shot(frame, current_roi);
//        }
//
//    } else {
//        cv::putText(frame, "TARGET MOVING - DETECTION PAUSED",
//                   cv::Point(50, 150), cv::FONT_HERSHEY_SIMPLEX, 0.8, cv::Scalar(0, 165, 255), 2);
//    }
//
//    // Draw session history (only shot numbers)
//        save_frame_if_new_shot(frame, current_roi);
//    draw_session_history(frame, current_roi);
//
//    // Performance info
//    int total_score = scorer.get_total_score();
//    int last_score = scorer.get_last_score();
//    double t1 = cv::getTickCount();
//    int current_fps = cvRound(cv::getTickFrequency() / (t1 - t0));
//
//    std::string last_score_txt = "last score: " + (last_score < 0 ? "_" : std::to_string(last_score));
//    std::string text = "#frame " + std::to_string(frame_idx) + " fps: " + std::to_string(current_fps) +
//                      " " + last_score_txt + " total score: " + std::to_string(total_score);
//
//    std::string history_text = "Shots: ";
//    for (const auto& shot : session_history) {
//        history_text += std::to_string(shot.score) + " ";
//    }
//
//    cv::putText(frame, text, cv::Point(50, 50), cv::FONT_HERSHEY_COMPLEX, 0.7, cv::Scalar(0, 255, 0), 1, cv::LINE_AA);
//    cv::putText(frame, history_text, cv::Point(50, 100), cv::FONT_HERSHEY_COMPLEX, 0.7, cv::Scalar(0, 255, 0), 1, cv::LINE_AA);
//
//    cv::Point2f center = tz_detector.get_current_target_center();
//    std::string center_text = "Target Center: (" + std::to_string((int)center.x) + "," + std::to_string((int)center.y) + ")";
//    cv::putText(frame, center_text, cv::Point(50, frame.rows - 80),
//               cv::FONT_HERSHEY_SIMPLEX, 0.6, cv::Scalar(0, 255, 0), 2);
//
//    std::string method_text = !current_roi.empty() ?
//        "ROI PROCESSING - Performance Mode" :
//        "FULL FRAME PROCESSING - Quality Mode";
//    cv::putText(frame, method_text, cv::Point(50, frame.rows - 50),
//               cv::FONT_HERSHEY_SIMPLEX, 0.6, cv::Scalar(0, 255, 255), 2);
//
//    cv::putText(frame, "Controls: | P=Pause | Q=Quit",
//               cv::Point(50, frame.rows - 20), cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(200, 200, 200), 1);
//}
//
//// Handle pause state
//void handle_pause_state(AppState& state, CameraResources& resources) {
//    while (state.is_paused && resources.is_running) {
//        std::this_thread::sleep_for(std::chrono::milliseconds(100));
//        char c = (char)cv::waitKey(1);
//        if (c == 'r' || c == 'R') {
//            state.is_paused = false;
//            std::cout << "▶️ Resumed" << std::endl;
//            break;
//        }
//        if (c == 'q' || c == 27) {
//            resources.is_running = false;
//            break;
//        }
//    }
//}
//
//// Capture frame with error handling
//bool capture_frame(cv::VideoCapture* cap, cv::Mat& frame, AppState& state, CameraResources& resources) {
//    if (!cap->read(frame) || frame.empty()) {
//        std::cout << "Frame capture failed. Attempt " << state.consecutive_failures + 1 << "/3" << std::endl;
//        state.consecutive_failures++;
//
//        if (state.consecutive_failures >= 3) {
//            std::cout << "Reinitializing video capture..." << std::endl;
//            cap->release();
//            delete cap;
//            std::this_thread::sleep_for(std::chrono::milliseconds(2000));
//            resources.cap = initializeVideoCapture(CAMERA_IP);
//            state.consecutive_failures = 0;
//
//            if (!resources.cap) {
//                throw std::runtime_error("Video capture reinitialization failed");
//            }
//        }
//
//        std::this_thread::sleep_for(std::chrono::milliseconds(100));
//        return false;
//    }
//
//    state.consecutive_failures = 0;
//    return true;
//}
//
//// Initialize scoring mode
//bool start_scoring_mode(TargetZoneDetector& tz_detector, AppState& state,
//                       cv::Mat& frame, cv::Mat& frame_gray) {
//
//    // Use the EXACT geometry user approved (not a new detection!)
//    if (state.user_approved_geometry.empty()) {
//        std::cout << "❌ No user-approved geometry available" << std::endl;
//        return false;
//    }
//
//    // Validate that user-approved geometry is still good
//    if (!tz_detector.is_detection_good_enough(state.user_approved_geometry)) {
//        std::cout << "❌ User-approved geometry no longer valid - please recalibrate" << std::endl;
//        return false;
//    }
//
//    // Initialize with EXACTLY what user saw and approved
//    tz_detector.set_user_approved_geometry(state.user_approved_geometry);
//
//    // IMPORTANT: Call prepare to ensure is_ready() returns true
//    for (int i = 0; i < 10; i++) {
//        tz_detector.prepare(frame, frame_gray);
//    }
//
//    cv::Point2f target_center = state.user_approved_geometry[0].center;
//    tz_detector.enable_roi_mode(target_center, frame.size(), state.user_approved_geometry);
//
//    std::cout << "🎯 Using user-approved geometry with " << state.user_approved_geometry.size() << " rings!" << std::endl;
//    std::cout << "🎯 READY TO SCORE - Point gun at target and shoot!" << std::endl;
//    return true;
//}
//
//
//// ============================================================================
//// MAIN FUNCTION - MUCH SIMPLER NOW!
//// ============================================================================
//int main(int argc, char** argv) {
//    CameraResources resources;
//    AppState state;
//    static int32_t last_frame_idx = -1;
//
//    try {
//        // Connect to camera
//        std::cout << "Connecting to camera..." << std::endl;
//        resources.cmd_sock = createSocket(CAMERA_IP, COMMAND_PORT);
//        resources.data_sock = createSocket(CAMERA_IP, DATA_PORT);
//
//        if (resources.cmd_sock < 0 || resources.data_sock < 0) {
//            throw std::runtime_error("Failed to connect to camera");
//        }
//
//        // Initialize camera session
//        std::cout << "Initializing camera session..." << std::endl;
//        if (!startSession(resources.cmd_sock, resources.token) ||
//            !resetVF(resources.cmd_sock, resources.token)) {
//            throw std::runtime_error("Failed to initialize camera session");
//        }
//
//        // Wait for camera to stabilize
//        std::cout << "Waiting for camera to stabilize..." << std::endl;
//        std::this_thread::sleep_for(std::chrono::seconds(5));
//
//        // Initialize video capture
//        std::cout << "Initializing video stream..." << std::endl;
//        resources.cap = initializeVideoCapture(CAMERA_IP);
//        if (!resources.cap) {
//            throw std::runtime_error("Failed to initialize video capture");
//        }
//
//        // Get initial frame for dimensions
//        cv::Mat temp_frame;
//        int retry_count = 0;
//        while (retry_count < 5) {
//            if (resources.cap->read(temp_frame) && !temp_frame.empty()) {
//                break;
//            }
//            std::cout << "Retrying initial frame capture... Attempt " << retry_count + 1 << "/5" << std::endl;
//            std::this_thread::sleep_for(std::chrono::milliseconds(500));
//            retry_count++;
//        }
//
//        if (temp_frame.empty()) {
//            throw std::runtime_error("Failed to capture initial frame after 5 attempts");
//        }
//
//        // Initialize components
//        int frame_width = temp_frame.cols;
//        int frame_height = temp_frame.rows;
//
//        TargetZoneDetector tz_detector(frame_height, frame_width);
//        Scorer scorer;
//        TargetZoneDetector calibration_detector(frame_height, frame_width, 1);
//
//        // Setup video writer
//        cv::VideoWriter writer("camera_output_demo.mp4", cv::VideoWriter::fourcc('m', 'p', '4', 'v'),
//                              30, cv::Size(frame_width, frame_height));
//
//        int frame_idx = 0;
//
//        std::cout << "Starting processing..." << std::endl;
//
//        // ====================================================================
//        // MAIN PROCESSING LOOP - CLEAN AND SIMPLE!
//        // ====================================================================
//        while (resources.is_running && resources.cap->isOpened()) {
//            cv::Mat frame;
//
//            // Capture frame with error handling
//            if (!capture_frame(resources.cap, frame, state, resources)) {
//                continue;
//            }
//
//            frame_idx++;
//
//                // ===== ULTRA MINIMAL DUPLICATE CHECK - ZERO EXTRA MEMORY =====
//            if (frame_idx == last_frame_idx) {
//                std::cout << "DUPLICATE FRAME SKIPPING..." << std::endl;
//                continue; // Skip duplicate frame index
//            }
//            last_frame_idx = frame_idx;
//            // ===== END DUPLICATE CHECK =====
//
//            cv::Mat frame_gray;
//            cv::cvtColor(frame, frame_gray, cv::COLOR_BGR2GRAY);
//
//            // Handle pause state
//            if (state.is_paused) {
//                handle_pause_state(state, resources);
//                continue;
//            }
//
//            // Route to appropriate processing mode
//            if (!tz_detector.is_ready()) {
//                process_calibration_mode(frame, frame_gray, state, calibration_detector);
//            } else {
//                process_scoring_mode(frame, frame_gray, tz_detector, scorer, frame_idx, state);
//            }
//
//            // Display and save
//            cv::imshow("img", frame);
//            writer.write(frame);
//
//            // Handle user input
//            char c = (char)cv::waitKey(1);
//            if (c == ' ') {
//              if (!tz_detector.is_ready() && state.last_setup_valid) {
//                  if (start_scoring_mode(tz_detector, state, frame, frame_gray)) {
//                      std::cout << "✅ Scoring mode activated - Now processing shots!" << std::endl;
//                  } else {
//                      std::cout << "❌ Failed to start - try adjusting camera angle" << std::endl;
//                  }
//              } else if (!tz_detector.is_ready()) {
//                  std::cout << "⚠️ Camera setup not valid - adjust angle first" << std::endl;
//              } else {
//                  std::cout << "ℹ️ Already in scoring mode" << std::endl;
//              }
//          }
//            if (c == 'p' || c == 'P') {
//                state.is_paused = true;
//                std::cout << "⏸️ Paused - Press 'R' to resume" << std::endl;
//            }
//            if (c == 'q' || c == 27) {
//                resources.is_running = false;
//                break;
//            }
//        }
//
//        writer.release();
//
//    } catch (const std::exception& e) {
//        std::cerr << "Error: " << e.what() << std::endl;
//        resources.is_running = false;
//    }
//
//    std::cout << "Cleaning up..." << std::endl;
//    cleanup(resources);
//    return 0;
//}
