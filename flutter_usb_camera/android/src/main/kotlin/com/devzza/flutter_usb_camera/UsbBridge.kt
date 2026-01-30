package com.devzza.flutter_usb_camera

/**
 * Created by: --- Mahmoud Ramzy
 * Email: -------- mahmoudramzy400@gmail.com
 * Date: --------- 24/08/2025
 */


/**
 * Bridge between the camera manager and the Flutter plugin.
 * No UI. Thread-safe, minimal globals.
 */
object UsbBridge {
    @Volatile var fps: Int = 30
    @Volatile var cropWidth: Int = 0
    @Volatile var cropHeight: Int = 0
}

