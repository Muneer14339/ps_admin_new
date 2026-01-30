
#pragma once

// Detect platform for attributes
#if defined(__GNUC__)
#define FUNCTION_ATTRIBUTE __attribute__((visibility("default"))) __attribute__((used))
#elif defined(_MSC_VER)
#define FUNCTION_ATTRIBUTE __declspec(dllexport)
#else
#define FUNCTION_ATTRIBUTE
#endif

#include <cstdarg>

// Declare the logger
extern "C" {
FUNCTION_ATTRIBUTE void platform_log(const char *fmt, ...);
}
