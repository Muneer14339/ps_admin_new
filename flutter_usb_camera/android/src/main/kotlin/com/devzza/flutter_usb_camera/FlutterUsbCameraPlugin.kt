package com.devzza.flutter_usb_camera

import android.content.Context
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class FlutterUsbCameraPlugin : FlutterPlugin,
    MethodChannel.MethodCallHandler,
    EventChannel.StreamHandler {

    private val TAG = "FlutterUsbCameraPlugin"

    private lateinit var methodChannel: MethodChannel
    private lateinit var eventChannel: EventChannel
    private lateinit var stateChannel: EventChannel

    private lateinit var appContext: Context

    private var cameraManager: UsbCameraManager? = null

    companion object {
        const val METHOD_CHANNEL = "flutter_usb_camera/methods"
        const val EVENT_CHANNEL  = "flutter_usb_camera/frames"
        const val STATE_CHANNEL  = "flutter_usb_camera/states"

        @Volatile var frameSink: EventChannel.EventSink? = null
        @JvmStatic var stateSink: EventChannel.EventSink? = null
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        appContext = binding.applicationContext
        methodChannel = MethodChannel(binding.binaryMessenger, METHOD_CHANNEL)
        methodChannel.setMethodCallHandler(this)
        eventChannel = EventChannel(binding.binaryMessenger, EVENT_CHANNEL)
        eventChannel.setStreamHandler(this)

        stateChannel = EventChannel(binding.binaryMessenger, STATE_CHANNEL)
        stateChannel.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) { stateSink = events }
            override fun onCancel(arguments: Any?) { stateSink = null }
        })
        Log.d(TAG, "onAttachedToEngine")
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        Log.d(TAG, "onDetachedFromEngine")
        methodChannel.setMethodCallHandler(null)
        eventChannel.setStreamHandler(null)
        cameraManager?.stop()
        cameraManager = null
        frameSink = null
        stateSink = null

    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "startStream" -> {
                val fps = (call.argument<Int>("fps") ?: 30).coerceAtLeast(0)
                val cw  = call.argument<Int>("croppedWidth") ?: 0
                val ch  = call.argument<Int>("croppedHeight") ?: 0

                UsbBridge.fps = fps
                UsbBridge.cropWidth = cw
                UsbBridge.cropHeight = ch
                Log.d(TAG, "startStream: fps=$fps crop=${cw}x${ch}")

                if (cameraManager == null) {
                    cameraManager = UsbCameraManager(appContext)
                }
                cameraManager?.start()
                result.success(null)
            }
            "stopStream" -> {
                Log.d(TAG, "stopStream")
                cameraManager?.stop()
                result.success(null)
            }

            "pausePreview" -> {
                Log.d(TAG, "pausePreview")
                cameraManager?.pausePreview()
                result.success(null)
            }

            "resumePreview" -> {
                Log.d(TAG, "resumePreview")
                cameraManager?.resumePreview()
                result.success(null)
            }

            else -> result.notImplemented()
        }
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        frameSink = events
        Log.d(TAG, "EventChannel onListen (sink ready)")
    }

    override fun onCancel(arguments: Any?) {
        frameSink = null
        Log.d(TAG, "EventChannel onCancel")
    }
}
