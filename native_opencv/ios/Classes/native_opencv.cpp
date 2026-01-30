///For_Android
#include <iostream>
#include <chrono>

#include <opencv2/opencv.hpp>
#include "target_zone_detector.h"
#include "scorer.h"

#include <map>

#include <algorithm>
#include <bitset>
#include <fstream>
#include <iostream>
#include <numeric>
#include <vector>
#include <mutex>
#include "platform_log.h"
///for memory
#include <chrono>
#include <sys/resource.h>  // For memory tracking on Unix/Android
#ifdef __ANDROID__
#include <unistd.h>
#endif


#if defined(WIN32) || defined(_WIN32) || defined(__WIN32)
#define IS_WIN32
#endif

#ifdef __ANDROID__
#include <android/log.h>
#endif

#ifdef IS_WIN32
#include <windows.h>
#endif

#if defined(__GNUC__)
// Attributes to prevent 'unused' function from being removed and to make it visible
#define FUNCTION_ATTRIBUTE __attribute__((visibility("default"))) __attribute__((used))
#elif defined(_MSC_VER)
// Marking a function for export
#define FUNCTION_ATTRIBUTE __declspec(dllexport)
#endif

// using namespace cv;
// using namespace std;

bool is_running = false;
bool is_paused = false;
bool is_ble = false;

#define PIXEL_SCALE 100 // ���ݳߴ磬���������ֵ����

#define MAT_NUMBER 15 // һ��6*6���������15��������ʾ

//static std::vector<std::string> globalList;
//static std::mutex listMutex;
//
//void add_to_list(const char* value) {
//    std::lock_guard<std::mutex> lock(listMutex);
//    globalList.push_back(std::string(value));
//}
//void log_and_addf(const char* format, ...) {
//    char buffer[512];  // adjust size if needed
//
//    va_list args;
//    va_start(args, format);
//    vsnprintf(buffer, sizeof(buffer), format, args);
//    va_end(args);
//    add_to_list(buffer);
//}
//
//void log_and_add_str(const std::string& msg) {
//    add_to_list(msg.c_str());
//}
//
//void write_list_to_file(const char* filePath) {
//    std::lock_guard<std::mutex> lock(listMutex);
//
//    std::ofstream out(filePath);
//    if (!out.is_open()) {
//        std::cerr << "❌ Failed to open file: " << filePath << std::endl;
//        return;
//    }
//
//    for (const auto& item : globalList) {
//        out << item << "\n";  // write each entry on a new line
//    }
//
//    out.close();
//    std::cout << "✅ File written: " << filePath << std::endl;
//    free_list();
//}
//void free_list() {
//    std::lock_guard<std::mutex> lock(listMutex);
//    globalList.clear();
//    globalList.shrink_to_fit();
//}


long long int get_now()
{
    return std::chrono::duration_cast<std::chrono::milliseconds>(
               std::chrono::system_clock::now().time_since_epoch())
        .count();
}


// For Android
#ifdef __ANDROID__
#include <thread>
void sleep_ms(int milliseconds)
{
    std::this_thread::sleep_for(std::chrono::milliseconds(milliseconds));
}
#endif

// For iOS
#ifdef __APPLE__
#include <Foundation/Foundation.h>
void sleep_ms(int milliseconds)
{
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:milliseconds / 1000.0]];
}
#endif

int readInt32FromBuffer(uint8_t *buffer)
{
    int32_t value = 0;
    value |= buffer[0];
    value |= buffer[1] << 8;
    value |= buffer[2] << 16;
    value |= buffer[3] << 24;
    return value;
}



long getCurrentMemoryKB() {
#ifdef __ANDROID__
    // Android memory tracking
    FILE* file = fopen("/proc/self/status", "r");
    if (file) {
        char line[128];
        while (fgets(line, 128, file) != NULL) {
            if (strncmp(line, "VmRSS:", 6) == 0) {
                long memory_kb = 0;
                sscanf(line, "VmRSS: %ld kB", &memory_kb);
                fclose(file);
                return memory_kb;
            }
        }
        fclose(file);
    }
    return -1;
#else
    // Desktop/iOS alternative
    struct rusage usage;
    getrusage(RUSAGE_SELF, &usage);
    return usage.ru_maxrss; // Note: on macOS this is bytes, on Linux it's KB
#endif
}


