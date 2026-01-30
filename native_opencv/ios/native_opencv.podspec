Pod::Spec.new do |s|
  s.name             = 'native_opencv'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }

  # Include source files - split C++ and Swift/ObjC
  s.source_files = 'Classes/**/*.{m,mm,cpp,c,swift}', 'Classes/NativeOpencvPlugin.h'

  # Only expose the main plugin header to Swift
  s.public_header_files = 'Classes/NativeOpencvPlugin.h'

  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Pod target configuration
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'gnu++14',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'GCC_SYMBOLS_PRIVATE_EXTERN' => 'NO',
    'SWIFT_VERSION' => '5.0'
  }

  s.swift_version = '5.0'

  # Preserve OpenCV framework only
  s.preserve_paths = 'opencv2.framework'

  # Linker flags
  s.xcconfig = {
    'OTHER_LDFLAGS' => '-framework opencv2',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  # Including OpenCV framework
  s.vendored_frameworks = 'opencv2.framework'

  # Including native frameworks
  s.frameworks = 'AVFoundation'

  # Including C++ library
  s.library = 'c++'
end
