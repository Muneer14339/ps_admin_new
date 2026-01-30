//#include "Logger.h"
//#include <vector>
//#include <mutex>
//#include <fstream>
//#include <iostream>
//#include <cstdarg>
//#include "platform_log.h"
//
//
//namespace {
//    std::vector<std::string> globalList;
//    std::mutex listMutex;
//
//    void add_to_list(const char* value) {
//        std::lock_guard<std::mutex> lock(listMutex);
//        globalList.push_back(std::string(value));
//    }
//}
//
//void log_and_addf(const char* format, ...) {
//    va_list args;
//    va_start(args, format);
//    int size = vsnprintf(nullptr, 0, format, args);
//    va_end(args);
//
//    if (size <= 0) return;
//
//    std::string buffer(size, '\0');
//    va_start(args, format);
//    vsnprintf(&buffer[0], buffer.size() + 1, format, args);
//    va_end(args);
//
//    add_to_list(buffer.c_str());
//}
//
//void log_and_add_str(const std::string& msg) {
//    add_to_list(msg.c_str());
//}
//
//void write_list_to_file(const char* filePath) {
//    std::vector<std::string> copy;
//    {
//        std::lock_guard<std::mutex> lock(listMutex);
//        copy.swap(globalList); // clears globalList efficiently
//    }
//
//    std::ofstream out(filePath);
//    if (!out.is_open()) {
//        platform_log("❌ Failed to open file: %s", filePath);
//        return;
//    }
//
//    platform_log("📝 Writing %zu logs to: %s", copy.size(), filePath);
//
//    for (size_t i = 0; i < copy.size(); i++) {
//        out << copy[i] << "\n";
//        platform_log("[%zu/%zu] %s", i + 1, copy.size(), copy[i].c_str());
//    }
//
//    platform_log("✅ File written: %s (total %zu logs)", filePath, copy.size());
//}
//
//void free_list() {
//    std::lock_guard<std::mutex> lock(listMutex);
//    globalList.clear();
//    globalList.shrink_to_fit();
//}