// Avoiding name mangling
///For IOS
//#include <iostream>
//#include <chrono>
//#include <opencv2/opencv.hpp>
//#include "target_zone_detector.h"
//#include "scorer.h"
//#include <map>
//#include <algorithm>
//#include <bitset>
//#include <fstream>
//#include <iostream>
//#include <numeric>
//#include <vector>
//#include <mutex>
//#include <thread>
//#include "platform_log.h"
/////for memory
//#include <chrono>
//#include <sys/resource.h>  // For memory tracking on Unix/Android
//#include <unistd.h>
//
//
//#if defined(WIN32) || defined(_WIN32) || defined(__WIN32)
//#define IS_WIN32
//#endif
//
//#ifdef __ANDROID__
//#include <android/log.h>
//#endif
//
//#ifdef IS_WIN32
//#include <windows.h>
//#endif
//
//#if defined(__GNUC__)
//// Attributes to prevent 'unused' function from being removed and to make it visible
//#define FUNCTION_ATTRIBUTE __attribute__((visibility("default"))) __attribute__((used))
//#elif defined(_MSC_VER)
//// Marking a function for export
//#define FUNCTION_ATTRIBUTE __declspec(dllexport)
//#endif
//
//bool is_running = false;
//bool is_paused = false;
//bool is_ble = false;
//
//#define PIXEL_SCALE 100
//
//#define MAT_NUMBER 15
//
//
//long long int get_now()
//{
//    return std::chrono::duration_cast<std::chrono::milliseconds>(
//            std::chrono::system_clock::now().time_since_epoch())
//            .count();
//}
//
//
//// For Android and iOS
//#if defined(__ANDROID__) || defined(__APPLE__)
//void sleep_ms(int milliseconds)
//{
//    std::this_thread::sleep_for(std::chrono::milliseconds(milliseconds));
//}
//#endif
//
//// For Windows
//#ifdef IS_WIN32
//void sleep_ms(int milliseconds)
//{
//    Sleep(milliseconds);
//}
//#endif
//
//int readInt32FromBuffer(uint8_t *buffer)
//{
//    int32_t value = 0;
//    value |= buffer[0];
//    value |= buffer[1] << 8;
//    value |= buffer[2] << 16;
//    value |= buffer[3] << 24;
//    return value;
//}
//
//
//
//long getCurrentMemoryKB() {
//#ifdef __ANDROID__
//    // Android memory tracking
//    FILE* file = fopen("/proc/self/status", "r");
//    if (file) {
//        char line[128];
//        while (fgets(line, 128, file) != NULL) {
//            if (strncmp(line, "VmRSS:", 6) == 0) {
//                long memory_kb = 0;
//                sscanf(line, "VmRSS: %ld kB", &memory_kb);
//                fclose(file);
//                return memory_kb;
//            }
//        }
//        fclose(file);
//    }
//    return -1;
//#else
//    // Desktop/iOS alternative
//    struct rusage usage;
//    getrusage(RUSAGE_SELF, &usage);
//    return usage.ru_maxrss; // Note: on macOS this is bytes, on Linux it's KB
//#endif
//}

