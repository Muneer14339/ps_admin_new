import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@singleton
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  final _connectivityController = StreamController<bool>.broadcast();

  Stream<bool> get connectivityStream => _connectivityController.stream;

  ConnectivityService() {
    _init();
  }

  void _init() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((results) {
      final isConnected = !results.contains(ConnectivityResult.none);
      _connectivityController.add(isConnected);
    });
  }

  /// Check if device has internet connection
  Future<bool> get hasConnection async {
    try {
      final results = await _connectivity.checkConnectivity();
      return !results.contains(ConnectivityResult.none);
    } catch (e) {
      return false;
    }
  }

  /// Check specific connectivity type
  Future<bool> get isWifiConnected async {
    try {
      final results = await _connectivity.checkConnectivity();
      return results.contains(ConnectivityResult.wifi);
    } catch (e) {
      return false;
    }
  }

  /// Check if mobile data is connected
  Future<bool> get isMobileConnected async {
    try {
      final results = await _connectivity.checkConnectivity();
      return results.contains(ConnectivityResult.mobile);
    } catch (e) {
      return false;
    }
  }

  /// Get connection status as string
  Future<String> get connectionStatus async {
    try {
      final results = await _connectivity.checkConnectivity();

      if (results.contains(ConnectivityResult.wifi)) {
        return 'WiFi';
      } else if (results.contains(ConnectivityResult.mobile)) {
        return 'Mobile Data';
      } else if (results.contains(ConnectivityResult.ethernet)) {
        return 'Ethernet';
      } else {
        return 'No Connection';
      }
    } catch (e) {
      return 'Unknown';
    }
  }

  void dispose() {
    _connectivitySubscription?.cancel();
    _connectivityController.close();
  }
}
