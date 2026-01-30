
#include "platform_log.h"
#include <cstdarg>
#include <cstdio>      // for vprintf
#ifdef __ANDROID__
#include <android/log.h>
#elif defined(_WIN32)
#include <windows.h>
#endif

void platform_log(const char *fmt, ...)
{
    va_list args;
    va_start(args, fmt);

#ifdef __ANDROID__
    __android_log_vprint(ANDROID_LOG_VERBOSE, "ndk", fmt, args);
#elif defined(_WIN32)
    char buf[4096];
    _vsnprintf_s(buf, sizeof(buf), _TRUNCATE, fmt, args);
    OutputDebugStringA(buf);
#else
    vprintf(fmt, args);
    putchar('\n');  // flush line on POSIX
#endif

    va_end(args);
}
