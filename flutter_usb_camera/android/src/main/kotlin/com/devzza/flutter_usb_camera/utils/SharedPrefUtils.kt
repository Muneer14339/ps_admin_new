package com.devzza.flutter_usb_camera.utils

import android.content.Context
import android.content.SharedPreferences
import com.google.gson.Gson
import com.serenegiant.usb.Size


/**
 * Created by: --- Mahmoud Ramzy
 * Email: -------- mahmoudramzy400@gmail.com
 * Date: --------- 25/05/2025
 */
class SharedPrefUtils(private val context: Context) {

    private val camera_size_key = "camera_size_key"
    private val camera_frame_rate_key = "camera_frame_rate_key"
    private val pref_name = "usb_camera_prefs"
    private val sharedPreferences: SharedPreferences = context.getSharedPreferences(
        pref_name,
        Context.MODE_PRIVATE
    )

    fun setCameraSize(size: Size) {
        val sizeGson = Gson().toJson(size)

        with(sharedPreferences.edit()) {
            putString(camera_size_key, sizeGson)
            apply()
        }
    }

    fun getCameraSize(): Size? {

        val sizeGson = sharedPreferences.getString(camera_size_key, null)
        val size: Size? = Gson().fromJson<Size>(sizeGson, Size::class.java)
        return size

    }


}