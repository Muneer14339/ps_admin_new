cmake_minimum_required(VERSION 3.18.1)
project(turbo_bridge)

add_library(turbo_bridge SHARED turbo_bridge.cpp)

# Use the prebuilt lib with its REAL filename
set(TURBO_PREBUILT_NAME libjpeg-turbo1500.so)
set(TURBO_PREBUILT "${CMAKE_SOURCE_DIR}/../jniLibs/${ANDROID_ABI}/${TURBO_PREBUILT_NAME}")

add_library(jpeg-turbo1500 SHARED IMPORTED GLOBAL)
set_target_properties(jpeg-turbo1500 PROPERTIES IMPORTED_LOCATION "${TURBO_PREBUILT}")

find_library(log-lib log)

target_link_libraries(
        turbo_bridge
        jpeg-turbo1500
        ${log-lib}
)
