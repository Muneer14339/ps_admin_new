package com.devzza.flutter_usb_camera.utils

import android.content.Context
import android.widget.Toast
import androidx.annotation.MainThread


/**
 * Created by: --- Mahmoud Ramzy
 * Email: -------- mahmoudramzy400@gmail.com
 * Date: --------- 04/010/2025
 */
object ToastUtils {

    private var applicationCtx: Context?= null

    @MainThread
    fun init(ctx: Context) {
        if (applicationCtx != null) {
            return
        }
        this.applicationCtx = ctx.applicationContext
    }

    @JvmStatic
    fun show(msg: String) {
        applicationCtx?.let { ctx ->
            Toast.makeText(ctx, msg, Toast.LENGTH_LONG).show()
        }
    }

    @JvmStatic
    fun show(resId: Int) {
        applicationCtx?.let { ctx ->
            Toast.makeText(ctx, ctx.getString(resId), Toast.LENGTH_LONG).show()
        }
    }

}