package com.devzza.flutter_usb_camera.utils.extensions

import com.herohan.uvcapp.CameraHelper
import com.serenegiant.usb.Size
import com.serenegiant.usb.UVCCamera
import kotlin.collections.forEach
import kotlin.collections.isNullOrEmpty


/**
 * Created by: --- Mahmoud Ramzy
 * Email: -------- mahmoudramzy400@gmail.com
 * Date: --------- 24/06/2025
 */


fun CameraHelper.sizeList30Fps(): MutableList<Size> {
    val size30FpsList: MutableList<Size> = mutableListOf()

    if (supportedSizeList.isNullOrEmpty()) return size30FpsList

    supportedSizeList?.forEach { size ->
        if (size.fps >= 30)
            size30FpsList.add(size)
    }

    return size30FpsList
}


fun CameraHelper.getBestSize30Fps(): Size? {
    var bestSize: Size? = null
    var bestWidth = 0
    var bestHeight = 0

    sizeList30Fps().forEach { size ->
        // loop through sizes
        if (size.width + size.height > (bestWidth + bestHeight)) {
            bestSize = size
            bestWidth = size.width
            bestHeight = size.height
        }
    }

    return bestSize
}



fun CameraHelper.pick72030Fps(): Size? {
    return supportedSizeList
        ?.firstOrNull { s ->
            s.width == 1280 &&
                    s.height == 720 &&
                    s.fps >= 30 &&
                    s.type == UVCCamera.UVC_VS_FRAME_MJPEG
        }
        ?.apply { fps = 30 }
}




fun CameraHelper.pick1080_30Fps(): Size? {
    return supportedSizeList
        ?.firstOrNull { s ->
            s.width == 1920 &&
                    s.height == 1080 &&
                    s.fps >= 30 &&
                    s.type == UVCCamera.UVC_VS_FRAME_MJPEG
        }
        ?.apply { fps = 30 }
}