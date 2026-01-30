package com.devzza.flutter_usb_camera


import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.hardware.usb.UsbDevice
import android.os.Handler
import android.os.HandlerThread
import android.os.Looper
import android.util.Log
import com.devzza.flutter_usb_camera.FlutterUsbCameraPlugin.Companion.frameSink
import com.devzza.flutter_usb_camera.utils.extensions.pick72030Fps
import com.herohan.uvcapp.CameraHelper
import com.herohan.uvcapp.ICameraHelper
import com.serenegiant.usb.IFrameCallback
import com.serenegiant.usb.UVCCamera
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer
import java.util.concurrent.atomic.AtomicBoolean
import kotlin.math.max
import kotlin.math.min
import com.devzza.flutter_usb_camera.FlutterUsbCameraPlugin.Companion.stateSink

/**
 * Created by: --- Mahmoud Ramzy
 * Email: -------- mahmoudramzy400@gmail.com
 * Date: --------- 28/08/2025
 */


class UsbCameraManager(private val context: android.content.Context) : ICameraHelper.StateCallback,
    IFrameCallback {

    companion object {
        const val onAttachEvent: String = "attach"
        const val onDeviceOpenEvent = "device_open"
        const val onCameraOpenEvent = "camera_open"
        const val onCameraCloseEvent = "camera_close"
        const val onDeviceCloseEvent = "device_close"
        const val onDetachEvent = "detach"
        const val onCancelEvent = "cancel"

    }

    private val TAG = "UsbCameraManager"
    private lateinit var cameraHelper:CameraHelper

    private val mainHandler = Handler(Looper.getMainLooper())
    private val workerThread = HandlerThread("TurboWorker").apply { start() }
    private val worker = Handler(workerThread.looper)

    private val busy = AtomicBoolean(false)

    @Volatile
    private var lastEmitNs = 0L
    private val frameIntervalNs: Long
        get() = if (UsbBridge.fps > 0) 1_000_000_000L / UsbBridge.fps else 0L

    private val JPEG_QUALITY = 85

    fun start() {
        Log.d(
            TAG, "start() fps=${UsbBridge.fps} crop=${UsbBridge.cropWidth}x${UsbBridge.cropHeight}"
        )

        cameraHelper = CameraHelper()
        cameraHelper.setStateCallback(this)
    }

    fun stop() {
        Log.d(TAG, "stop()")
        try {
            cameraHelper.stopPreview()
        } catch (_: Throwable) {
        }

        try {
            cameraHelper.setFrameCallback(null, 0)
        } catch (_: Throwable) {
        }

        try {
            cameraHelper.release()
        } catch (_: Throwable) {
        }

        busy.set(false)
    }

    private var shouldPreview = true
    fun pausePreview() {
        if (shouldPreview) {
            shouldPreview = false

            if (cameraHelper.isCameraOpened)
                cameraHelper.stopPreview()
        }

    }

    fun resumePreview() {
        if (!shouldPreview) {
            shouldPreview = true

            if (cameraHelper.isCameraOpened)
                cameraHelper.startPreview()
        }
    }

    // ---- Camera state ----
    override fun onAttach(device: UsbDevice?) {
        //Send to Flutter
        if (shouldPreview) {
            sendState(onAttachEvent, device)
            cameraHelper.selectDevice(device)
        }


    }

    override fun onDeviceOpen(device: UsbDevice?, isFirstOpen: Boolean) {
        //Send to Flutter
        if (shouldPreview) {
            sendState(onDeviceOpenEvent, device)
            cameraHelper.openCamera()
        }

    }

    override fun onCameraOpen(device: UsbDevice?) {
        //Send to Flutter
        if (shouldPreview) {
            sendState(onCameraOpenEvent, device)
            val s = cameraHelper.pick72030Fps()
            s?.let {
                if (UsbBridge.fps > 0) it.fps = UsbBridge.fps
                cameraHelper.previewSize = it
                Log.d(TAG, "preview=${it.width}x${it.height}@${it.fps} (MJPEG)")
            }
            cameraHelper.setFrameCallback(this, UVCCamera.PIXEL_FORMAT_RAW)
            cameraHelper.startPreview()
        }
    }

    override fun onCameraClose(device: UsbDevice?) {
        //Send to Flutter
        sendState(onCameraCloseEvent, device)
    }

    override fun onDeviceClose(device: UsbDevice?) {
        //Send to Flutter
        sendState(onDeviceCloseEvent, device)
    }

    override fun onDetach(device: UsbDevice?) {
        //Send to Flutter
        sendState(onDetachEvent, device)
    }

    override fun onCancel(device: UsbDevice?) {
        //Send to Flutter
        sendState(onCancelEvent, device)
    }

    // ---- Frames ----
    override fun onFrame(frame: ByteBuffer?) {
        if (frame == null || frame.remaining() <= 0) return

        val fi = frameIntervalNs
        if (fi > 0) {
            val now = System.nanoTime()
            if (now - lastEmitNs < (fi * 8L / 10L)) return
        }
        if (!busy.compareAndSet(false, true)) return

        val len = frame.remaining()
        val src = ByteArray(len)
        if (frame.hasArray()) {
            val arr = frame.array()
            val off = frame.arrayOffset() + frame.position()
            System.arraycopy(arr, off, src, 0, len)
        } else {
            frame.get(src)
        }

        worker.post {
            try {
                val clean = sliceToJpeg(src) ?: src
                val srcDim = jpegDim(clean)
                val cw = UsbBridge.cropWidth
                val ch = UsbBridge.cropHeight

                val wantCrop = cw > 0 && ch > 0
                val wantSquare = wantCrop && cw == ch

                var outJpeg: ByteArray? = null

                if (wantCrop) {
                    // Try fast lossless center crop
                    outJpeg = TurboBridge.decodeCropReencode(clean, cw, ch, JPEG_QUALITY)
                    val outDim = outJpeg?.let { jpegDim(it) }

                    // If Turbo returned the same size as source (no effective crop), force exact crop via Android path
                    if (outDim == null || (srcDim != null && outDim.first == srcDim.first && outDim.second == srcDim.second)) {
                        Log.w(
                            TAG,
                            "Turbo crop produced no size change (src=${srcDim} -> out=${outDim}), forcing exact crop"
                        )
                        outJpeg = decodeCropAndroid(clean, cw, ch, wantSquare, JPEG_QUALITY)
                    } else if (wantSquare && outDim.first != outDim.second) {
                        // If caller requested perfect square and Turbo alignment made it non-square, enforce square
                        Log.i(
                            TAG,
                            "Enforcing square output ${outDim.first}x${outDim.second} -> exact square via Android path"
                        )
                        outJpeg = decodeCropAndroid(clean, cw, ch, true, JPEG_QUALITY)
                    }

                } else {
                    // No crop requested: ensure we output baseline JPEG for max compatibility
                    outJpeg = TurboBridge.reencodeBaseline(clean, JPEG_QUALITY) ?: reencodeAndroid(
                        clean,
                        JPEG_QUALITY
                    )
                }

                if (outJpeg != null) {
                    val outDim = jpegDim(outJpeg)
                    if (srcDim != null && outDim != null) {
                        Log.d(
                            TAG,
                            "emit JPEG ${outDim.first}x${outDim.second} (src=${srcDim.first}x${srcDim.second}) len=${outJpeg.size}"
                        )
                    } else {
                        Log.d(TAG, "emit JPEG len=${outJpeg.size}")
                    }
                    lastEmitNs = System.nanoTime()
                    emitToFlutter(outJpeg)
                }
            } catch (t: Throwable) {
                Log.w(TAG, "worker error", t)
            } finally {
                busy.set(false)
            }
        }
    }

    private fun emitToFlutter(bytes: ByteArray) {
        mainHandler.post {
            try {
                frameSink?.success(bytes)
            } catch (_: Throwable) {
            }
        }
    }

    // ---- Android fallbacks (guarantee visible crop / reencode) ----
    private fun reencodeAndroid(jpeg: ByteArray, quality: Int): ByteArray? {
        val bmp = BitmapFactory.decodeByteArray(jpeg, 0, jpeg.size) ?: return null
        val out = ByteArrayOutputStream()
        val ok = bmp.compress(Bitmap.CompressFormat.JPEG, quality, out)
        bmp.recycle()
        return if (ok) out.toByteArray() else null
    }

    private fun decodeCropAndroid(
        jpeg: ByteArray, targetW: Int, targetH: Int, forceSquare: Boolean, quality: Int
    ): ByteArray? {
        val bmp = BitmapFactory.decodeByteArray(jpeg, 0, jpeg.size) ?: return null
        val srcW = bmp.width
        val srcH = bmp.height

        // Clamp desired size to source, optionally enforce square
        var cw = min(targetW, srcW)
        var ch = min(targetH, srcH)
        if (forceSquare) {
            val side = min(cw, ch)
            cw = side
            ch = side
        }

        val left = max(0, (srcW - cw) / 2)
        val top = max(0, (srcH - ch) / 2)
        val cropped = try {
            Bitmap.createBitmap(bmp, left, top, cw, ch)
        } catch (_: Throwable) {
            bmp.recycle(); return null
        }
        bmp.recycle()

        val out = ByteArrayOutputStream()
        val ok = cropped.compress(Bitmap.CompressFormat.JPEG, quality, out)
        cropped.recycle()
        return if (ok) out.toByteArray() else null
    }

    // ---- Utils ----
    /** Extract a clean JPEG slice (FFD8 ... FFD9). */
    private fun sliceToJpeg(buf: ByteArray): ByteArray? {
        var start = -1
        var end = -1
        var i = 0
        while (i < buf.size - 1) {
            if (buf[i] == 0xFF.toByte() && buf[i + 1] == 0xD8.toByte()) {
                start = i; break
            }
            i++
        }
        if (start < 0) return null
        i = buf.size - 2
        while (i > start) {
            if (buf[i] == 0xFF.toByte() && buf[i + 1] == 0xD9.toByte()) {
                end = i + 2; break
            }
            i--
        }
        if (end <= start) return null
        return buf.copyOfRange(start, end)
    }

    /** Read JPEG width/height from SOF0/SOF2. */
    private fun jpegDim(jpeg: ByteArray): Pair<Int, Int>? {
        try {
            var i = 2 // skip SOI
            while (i + 3 < jpeg.size) {
                if (jpeg[i] != 0xFF.toByte()) {
                    i++; continue
                }
                var marker = (jpeg[i + 1].toInt() and 0xFF)
                i += 2
                if (marker == 0xD9 /*EOI*/ || marker == 0xDA /*SOS*/) break
                val len = ((jpeg[i].toInt() and 0xFF) shl 8) or (jpeg[i + 1].toInt() and 0xFF)
                if (len < 2 || i + len > jpeg.size) return null
                if (marker in arrayOf(0xC0, 0xC2)) {
                    val h = ((jpeg[i + 3].toInt() and 0xFF) shl 8) or (jpeg[i + 4].toInt() and 0xFF)
                    val w = ((jpeg[i + 5].toInt() and 0xFF) shl 8) or (jpeg[i + 6].toInt() and 0xFF)
                    return Pair(w, h)
                }
                i += len
            }
        } catch (_: Throwable) {
        }
        return null
    }


    private fun sendState(
        event: String, device: UsbDevice?, extra: Map<String, Any?> = emptyMap()
    ) {
        val map = HashMap<String, Any?>()
        map["event"] = event
        if (device != null) {
            map["vendorId"] = device.vendorId
            map["productId"] = device.productId
            map["deviceName"] = device.deviceName
            map["deviceId"] = device.deviceId
        }
        for ((k, v) in extra) map[k] = v

        mainHandler.post {
            try {
                stateSink?.success(map)
            } catch (_: Throwable) {
            }
        }
    }


}




