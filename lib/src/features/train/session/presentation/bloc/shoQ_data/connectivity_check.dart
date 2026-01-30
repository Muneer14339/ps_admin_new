// // lib/net/reachability.dart
// import 'dart:io';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:wifi_iot/wifi_iot.dart';
//
// enum ReachStatus { offline, captive, online_no_server, server_up }
//
// class ReachResult {
//   final ReachStatus status;
//   final bool networkUp;
//   final bool internetUp;
//   final bool serverUp;
//
//   const ReachResult(
//       this.status, {
//         this.networkUp = false,
//         this.internetUp = false,
//         this.serverUp = false,
//       });
//
//   @override
//   String toString() =>
//       'ReachResult(status=$status, networkUp=$networkUp, internetUp=$internetUp, serverUp=$serverUp)';
// }
//
// class Reachability {
//   // Adjust as needed
//   static const String _serverHostIp = '93.127.217.36';
//   static const int _serverPort = 8070;
//
//   /// Unbind from any forced Wi-Fi (RTSP AP) and wait until the OS validates an Internet route.
//   static Future<bool> ensureInternetRoute({
//     Duration wait = const Duration(seconds: 6),
//     Duration poll = const Duration(milliseconds: 400),
//   }) async {
//     // If you previously pinned sockets to Wi-Fi (bindProcessToNetwork), undo it.
//     try {
//       await WiFiForIoTPlugin.forceWifiUsage(false);
//     } catch (_) {
//       // Ignore plugin quirks
//     }
//
//     final start = DateTime.now();
//     while (DateTime.now().difference(start) < wait) {
//       final rr = await check();
//       if (rr.internetUp) return true; // WAN validated
//       await Future.delayed(poll);
//     }
//     return false;
//   }
//
//   /// Quick internet boolean (kept for compatibility). Uses the richer check() internally.
//   static Future<bool> hasInternet({Duration timeout = const Duration(seconds: 4)}) async {
//     final rr = await check(internetTimeout: timeout, serverTimeout: timeout);
//     return rr.internetUp;
//   }
//
//   /// Stream that emits full status after connectivity changes.
//   static Stream<ReachResult> statusStream({
//     Duration internetTimeout = const Duration(seconds: 4),
//     Duration serverTimeout = const Duration(seconds: 5),
//   }) async* {
//     // Emit initial snapshot
//     yield await check(internetTimeout: internetTimeout, serverTimeout: serverTimeout);
//
//     await for (final _ in Connectivity().onConnectivityChanged) {
//       yield await check(internetTimeout: internetTimeout, serverTimeout: serverTimeout);
//     }
//   }
//
//   /// Full split: network present? internet reachable? server reachable?
//   static Future<ReachResult> check({
//     Duration internetTimeout = const Duration(seconds: 4),
//     Duration serverTimeout = const Duration(seconds: 5),
//   }) async {
//     final conn = await Connectivity().checkConnectivity();
//     final networkUp = conn != ConnectivityResult.none;
//     if (!networkUp) {
//       return const ReachResult(ReachStatus.offline, networkUp: false);
//     }
//
//     final internetUp = await _probeInternet(timeout: internetTimeout);
//     if (!internetUp) {
//       // Connected to some network (e.g., RTSP AP), but no WAN
//       return const ReachResult(ReachStatus.captive, networkUp: true, internetUp: false);
//     }
//
//     final serverOk = await _probeServer(timeout: serverTimeout);
//     if (!serverOk) {
//       return const ReachResult(
//         ReachStatus.online_no_server,
//         networkUp: true,
//         internetUp: true,
//         serverUp: false,
//       );
//     }
//
//     return const ReachResult(
//       ReachStatus.server_up,
//       networkUp: true,
//       internetUp: true,
//       serverUp: true,
//     );
//   }
//
//   /// WAN probe to well-known IP (no DNS) to avoid false negatives on unvalidated networks.
//   static Future<bool> _probeInternet({Duration timeout = const Duration(seconds: 4)}) async {
//     // 1.1.1.1:443 is broadly reachable; you can also try 8.8.8.8:443 if desired.
//     try {
//       final s = await Socket.connect('1.1.1.1', 443, timeout: timeout);
//       s.destroy();
//       return true;
//     } catch (_) {
//       return false;
//     }
//   }
//
//   /// Your WS host:port specifically.
//   static Future<bool> _probeServer({Duration timeout = const Duration(seconds: 5)}) async {
//     try {
//       final s = await Socket.connect(_serverHostIp, _serverPort, timeout: timeout);
//       s.destroy();
//       return true;
//     } catch (_) {
//       return false;
//     }
//   }
// }


import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:wifi_iot/wifi_iot.dart';

enum ReachStatus { offline, captive, online_no_server, server_up }

class ReachResult {
  final ReachStatus status;
  final bool networkUp;
  final bool internetUp;
  final bool serverUp;

  const ReachResult(
      this.status, {
        this.networkUp = false,
        this.internetUp = false,
        this.serverUp = false,
      });

