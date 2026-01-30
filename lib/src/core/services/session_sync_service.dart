import 'dart:convert';
import 'package:injectable/injectable.dart';
import '../../features/train/session/data/local/service/session_db_helper.dart';
import '../../features/armory/data/datasources/armory_local_repository_impl.dart';
import '../../features/user_dashboard/pages/placeholder_tabs.dart';
import 'connectivity_service.dart';
import 'sqflite_service/database_helper.dart';
import 'logger.dart';

@singleton
class SessionSyncService {
  final ConnectivityService _connectivityService;
  final DatabaseHelper _dbHelper;
  final SessionImagesUploader _uploader = SessionImagesUploader();

  SessionSyncService(
    this._connectivityService,
    this._dbHelper,
  );

  /// Syncs local sessions to remote server
  /// Only runs if internet is available
  /// Returns true if sync was successful or skipped (no internet)
  /// Returns false only on actual errors
  Future<bool> syncSessionsToRemote(String userId) async {
    print("syncSessionsToRemote===1");
    try {
      // Check internet connectivity first
      final hasInternet = await _connectivityService.hasConnection;
      if (!hasInternet) {
        log.w('⚠️ No internet connection - skipping session sync');
        return true; // Not an error, just no internet
      }

      log.i('🔄 Starting session sync for user: $userId');

      // Create local data source instance
      final armoryDataSource = ArmoryLocalDataSourceImpl(dbHelper: _dbHelper);

      // Load all sessions for this user
      final rows = await SessionDbHelper().getSessionsByUid(userId);
      if (rows.isEmpty) {
        log.i('✅ No sessions to sync');
        return true;
      }

      int success = 0, failed = 0;
      int index = 0;

      // Process each session sequentially
      for (final row in rows) {
        index++;
        final session = row['session'];
        if (session == null) {
          log.w('Row $index has no session object - skipping');
          continue;
        }

        // Fetch related data
        dynamic loadout;
        dynamic firearm;
        dynamic ammunition;

        if (session.loadoutId != null) {
          loadout = await armoryDataSource.getLoadoutById(
              userId, session.loadoutId!);
          log.d('Loadout fetched: ${loadout?.name ?? 'NULL'}');
        }

        if (session.firearmId != null) {
          firearm = await armoryDataSource.getFirearmById(
              userId, session.firearmId!);
          log.d('Firearm fetched: ${firearm?.brand ?? 'NULL'}');
        }

        if (session.ammunitionId != null) {
          ammunition = await armoryDataSource.getAmmunitionById(
              userId, session.ammunitionId!);
          log.d('Ammunition fetched: ${ammunition?.brand ?? 'NULL'}');
        }

        final paths = session.shotsList ?? const <String>[];
        if (paths.isEmpty) {
          log.w('Session ${session.sessionId} has no images - skipping');
          continue;
        }

        log.i('[$index/${rows.length}] Uploading session ${session.sessionId}...');

        try {
          await _uploader.uploadFromPaths(
            userId: userId,
            sessionId: session.sessionId.toString(),
            imagePaths: session.shotsList!,
            batchSize: session.shotsList!.length,
            onSendProgress: (sent, total) {
              if (total > 0) {
                final pct = (sent / total * 100).toStringAsFixed(1);
                log.d('Session ${session.sessionId}: $pct%');
              }
            },
            dataNew: jsonEncode(
              session
                  .copyWith(
                    loadoutId: jsonEncode(loadout?.toJson()),
                    ammunitionId: jsonEncode(ammunition?.toJson()),
                    firearmId: jsonEncode(firearm?.toJson()),
                  )
                  .toJson(),
            ),
          );

          success++;
          log.i('✅ Session ${session.sessionId} uploaded');
        } catch (e, st) {
          failed++;
          log.e('❌ Upload failed for session ${session.sessionId}: $e\n$st');
          // Continue with next session
        }

        // Gentle throttle between uploads
        await Future.delayed(const Duration(milliseconds: 200));
      }

      log.i('🎉 Sync complete - Success: $success, Failed: $failed, Total: ${rows.length}');
      return failed == 0; // Return true only if no failures
    } catch (e, st) {
      log.e('❌ Session sync error: $e\n$st');
      return false;
    }
  }
}
