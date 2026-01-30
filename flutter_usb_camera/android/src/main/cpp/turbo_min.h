//
// Created by Mahmoud Ramzy on 29/08/2025.
//
#ifndef TURBO_MIN_H
#define TURBO_MIN_H

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Handle */
typedef void* tjhandle;

/* Pixel formats (subset) */
#define TJPF_RGB 0

/* Subsampling */
#define TJSAMP_444 0
#define TJSAMP_422 1
#define TJSAMP_420 2

/* Flags (subset) */
#define TJFLAG_FASTUPSAMPLE 512
#define TJFLAG_FASTDCT 2048

/* Lossless transform ops/options */
#define TJXOP_NONE 0
#define TJXOPT_CROP 1

/* Regions and transform structs */
typedef struct tjregion {
    int x; int y; int w; int h;
} tjregion;

typedef struct tjtransform {
    tjregion r;
    int op;
    int options;
    void* data;
    void* customFilter;
} tjtransform;

/* ---- API we use (compatible with libjpeg-turbo 1.5.x) ---- */

/* Errors (only the global error string; avoid tjGetErrorStr2) */
const char* tjGetErrorStr(void);

/* Decompress */
tjhandle tjInitDecompress(void);
int tjDecompressHeader3(tjhandle handle, const unsigned char* jpegBuf, unsigned long jpegSize,
                        int* width, int* height, int* jpegSubsamp, int* jpegColorspace);
int tjDecompress2(tjhandle handle, const unsigned char* jpegBuf, unsigned long jpegSize,
                  unsigned char* dstBuf, int width, int pitch, int height, int pixelFormat, int flags);

/* Compress */
tjhandle tjInitCompress(void);
int tjCompress2(tjhandle handle, const unsigned char* srcBuf, int width, int pitch, int height, int pixelFormat,
                unsigned char** jpegBuf, unsigned long* jpegSize, int jpegSubsamp, int jpegQual, int flags);

/* Lossless transform */
tjhandle tjInitTransform(void);
int tjTransform(tjhandle handle, const unsigned char* jpegBuf, unsigned long jpegSize, int n,
                unsigned char** dstBufs, unsigned long* dstSizes, tjtransform* transforms, int flags);

/* Common */
int tjDestroy(tjhandle handle);
void tjFree(unsigned char* buffer);

#ifdef __cplusplus
}
#endif
#endif