  @override
  String toString() =>
      'ReachResult(status=$status, networkUp=$networkUp, internetUp=$internetUp, serverUp=$serverUp)';
}

class Reachability {
  static const String _serverHostIp = '93.127.217.36';
  static const int _serverPort = 8070;

  /// Unbind from any forced Wi-Fi (RTSP AP) and wait until the OS validates an Internet route.
  static Future<bool> ensureInternetRoute({
    Duration wait = const Duration(seconds: 1),
    Duration poll = const Duration(milliseconds: 400),
  }) async {
    final start = DateTime.now();
    while (DateTime.now().difference(start) < wait) {
      final rr = await check();
      if (rr.internetUp) return true;
      await Future.delayed(poll);
    }
    return false;
  }

  /// Quick boolean (kept for compat) — internally uses check().
  static Future<bool> hasInternet({Duration timeout = const Duration(seconds: 4)}) async {
    final rr = await check(internetTimeout: timeout, serverTimeout: timeout);
    return rr.internetUp;
  }

  /// Stream that emits full status after connectivity changes (+ initial snapshot).
  static Stream<ReachResult> statusStream({
    Duration internetTimeout = const Duration(seconds: 4),
    Duration serverTimeout = const Duration(seconds: 5),
  }) async* {
    yield await check(internetTimeout: internetTimeout, serverTimeout: serverTimeout);
    await for (final _ in Connectivity().onConnectivityChanged) {
      // Unpin whenever network changes; user might have switched to Internet Wi-Fi in Settings.
      // try {
      //   await WiFiForIoTPlugin.forceWifiUsage(false);
      // } catch (_) {}
      yield await check(internetTimeout: internetTimeout, serverTimeout: serverTimeout);
    }
  }

  /// Full split: network present? internet reachable? server reachable?
  static Future<ReachResult> check({
    Duration internetTimeout = const Duration(seconds: 4),
    Duration serverTimeout = const Duration(seconds: 5),
  }) async {
    final conn = await Connectivity().checkConnectivity();
    final networkUp = conn != ConnectivityResult.none;
    if (!networkUp) {
      return const ReachResult(ReachStatus.offline, networkUp: false);
    }

    final internetUp = await _probeInternet(timeout: internetTimeout);
    if (!internetUp) {
      return const ReachResult(ReachStatus.captive, networkUp: true, internetUp: false);
    }

    final serverOk = await _probeServer(timeout: serverTimeout);
    if (!serverOk) {
      return const ReachResult(
        ReachStatus.online_no_server,
        networkUp: true,
        internetUp: true,
        serverUp: false,
      );
    }

    return const ReachResult(
      ReachStatus.server_up,
      networkUp: true,
      internetUp: true,
      serverUp: true,
    );
  }

  /// WAN probe to a well-known IP (no DNS).
  static Future<bool> _probeInternet({Duration timeout = const Duration(seconds: 4)}) async {
    try {
      final s = await Socket.connect('1.1.1.1', 443, timeout: timeout);
      s.destroy();
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Probe your WS host:port specifically.
  static Future<bool> _probeServer({Duration timeout = const Duration(seconds: 5)}) async {
    try {
      final s = await Socket.connect(_serverHostIp, _serverPort, timeout: timeout);
      s.destroy();
      return true;
    } catch (_) {
      return false;
    }
  }

  // -----------------------------
  // 🔔 New helper for your dialog flow
  // -----------------------------

  /// Waits until `server_up`, then returns true.
  /// Use this after showing your “No Internet” dialog.
  ///
  /// - Calls [onStatus] every time status changes (use it to keep the dialog text updated if you want).
  /// - Automatically unpins from RTSP Wi-Fi on changes and re-checks.
  /// - Returns false on timeout.
  static Future<bool> waitForServerUp({
    Duration maxWait = const Duration(minutes: 5),
    Duration internetTimeout = const Duration(seconds: 4),
    Duration serverTimeout = const Duration(seconds: 5),
    void Function(ReachStatus status)? onStatus,
  }) async {
    final completer = Completer<bool>();
    Timer? timer;

    // Emit initial and then listen for changes.
    final sub = statusStream(
      internetTimeout: internetTimeout,
      serverTimeout: serverTimeout,
    ).listen((res) async {
      onStatus?.call(res.status);

      // If user switched to Internet Wi-Fi via Settings, ensure we’re unpinned and re-evaluate quickly.
      if (res.status == ReachStatus.captive || res.status == ReachStatus.offline) {
        // Stay listening; user hasn’t connected to real Internet yet.
        return;
      }

      if (res.status == ReachStatus.online_no_server) {
        // Internet is back but server/port not reachable yet; keep waiting.
        return;
      }

      if (res.status == ReachStatus.server_up && !completer.isCompleted) {
        completer.complete(true);
      }
    }, onError: (_) {
      if (!completer.isCompleted) completer.complete(false);
    });

    timer = Timer(maxWait, () {
      if (!completer.isCompleted) completer.complete(false);
    });

    final ok = await completer.future;
    await sub.cancel();
    timer?.cancel();
    return ok;
  }
}