extern "C"
{
    FUNCTION_ATTRIBUTE
    const char *version()
    {
        return CV_VERSION;
    }

    std::mutex mtx;
    std::mutex input_mtx;
    std::mutex last_score_mtx;
    std::mutex detect_only_mtx;
    //
    std::mutex control_mtx;
    std::mutex control_ble;

static bool setup_valid = false;
static bool geometry_fixed = false;
static bool single_time_call = false;
static bool roi_initialized = false;
static int calibration_check_counter = 0;
static int last_history_score = 0;
static std::vector<cv::RotatedRect> last_detected_ellipses;
static std::vector<cv::RotatedRect> approved_geometry;
//static std::vector<cv::RotatedRect> last_detected_rings{};  // starts empty
//static cv::Rect                     last_roi{};             // starts at (0,0,0,0)

// Constants for calibration validation
const int CALIBRATION_CHECK_INTERVAL = 40;
const float MAX_ASPECT_RATIO = 1.05f;
const int MIN_RINGS_REQUIRED = 6;

static int global_shot_counter = 0;
static bool session_started = false;
static cv::Mat reusable_frame;
static cv::Mat reusable_gray;
static std::vector<uchar> reusable_buffer;
static bool mats_initialized = false;

static std::vector<uchar> g_screenshot_data;
static bool g_has_new_screenshot = false;
static int g_screenshot_shot_number = 0;

int32_t last_score_out = -1;
int32_t direction_s = -1;
int32_t score_s = -1;


///For_memory
static std::chrono::high_resolution_clock::time_point frame_start_time;
static std::chrono::high_resolution_clock::time_point fled_start_time;
static std::chrono::high_resolution_clock::time_point fled_end_time;
static long peak_memory_kb = 0;
static int frame_count = 0;

FUNCTION_ATTRIBUTE
int32_t score(uint8_t *input_buffer, int platform, int _, int frame_width, int frame_height,
              uint8_t *output_buffer, uint8_t *detect_only_buffer, char *output_path)
              {

    struct PersistentShot {
        cv::Point display_point;
        int shot_number;
        int score;
        int direction;
        std::vector<cv::Point> contour;  // NEW: stores contour
    };

    static std::vector<PersistentShot> session_history;


    if (!session_started) {
        if (!mats_initialized) {
            reusable_frame = cv::Mat();
            reusable_gray = cv::Mat();
            mats_initialized = true;
        }
        session_history.clear();
        session_history.shrink_to_fit();
        global_shot_counter = 0;
        session_started = true;
//        platform_log("Session history initialized");
    }


    auto capture_shot = [&](Scorer& scorer,
                            const cv::Mat& frame,
                            const cv::Point& offset) {
        const auto& scorer_history = scorer.get_history();
        if (scorer_history.empty()) return;

        const auto& latest_contour = scorer_history.back();
        if (latest_contour.empty()) return;

        // Compute center for display point
        cv::Point2f center_f;
        float radius = 0.f;
        cv::minEnclosingCircle(latest_contour, center_f, radius);

        PersistentShot shot;
        shot.display_point = cv::Point(static_cast<int>(center_f.x), static_cast<int>(center_f.y));
        shot.shot_number   = ++global_shot_counter;
        shot.score         = scorer.get_last_score();
        shot.direction     = scorer.get_last_direction();
        shot.contour       = latest_contour;  // Store the contour
        session_history.push_back(shot);

        if (shot.score >= 0) {
            cv::Mat screenshot = frame.clone();

            std::vector<cv::Point> adjusted_contour;
            for (const auto& pt : latest_contour)
                adjusted_contour.emplace_back(pt + offset);

            std::vector<std::vector<cv::Point>> contour_vec = { adjusted_contour };

            // Draw bold outline if latest
            cv::drawContours(screenshot, contour_vec, -1, cv::Scalar(0,255,0), 1, cv::LINE_AA);

            cv::imencode(".png", screenshot, g_screenshot_data);
            g_has_new_screenshot = true;
            g_screenshot_shot_number = shot.shot_number;
            last_score_out = shot.score;
            score_s = shot.score;
            direction_s = shot.direction;
        }
    };


    auto draw_history = [&](cv::Mat& frame, const cv::Point& offset = cv::Point(0, 0)) {
        size_t total = session_history.size();
        if (total == 0) return;

        for (size_t i = 0; i < total; ++i) {
            const auto& shot = session_history[i];

            std::vector<cv::Point> adjusted_contour;
            for (const auto& pt : shot.contour)
                adjusted_contour.emplace_back(pt + offset);

            std::vector<std::vector<cv::Point>> contour_vec = { adjusted_contour };

            cv::Scalar color = (i == total - 1) ? cv::Scalar(0,255,0) : cv::Scalar(0, 0, 255);
            float thickness = (i == total - 1) ? 3.0 : 1.5;

            cv::drawContours(frame, contour_vec, -1, color, 1, cv::LINE_AA);
        }
    };
//auto capture_shot = [&](Scorer& scorer,
//                        const cv::Mat& frame,
//                        const cv::Point& offset) {
//    const auto& scorer_history = scorer.get_history();
//    if (scorer_history.empty()) return;
//
//    const auto& latest_contour = scorer_history.back();
//    if (latest_contour.empty()) return;
//
//    // Compute center for display point
//    cv::Point2f center_f;
//    float radius = 0.f;
//    cv::minEnclosingCircle(latest_contour, center_f, radius);
//
//    PersistentShot shot;
//    shot.display_point = cv::Point(static_cast<int>(center_f.x), static_cast<int>(center_f.y));
//    shot.shot_number   = ++global_shot_counter;
//    shot.score         = scorer.get_last_score();
//    shot.direction     = scorer.get_last_direction();
//    shot.contour       = latest_contour;  // Store the contour
//    session_history.push_back(shot);
//
//    if (shot.score >= 0) {
//        cv::Mat screenshot = frame.clone();
//
//        std::vector<cv::Point> adjusted_contour;
//        for (const auto& pt : latest_contour)
//            adjusted_contour.emplace_back(pt + offset);
//
//        std::vector<std::vector<cv::Point>> contour_vec = { adjusted_contour };
//
//        // Draw bold outline if latest
////        cv::drawContours(screenshot, contour_vec, -1, cv::Scalar(0,255,0), 1, cv::LINE_AA);
//
//        // **ADD: Draw single green circle at center**
//        cv::Point center_adjusted = shot.display_point + offset;
//        cv::circle(screenshot, center_adjusted, 8, cv::Scalar(0, 255, 0), 2, cv::LINE_AA);
//
//        cv::imencode(".png", screenshot, g_screenshot_data);
//        g_has_new_screenshot = true;
//        g_screenshot_shot_number = shot.shot_number;
//        last_score_out = shot.score;
//        score_s = shot.score;
//        direction_s = shot.direction;
//    }
//};

///adeel_Bhai updated with circ_15_Nov

//auto draw_history = [&](cv::Mat& frame, const cv::Point& offset = cv::Point(0, 0)) {
//    // Constants for circle drawing
//    constexpr int INNER_RADIUS = 15;
//    constexpr int OUTER_RADIUS = 25;
//    constexpr int INNER_THICK = 4;
//    constexpr int OUTER_THICK = 3;
//
//    const size_t total = session_history.size();
//    if (total == 0) return;
//
//    for (size_t i = 0; i < total; ++i) {
//        const auto& shot = session_history[i];
//
//        // Calculate center from contour
//        std::vector<cv::Point> adjusted_contour;
//        adjusted_contour.reserve(shot.contour.size());
//        for (const auto& pt : shot.contour)
//            adjusted_contour.emplace_back(pt + offset);
//
//        // Compute center from contour (centroid via moments)
//        cv::Moments mu = cv::moments(adjusted_contour, false);
//        cv::Point center;
//        if (std::abs(mu.m00) > 1e-6) {
//            center = cv::Point(static_cast<int>(mu.m10 / mu.m00),
//                               static_cast<int>(mu.m01 / mu.m00));
//        } else {
//            cv::Rect br = cv::boundingRect(adjusted_contour);
//            center = (br.tl() + br.br()) * 0.5;
//        }
//
//        if (i == total - 1) {
//            // Current shot: red inner ring + black outer ring
//            cv::circle(frame, center, INNER_RADIUS, cv::Scalar(0, 0, 255), INNER_THICK, cv::LINE_AA);
//            cv::circle(frame, center, OUTER_RADIUS, cv::Scalar(0, 0, 0), OUTER_THICK, cv::LINE_AA);
//        } else {
//            // Previous shots: only red inner ring
//            cv::circle(frame, center, INNER_RADIUS, cv::Scalar(0, 0, 255), INNER_THICK, cv::LINE_AA);
//        }
//    }
//};
///updated with circ_15_Nov
//auto draw_history = [&](cv::Mat& frame, const cv::Point& offset = cv::Point(0, 0)) {
//    // Tunables
//    constexpr int INNER_RADIUS = 8;
//    constexpr int OUTER_RADIUS = 12;
//    constexpr int GREEN_RADIUS = 8;
//    constexpr int LINE_TYPE    = cv::LINE_AA;
//
//    const size_t total = session_history.size();
//    if (total == 0) return;
//
//    // **FIX 1: Verify frame format**
//    // LINE_AA requires 8-bit images. If frame is 16-bit or float, convert:
//    cv::Mat draw_target;
//    if (frame.depth() != CV_8U) {
//        frame.convertTo(draw_target, CV_8U);
//    } else {
//        draw_target = frame;
//    }
//
//    for (size_t i = 0; i < total; ++i) {
//        const auto& shot = session_history[i];
//
//        std::vector<cv::Point> adjusted_contour;
//        adjusted_contour.reserve(shot.contour.size());
//        for (const auto& pt : shot.contour)
//            adjusted_contour.emplace_back(pt + offset);
//
//        cv::Moments mu = cv::moments(adjusted_contour, false);
//        cv::Point center;
//        if (std::abs(mu.m00) > 1e-6) {
//            center = cv::Point(static_cast<int>(mu.m10 / mu.m00),
//                               static_cast<int>(mu.m01 / mu.m00));
//        } else {
//            cv::Rect br = cv::boundingRect(adjusted_contour);
//            center = (br.tl() + br.br()) * 0.5;
//        }
//
//        const bool is_last = (i == total - 1);
//
//        if (!is_last) {
//            // **FIX 2: Increase thickness for better antialiasing**
//            cv::circle(draw_target, center, OUTER_RADIUS, cv::Scalar(0, 0, 0), 2, LINE_TYPE);
//            cv::circle(draw_target, center, INNER_RADIUS, cv::Scalar(0, 0, 255), 2, LINE_TYPE);
//        } else {
//            cv::circle(draw_target, center, GREEN_RADIUS, cv::Scalar(0, 255, 0), 2, LINE_TYPE);
//        }
//    }
//
//    // Copy back if we converted
//    if (draw_target.data != frame.data) {
//        draw_target.copyTo(frame);
//    }
//};

    long long start = get_now();

    TargetZoneDetector tz_detector(frame_width, frame_height);
    TargetZoneDetector calibration_detector(frame_width, frame_height, 1);
    Scorer scorer;
    int32_t prev_frame_index = -1;
    int32_t frame_index = 0;
    last_score_out = -1;
    int32_t detect_only = 1;
    int max_size = 1024;
//  platform_log("Frame_C width: %d frame height: %d", frame_width, frame_height);
//  platform_log("Frame_type : %d", input_buffer);
    uint8_t *input_base = input_buffer;
    uint8_t *output_base = output_buffer;
    uint8_t *detect_only_base = detect_only_buffer;
    is_running = true;
    is_paused = false;
    is_ble = false;
    int circleCount = 0;
    direction_s = -1;
    score_s = -1;
    setup_valid = false;
    geometry_fixed = false;
    roi_initialized = false;
    calibration_check_counter = 0;
    last_detected_ellipses.clear();
    session_history.clear();
    global_shot_counter = 0;
    g_screenshot_data.clear();
    g_has_new_screenshot = false;
    g_screenshot_shot_number = 0;
    session_started = false;

//    cv::VideoWriter writer(output_path, cv::VideoWriter::fourcc('H', '2', '6', '4'), 10, cv::Size(frame_width, frame_height));


    while (is_running)
    {
        frame_count++;
        frame_start_time = std::chrono::high_resolution_clock::now();
        long memory_before = getCurrentMemoryKB();
        while (is_paused)
            sleep_ms(100);
        input_mtx.lock();
        input_buffer = input_base;
        int32_t raw_idx = readInt32FromBuffer(input_buffer);
//        platform_log("FRAME_DEBUG: raw_idx=%d, prev=%d", raw_idx, prev_frame_index);

        if (raw_idx < 0 || raw_idx == prev_frame_index) {
//            platform_log("DUPLICATE: Skipping frame %d (prev was %d)", raw_idx, prev_frame_index);
            input_mtx.unlock();
            sleep_ms(40);
            continue;
        }
        auto frame_decode_start = std::chrono::high_resolution_clock::now();


        last_score_out = -1;
        frame_index = raw_idx;
        input_buffer += sizeof(int32_t);
//        fps = readInt32FromBuffer(input_buffer);
        input_buffer += sizeof(int32_t) * 2;
        int n_bytes = readInt32FromBuffer(input_buffer);
        input_buffer += sizeof(int32_t);
        std::vector<uint8_t> tmp(input_buffer, input_buffer + n_bytes);

        if (tmp.empty()) {
            input_mtx.unlock();
            sleep_ms(40);
            continue;
        }

        // decode frame
//        cv::Mat frame = cv::imdecode(tmp, cv::IMREAD_UNCHANGED);
        cv::imdecode(tmp, cv::IMREAD_UNCHANGED).copyTo(reusable_frame);
        cv::Mat& frame = reusable_frame;  // Use reference to avoid copies
        input_mtx.unlock();

        auto frame_decode_end = std::chrono::high_resolution_clock::now();
        auto decode_time = std::chrono::duration_cast<std::chrono::microseconds>(frame_decode_end - frame_decode_start);


        if (frame.empty()) {
            sleep_ms(40);
            continue;
        }
        int h = frame.rows, w = frame.cols;
        if (w >= frame_width && h >= frame_height) {
            int pad_x = (w - frame_width)/2;
            frame = frame(cv::Rect(pad_x,0,frame_width,frame_height));
        }

        double ratio = static_cast<double>(max_size) / std::max(h, w);
        if (ratio < 1)
        {
            int new_h = static_cast<int>(ratio * h);
            int new_w = static_cast<int>(ratio * w);
            cv::resize(frame, frame, cv::Size(new_w, new_h));
        }
        double t0 = double(cv::getTickCount());

        cv::cvtColor(frame, reusable_gray, cv::COLOR_BGR2GRAY);
        cv::Mat& frame_gray = reusable_gray;

        detect_only_mtx.lock();
        detect_only = readInt32FromBuffer(detect_only_base);
        detect_only_mtx.unlock();

        long memory_after_decode = getCurrentMemoryKB();
//        writer.write(frame);

        if (detect_only)
        {
            single_time_call = true;
            if (++calibration_check_counter >= CALIBRATION_CHECK_INTERVAL)
            {
                calibration_check_counter = 0;
//                    last_detected_ellipses = calibration_detector._detect(frame_gray);
                // Track FLED processing time
                fled_start_time = std::chrono::high_resolution_clock::now();
                last_detected_ellipses = calibration_detector._detect(frame_gray);
                fled_end_time = std::chrono::high_resolution_clock::now();

                auto fled_time = std::chrono::duration_cast<std::chrono::microseconds>(fled_end_time - fled_start_time);

//                platform_log("FLED_DETECT: Frame#%d, Ellipses=%zu, Time=%ldμs",
//                             frame_index, last_detected_ellipses.size(), fled_time.count());



                bool new_valid = false;
                if (last_detected_ellipses.size() >= MIN_RINGS_REQUIRED)
                {
                    new_valid = true;
                    for (auto &e : last_detected_ellipses)
                    {
                        float ar = std::max(e.size.width, e.size.height) /
                                   std::min(e.size.width, e.size.height);
                        if (ar >= MAX_ASPECT_RATIO) { new_valid = false; break; }
                    }
                }
                setup_valid = new_valid;
//                platform_log("Calib valid: %zu rings? %s",
//                             last_detected_ellipses.size(),
//                             setup_valid?"yes":"no");
            }
            cv::Scalar ring_color;
            if (setup_valid) {

                    approved_geometry = last_detected_ellipses;

                ring_color = cv::Scalar(0, 255, 0);
                cv::putText(frame, "Good setup! Switch to scoring to confirm",
                            cv::Point(50, 70), cv::FONT_HERSHEY_SIMPLEX, 0.4, cv::Scalar(0, 255, 0), 1, cv::LINE_AA);
                cv::putText(frame, "Rings are circular and well detected",
                            cv::Point(50, 100), cv::FONT_HERSHEY_SIMPLEX, 0.3, cv::Scalar(255, 255, 255), 1, cv::LINE_AA);
                circleCount = int(last_detected_ellipses.size());
            }else {
                ring_color = cv::Scalar(0, 0, 255);
                cv::putText(frame, "Adjust camera to see target clearly",
                            cv::Point(50, 70), cv::FONT_HERSHEY_SIMPLEX, 0.6, cv::Scalar(0, 0, 255), 2, cv::LINE_AA);
                cv::putText(frame, "Need at least 6 rings visible",
                            cv::Point(50, 100), cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(255, 255, 255), 1, cv::LINE_AA);
                circleCount = 0;
            }
            for (auto &e : last_detected_ellipses)
                cv::ellipse(frame, e, ring_color, 1, cv::LINE_AA);
            last_score_out = -1;
            draw_history(frame);
        }
        else // SCORING MODE
        {
            if (!geometry_fixed) {
                if (setup_valid && !approved_geometry.empty()) {
                    tz_detector.set_user_approved_geometry(
                            approved_geometry);  // :white_check_mark: Add this
                    for (int i = 0; i < 10; ++i)
                        tz_detector.prepare(frame, frame_gray);
                    geometry_fixed = true;
                }
            }
//            if (geometry_fixed && !roi_initialized){
//                auto center = tz_detector.get_current_target_center();
//                auto zone = tz_detector.get_target_zone_info();
//                if (zone.count("ellipses") && !zone["ellipses"].empty()) {  // FIX 2: Add empty check
//                    tz_detector.enable_roi_mode(center, frame.size(), zone["ellipses"]);
//                    roi_initialized = true;  // FIX 2: Move inside if condition
//                }
//                // FIX 2: Don't set roi_initialized = true if setup fails
//            }

            int numE = tz_detector.process(frame, frame_gray);
            if (numE > 0 && !tz_detector.is_shifting()) {
                auto rings = tz_detector.get_ellipses_for_scoring();
                if (!rings.empty()) {
//                    cv::Mat clean_frame = frame.clone();

                    // Draw rings on full frame
                    size_t history_before = scorer.get_history().size();
                    // Process on full frame
                    last_score_out = scorer.process(frame.clone(), frame_gray, {{"ellipses", rings}},
                                                    frame_index * 33, is_ble);
//                    platform_log("[MAIN CODE] Score received: %d", last_score_out);

                    size_t history_after = scorer.get_history().size();
                    if (history_after > history_before && last_score_out >= 0) {

                        capture_shot(scorer, frame.clone(), cv::Point(0, 0)); // No offset
                    }
                    for (auto &e: rings) {
                        cv::ellipse(frame, e, cv::Scalar(255, 255, 255), 1, cv::LINE_AA);
                    }
                    draw_history(frame); // No offset
                }
            }

        }
///Old
//        double t1 = double(cv::getTickCount());
//        //+" fps:"+std::to_string(runningFps)
//        int runningFps = cvRound(cv::getTickFrequency()/(t1-t0));
//        cv::putText(frame, "#frame "+std::to_string(frame_index),
//                    cv::Point(50,50), cv::FONT_HERSHEY_COMPLEX, 0.7,
//                    cv::Scalar(0,255,0),1,cv::LINE_AA);
//        if (ratio < 1)
//        {
//            cv::resize(frame, frame, cv::Size(frame_width, frame_height));
//        }
//double t1 = static_cast<double>(cv::getTickCount());
//double dt  = t1 - t0;
//double freq = cv::getTickFrequency();
//int runningFps = (dt > 0) ? cvRound(freq / dt) : 0;
//t0 = t1; // update for next frame
//
//// ---- draw stream status dot (green when alive, red when stalled) ----
//const bool isAlive = (runningFps >= 1);
//const cv::Scalar statusColor = isAlive ? cv::Scalar(0, 255, 0)   // green
//                                       : cv::Scalar(0,   0, 255); // red
//// small filled circle at top-left
//cv::circle(frame, cv::Point(20, 20), 8, statusColor, cv::FILLED, cv::LINE_AA);
//// optional subtle outline for contrast
//cv::circle(frame, cv::Point(20, 20), 8, cv::Scalar(30,30,30), 1, cv::LINE_AA);

// (optional) keep a tiny FPS readout if you still want it:
/// cv::putText(frame, "FPS: " + std::to_string(runningFps),
///             cv::Point(36, 26), cv::FONT_HERSHEY_SIMPLEX, 0.45,
///             cv::Scalar(220,220,220), 1, cv::LINE_AA);

if (ratio < 1) {
cv::resize(frame, frame, cv::Size(frame_width, frame_height));
}



///For_Memory
        auto frame_end_time = std::chrono::high_resolution_clock::now();
        auto total_frame_time = std::chrono::duration_cast<std::chrono::microseconds>(frame_end_time - frame_start_time);
        long memory_end = getCurrentMemoryKB();

        if (memory_end > peak_memory_kb) {
            peak_memory_kb = memory_end;
        }

        // Log every frame with detailed breakdown
//        platform_log("FRAME_PERF: #%d | Total=%ldμs | Decode=%ldμs | MemStart=%ldKB | MemEnd=%ldKB | MemDelta=%ldKB | Peak=%ldKB",
//                     frame_index,
//                     total_frame_time.count(),
//                     decode_time.count(),
//                     memory_before,
//                     memory_end,
//                     memory_end - memory_before,
//                     peak_memory_kb);

        // Log summary every 50 frames
        if (frame_count % 50 == 0) {
//            platform_log("SUMMARY_50: AvgFrameTime=%ldμs, PeakMemory=%ldKB",
//                         total_frame_time.count(), peak_memory_kb);
        }

        mtx.lock();
        output_buffer = output_base;
        std::memcpy(output_buffer, &frame_index, sizeof(frame_index));
        output_buffer += sizeof(frame_index);

        std::memcpy(output_buffer, &direction_s, sizeof(direction_s));
        output_buffer += sizeof(direction_s);

        int32_t out_score = detect_only ? circleCount : score_s;
        std::memcpy(output_buffer, &out_score, sizeof(out_score));
        output_buffer += sizeof(out_score);


        if ( score_s >= 0) {
            int32_t screenshot_sz = static_cast<int32_t>(g_screenshot_data.size());
            std::memcpy(output_buffer, &screenshot_sz, sizeof(screenshot_sz));
            output_buffer += sizeof(screenshot_sz);
            std::memcpy(output_buffer, g_screenshot_data.data(), screenshot_sz);
            output_buffer += screenshot_sz;
            direction_s = -1;
            score_s = -1;

        }
        else {
            cv::imencode(".png", frame, reusable_buffer);
            int32_t sz = static_cast<int32_t>(reusable_buffer.size());
            std::memcpy(output_buffer, &sz, sizeof(sz));
            output_buffer += sizeof(sz);
            std::memcpy(output_buffer, reusable_buffer.data(), sz);
            output_buffer += sz;
            reusable_buffer.clear();
            frame.release();       // Release the decoded frame
            frame_gray.release();  // Release the converted grayscale frame
            direction_s = -1;
            score_s = -1;

        }

        mtx.unlock();

    }
//    write_list_to_file(output_path);
    platform_log("=== SESSION CLEANUP COMPLETED ===1");
//    writer.release();

    if (mats_initialized) {
        reusable_frame.release();
        reusable_gray.release();
        reusable_buffer.clear();
        reusable_buffer.shrink_to_fit();
        mats_initialized = false;
        platform_log("=== SESSION CLEANUP COMPLETED ===");

    }
    else{
        platform_log("=== SESSION CLEANUP COMPLETED ===ELSE");

    }
    platform_log("Processing done in %dms", int(get_now()-start));
    global_shot_counter = 0;
    session_started = false;
    // 2. Clear screenshot data
    g_screenshot_data.clear();
    g_screenshot_data.shrink_to_fit();
    g_has_new_screenshot = false;
    g_screenshot_shot_number = 0;
//    clearList();
    is_running = false;
    return 0;
}


FUNCTION_ATTRIBUTE
    void lock()
    {
        mtx.lock();
    }

    FUNCTION_ATTRIBUTE
    void unlock()
    {
        mtx.unlock();
    }

    FUNCTION_ATTRIBUTE
    void inputLock()
    {
        input_mtx.lock();
    }

    FUNCTION_ATTRIBUTE
    void inputUnlock()
    {
        input_mtx.unlock();
    }

    FUNCTION_ATTRIBUTE
    void detectOnlyLock()
    {
        detect_only_mtx.lock();
    }

    FUNCTION_ATTRIBUTE
    void detectOnlyUnlock()
    {
        detect_only_mtx.unlock();
    }

    FUNCTION_ATTRIBUTE
    void lastScoreLock()
    {
        last_score_mtx.lock();
    }

    FUNCTION_ATTRIBUTE
    void lastScoreUnlock()
    {
        last_score_mtx.unlock();
    }

    FUNCTION_ATTRIBUTE
    void isBleStop()
    {
        std::lock_guard<std::mutex> lock(control_ble);
        is_ble = false;
    }
    FUNCTION_ATTRIBUTE
    void isBleActive()
    {
        std::lock_guard<std::mutex> lock(control_ble);
        is_ble = true;
    }
    FUNCTION_ATTRIBUTE
    void pauseS()
    {
        std::lock_guard<std::mutex> lock(control_mtx);
        is_paused = true;
    }

    FUNCTION_ATTRIBUTE
    void resumeS()
    {
        std::lock_guard<std::mutex> lock(control_mtx);
        is_paused = false;
    }

    FUNCTION_ATTRIBUTE
    void stop()
    {
        is_running = false;
    }
}