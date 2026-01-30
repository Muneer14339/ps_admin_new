//
// Created by Mahmoud Ramzy on 29/08/2025.
//
#include <jni.h>
#include <android/log.h>
#include <vector>
#include <cstring>
#include "turbo_min.h"

#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, "turbo_bridge", __VA_ARGS__)
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO,  "turbo_bridge", __VA_ARGS__)

static jbyteArray makeJByteArray(JNIEnv* env, const unsigned char* data, unsigned long size) {
    jbyteArray arr = env->NewByteArray((jsize)size);
    if (!arr) return nullptr;
    env->SetByteArrayRegion(arr, 0, (jsize)size, reinterpret_cast<const jbyte*>(data));
    return arr;
}

static jbyteArray copyJavaByteArray(JNIEnv* env, jbyteArray src) {
    jsize len = env->GetArrayLength(src);
    if (len <= 0) return nullptr;
    std::vector<unsigned char> tmp((size_t)len);
    env->GetByteArrayRegion(src, 0, len, reinterpret_cast<jbyte*>(tmp.data()));
    return makeJByteArray(env, tmp.data(), (unsigned long)tmp.size());
}

/* MCU size helper for center crop alignment */
static void mcuSizeForSubsample(int subsamp, int* mw, int* mh) {
    switch (subsamp) {
        case TJSAMP_420: *mw = 16; *mh = 16; break;
        case TJSAMP_422: *mw = 16; *mh = 8;  break;
        default:         *mw = 8;  *mh = 8;  break; /* 444/gray/fallback */
    }
}

/* Ping so Kotlin can verify library availability */
extern "C"
JNIEXPORT jboolean JNICALL
Java_com_devzza_flutter_1usb_1camera_TurboBridge_nativeAvailable(JNIEnv*, jclass) {
    return JNI_TRUE;
}

/* Optional: baseline reencode via decode+encode (kept for completeness) */
extern "C"
JNIEXPORT jbyteArray JNICALL
Java_com_devzza_flutter_1usb_1camera_TurboBridge_reencodeBaseline(
        JNIEnv* env, jclass, jbyteArray jJpeg, jint quality) {

    jsize len = env->GetArrayLength(jJpeg);
    if (len <= 0) return nullptr;

    std::vector<unsigned char> inJpeg((size_t)len);
    env->GetByteArrayRegion(jJpeg, 0, len, reinterpret_cast<jbyte*>(inJpeg.data()));

    tjhandle dec = tjInitDecompress();
    if (!dec) { LOGE("tjInitDecompress failed"); return nullptr; }

    int w=0,h=0,subsamp=0,colorspace=0;
    if (tjDecompressHeader3(dec, inJpeg.data(), (unsigned long)inJpeg.size(), &w, &h, &subsamp, &colorspace) != 0) {
        LOGE("tjDecompressHeader3 failed: %s", tjGetErrorStr());
        tjDestroy(dec); return nullptr;
    }

    const int pf = TJPF_RGB;
    const int pitch = w * 3;
    std::vector<unsigned char> rgb((size_t)pitch * h);

    if (tjDecompress2(dec, inJpeg.data(), (unsigned long)inJpeg.size(),
                      rgb.data(), w, pitch, h, pf, TJFLAG_FASTUPSAMPLE | TJFLAG_FASTDCT) != 0) {
        LOGE("tjDecompress2 failed: %s", tjGetErrorStr());
        tjDestroy(dec); return nullptr;
    }
    tjDestroy(dec);

    tjhandle comp = tjInitCompress();
    if (!comp) { LOGE("tjInitCompress failed"); return nullptr; }

    unsigned char* outJpeg = nullptr;
    unsigned long outSize = 0;
    if (tjCompress2(comp, rgb.data(), w, pitch, h, pf,
                    &outJpeg, &outSize, TJSAMP_420, quality, TJFLAG_FASTDCT) != 0) {
        LOGE("tjCompress2 failed: %s", tjGetErrorStr());
        tjDestroy(comp); if (outJpeg) tjFree(outJpeg); return nullptr;
    }
    tjDestroy(comp);

    jbyteArray result = makeJByteArray(env, outJpeg, outSize);
    tjFree(outJpeg);
    return result;
}

