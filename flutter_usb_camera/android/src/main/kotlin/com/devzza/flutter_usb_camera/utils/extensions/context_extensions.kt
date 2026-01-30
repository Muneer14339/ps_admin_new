package com.devzza.flutter_usb_camera.utils.extensions

import android.content.Context
import android.content.Intent
import androidx.core.content.FileProvider
import java.io.File


/**
 * Created by: --- Mahmoud Ramzy
 * Email: -------- mahmoudramzy400@gmail.com
 * Date: --------- 22/05/2025
 */

fun Context.shareJsonFile( jsonCont:String, fileName:String) {

     val jsonContent = jsonCont.trimIndent()

    // Step 2: Write to a file in cache directory

    val file = File(cacheDir, fileName)
    if (!file.exists())file.createNewFile()

    file.writeText(jsonContent)

    // Step 3: Get a URI using FileProvider
    val uri = FileProvider.getUriForFile(
        this,
        "${packageName}.fileprovider", // Match with manifest
        file
    )

    // Step 4: Create and launch share intent
    val shareIntent = Intent(Intent.ACTION_SEND).apply {
        type = "application/json"
        putExtra(Intent.EXTRA_STREAM, uri)
        addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
    }

    startActivity(Intent.createChooser(shareIntent, "Share JSON file"))
}
