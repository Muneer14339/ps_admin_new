
# Keep classes and members for your main app package.
-keep class com.example.scoring_cam_app.** { *; }
-keep class org.videolan.libvlc.** { *; }
# Keep classes and members for FFmpegKit, which might be necessary for correct functionality.
-keep class com.arthenica.ffmpegkit.** { *; }
-dontwarn com.arthenica.ffmpegkit.**

# Keep classes related to Dart FFI (Foreign Function Interface).
-keep class dart.ffi.** { *; }

# Keep native methods to prevent them from being removed or obfuscated.
-keepclasseswithmembernames class * {
    native <methods>;
}

# Preserve annotations and important attributes that might be necessary at runtime.
-keepattributes *Annotation*

# Preserve source file, line number table, and other debugging information for stack traces.
-keepattributes SourceFile,LineNumberTable,EnclosingMethod
-keepattributes InnerClasses,Signature,Deprecated,Exceptions,SourceDebugExtension,LocalVariableTable,LocalVariableTypeTable

# Enable optimizations to further reduce APK size.
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*

# Additional rules to avoid unnecessary warnings.
-dontwarn org.codehaus.mojo.animal_sniffer.*
-dontwarn com.google.gson.**
-dontwarn java.nio.file.*
-dontwarn javax.annotation.**

# If you use any other libraries, consider adding their corresponding `-dontwarn` rules here.

# Keep USB Camera related classes
-keep class com.serenegiant.** { *; }
-keep class com.herohan.uvcapp.** { *; }

# Keep USB related Android classes
-keep class android.hardware.usb.** { *; }
-keep class android.content.res.XmlBlock$Parser { *; }

# Keep interfaces that are implemented by platform
-keep interface F1.a { *; }
-keepclassmembers interface F1.a {
    public int b();
}

# Keep XML parsers and related classes
-keep class android.content.res.** { *; }
-keepattributes *Annotation*

# Prevent obfuscation of native method names
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep Flutter USB Camera plugin classes
-keep class io.flutter.plugins.** { *; }
-keep class ** implements io.flutter.plugin.common.MethodCallHandler { *; }

# Keep USB device filter parsing
-keep class * implements org.xmlpull.v1.XmlPullParser { *; }

# Don't warn about missing classes
-dontwarn com.serenegiant.**
-dontwarn com.herohan.uvcapp.**
-dontwarn org.xmlpull.v1.**