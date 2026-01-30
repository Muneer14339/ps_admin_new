package com.devzza.flutter_usb_camera
import android.util.Log

/**
 * Created by: --- Mahmoud Ramzy
 * Email: -------- mahmoudramzy400@gmail.com
 * Date: --------- 29/08/2025
 */

object TurboBridge {
    @Volatile
    var available: Boolean = false
        private set

    init {
        try {
            try {
                System.loadLibrary("jpeg-turbo1500") // loads libjpeg-turbo1500.so
            } catch (t: Throwable) {
                // ignore; the loader usually resolves DT_NEEDED automatically
            }
            System.loadLibrary("turbo_bridge")
            available = nativeAvailable()
        } catch (t: Throwable) {
            available = false
            Log.w("TurboBridge", "Failed to load turbo_bridge: ${t.message}")
        }
    }

    @JvmStatic external fun nativeAvailable(): Boolean
    @JvmStatic external fun reencodeBaseline(jpeg: ByteArray, quality: Int): ByteArray?
    @JvmStatic external fun decodeCropReencode(jpeg: ByteArray, targetW: Int, targetH: Int, quality: Int): ByteArray?
}
