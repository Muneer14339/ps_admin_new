// import Foundation
// import SystemConfiguration.CaptiveNetwork
//
// @_cdecl("getConnectedSSID")
// public func getConnectedSSID() -> UnsafePointer<CChar>? {
//     if let interface = CNCopySupportedInterfaces() as? [String],
//        let unsafeInterfaceData = interface.first,
//        let dictionary = CNCopyCurrentNetworkInfo(unsafeInterfaceData as CFString) as? [String: Any],
//        let ssid = dictionary["SSID"] as? String {
//         // Convert Swift String to C String and return as UnsafePointer
//         return UnsafePointer(strdup(ssid))
//     }
//     return nil
// }

