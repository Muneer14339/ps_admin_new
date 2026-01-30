
cmake_minimum_required(VERSION 3.17)
project(shooting VERSION 1.0 LANGUAGES C CXX)

# 1) Require C++14
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# 2) Expose headers to all translation units
#    - your public include folder
#    - the ios/Classes folder (for any .h next to your .cpp)
include_directories(
        "${CMAKE_CURRENT_LIST_DIR}/../include"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes"
)

# 3) Import OpenCV’s shared library from jniLibs
add_library(lib_opencv SHARED IMPORTED)
set_target_properties(lib_opencv PROPERTIES
        IMPORTED_LOCATION
        "${CMAKE_CURRENT_LIST_DIR}/src/main/jniLibs/${ANDROID_ABI}/libopencv_java4.so"
        )

# 4) Grab Android’s log library
find_library(log-lib log REQUIRED)

# 5) List out all your source files
set(NATIVE_SRCS
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/native_opencv.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/adaptApproximateContours.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/adaptApproxPolyDP.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/Contours.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/EllipseNonMaximumSuppression.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/FLED.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/FLED_drawAndWriteFunctions.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/FLED_Initialization.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/FLED_PrivateFunctions.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/Group.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/LinkMatrix.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/Node_FC.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/scorer.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/Segmentation.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/target_zone_detector.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/platform_log.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/Validation.cpp"
#        "${CMAKE_CURRENT_LIST_DIR}/../ios/Classes/Logger.cpp"
        )

# 6) Build your shared library
add_library(native_opencv SHARED ${NATIVE_SRCS})

# 7) Link against OpenCV and log
target_link_libraries(native_opencv
        PRIVATE
        lib_opencv
        ${log-lib}
        )



## OLD CODE
#cmake_minimum_required(VERSION 3.17)
#project(shooting VERSION 1.0)
#
## Set the C++ standard to 14
#set(CMAKE_CXX_STANDARD 14)
#
## Include directories for your project
#include_directories(../include)
#
## Import the OpenCV shared library
#add_library(lib_opencv SHARED IMPORTED)
#set_target_properties(lib_opencv PROPERTIES
#        IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI}/libopencv_java4.so)
#
## Find Android's log library
#find_library(log-lib log)
#
## Add the native OpenCV library (your custom code)
#add_library(native_opencv SHARED ../ios/Classes/native_opencv.cpp)
#
## Link the native OpenCV library with OpenCV and Android log libraries
#target_link_libraries(native_opencv lib_opencv ${log-lib})