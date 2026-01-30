import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // 
    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.example.pa_sreens", binaryMessenger: controller.binaryMessenger)

        channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if call.method == "openWiFiSettings" {
                WiFiNavigator.showAlertBeforeNavigatingToWiFiSettings()
                result(nil) // Indicate success
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
    // 
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

@objc public class WiFiNavigator: NSObject {
    @objc public static func showAlertBeforeNavigatingToWiFiSettings() {
        // Create and show an alert dialog
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Go to Wi-Fi Settings",
                message: "Would you like to open the Wi-Fi settings to connect to a network?",
                preferredStyle: .alert
            )
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                openWiFiSettings()
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
                rootVC.present(alert, animated: true, completion: nil)
            }
        }
    }

    @objc public static func openWiFiSettings() {
        if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
        }
    }
}
