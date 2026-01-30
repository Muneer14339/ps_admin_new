//package com.tlc.PulseAim
//import android.content.Intent
//import android.os.Bundle
//import androidx.annotation.NonNull
//import io.flutter.embedding.android.FlutterActivity
//import io.flutter.embedding.engine.FlutterEngine
//import io.flutter.plugin.common.MethodChannel
//
//
//class MainActivity : FlutterActivity() {
//    private val CHANNEL = "com.tlc.PulseAim"
//
//    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//        super.configureFlutterEngine(flutterEngine)
//
//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
//            if (call.method == "openWiFiSettings") {
//                try {
//                    val intent = Intent(android.provider.Settings.ACTION_WIFI_SETTINGS)
//                    startActivity(intent)
//                    result.success(null) // Indicate success
//                } catch (e: Exception) {
//                    result.error("UNAVAILABLE", "Failed to open Wi-Fi settings", null)
//                }
//            } else {
//                result.notImplemented()
//            }
//        }
//    }
//}


package com.tlc.PulseAim

import android.content.Context
import android.content.Intent
import android.net.wifi.WifiManager
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.tlc.PulseAim"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "openWiFiSettings" -> {
                        try {
                            val intent = Intent(android.provider.Settings.ACTION_WIFI_SETTINGS)
                            startActivity(intent)
                            result.success(null)
                        } catch (e: Exception) {
                            result.error("UNAVAILABLE", "Failed to open Wi-Fi settings", null)
                        }
                    }

                    "startWifiScan" -> {
                        try {
                            val wifiManager = applicationContext.getSystemService(Context.WIFI_SERVICE) as WifiManager
                            val scanStarted = wifiManager.startScan()
                            result.success(scanStarted)
                        } catch (e: Exception) {
                            result.error("UNAVAILABLE", "Failed to start Wi-Fi scan", null)
                        }
                    }

                    else -> result.notImplemented()
                }
            }
    }
}

