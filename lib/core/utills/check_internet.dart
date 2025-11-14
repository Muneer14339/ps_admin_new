import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pa_sreens/armory/data/repositories/armory_sync_services.dart';
import 'package:pa_sreens/core/utills/logger.dart' show log;


class ConnectivityWatcher {
  final ArmorySyncService syncService;

  ConnectivityWatcher(this.syncService) {
    Connectivity().onConnectivityChanged.listen((result) async {
      if (result != ConnectivityResult.none) {
        log.i('Internet restored, syncing pending data...');
        await syncService.syncAllPendingData('currentUserId');
      }
    });
  }
}

class NetworkHelper {
  static Future<bool> isOnline() async {
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }
}