/* Center crop using LOSSLESS transform (MCU-aligned). If no crop requested, return original bytes. */
extern "C"
JNIEXPORT jbyteArray JNICALL
Java_com_devzza_flutter_1usb_1camera_TurboBridge_decodeCropReencode(
        JNIEnv* env, jclass, jbyteArray jJpeg, jint targetW, jint targetH, jint /*quality*/) {

    jsize len = env->GetArrayLength(jJpeg);
    if (len <= 0) return nullptr;

    // If no crop was requested, just return a copy of original MJPEG (fast path)
    if (targetW <= 0 || targetH <= 0) {
        return copyJavaByteArray(env, jJpeg);
    }

    std::vector<unsigned char> inJpeg((size_t)len);
    env->GetByteArrayRegion(jJpeg, 0, len, reinterpret_cast<jbyte*>(inJpeg.data()));

    tjhandle dec = tjInitDecompress();
    if (!dec) { LOGE("tjInitDecompress failed"); return nullptr; }

    int w=0,h=0,subsamp=0,colorspace=0;
    if (tjDecompressHeader3(dec, inJpeg.data(), (unsigned long)inJpeg.size(), &w, &h, &subsamp, &colorspace) != 0) {
        LOGE("tjDecompressHeader3 failed: %s", tjGetErrorStr());
        tjDestroy(dec); return nullptr;
    }
    tjDestroy(dec);

    // Desired crop clamped to image bounds
    int cw = (targetW > 0 && targetW < w) ? targetW : w;
    int ch = (targetH > 0 && targetH < h) ? targetH : h;

    // MCU-align center crop for lossless transform
    int mw=8, mh=8; mcuSizeForSubsample(subsamp, &mw, &mh);
    int cx = (w - cw) / 2;
    int cy = (h - ch) / 2;

    int ax = (cx / mw) * mw;
    int ay = (cy / mh) * mh;
    int aw = ((cw + (cx - ax)) / mw) * mw;
    int ah = ((ch + (cy - ay)) / mh) * mh;

    if (aw <= 0 || ah <= 0) {
        LOGE("Aligned crop became empty (aw=%d, ah=%d) — returning original", aw, ah);
        return copyJavaByteArray(env, jJpeg);
    }
    if (ax + aw > w) aw = ((w - ax) / mw) * mw;
    if (ay + ah > h) ah = ((h - ay) / mh) * mh;
    if (aw <= 0 || ah <= 0) {
        LOGE("Aligned crop clipped to empty after bounds check — returning original");
        return copyJavaByteArray(env, jJpeg);
    }

    tjtransform xform{};
    xform.r.x = ax; xform.r.y = ay; xform.r.w = aw; xform.r.h = ah;
    xform.op = TJXOP_NONE;
    xform.options = TJXOPT_CROP;
    xform.data = nullptr;
    xform.customFilter = nullptr;

    unsigned char* outBuf = nullptr;
    unsigned long outSize = 0;

    tjhandle t = tjInitTransform();
    if (!t) { LOGE("tjInitTransform failed"); return nullptr; }

    if (tjTransform(t, inJpeg.data(), (unsigned long)inJpeg.size(), 1,
                    &outBuf, &outSize, &xform, 0) != 0) {
        LOGE("tjTransform failed: %s (subsamp=%d, mcu=%dx%d, rect=%d,%d %dx%d)",
             tjGetErrorStr(), subsamp, mw, mh, ax, ay, aw, ah);
        tjDestroy(t);
        if (outBuf) tjFree(outBuf);
        return nullptr;
    }
    tjDestroy(t);

    jbyteArray result = makeJByteArray(env, outBuf, outSize);
    tjFree(outBuf);
    return result;
}
