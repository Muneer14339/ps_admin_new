import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/core/utils/constants.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/data/model/drills_entity.dart';
import 'package:pa_sreens/src/features/train/stage/features/firearm/data/model/firearm_entity.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';
import '../../../../../../core/services/sqflite_service/db_file_loading_service.dart';

@injectable
class StageDbHelper {
  Future<StageEntity> getStageForUser(String userId) async {
    try {
      final db = await DbFileLoadingService().getLocalDatabase();

      // ✅ Ensure the table exists
      await db.execute('''
        CREATE TABLE IF NOT EXISTS stages (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          userId TEXT,
          drill TEXT,
          mode TEXT,
          firearm TEXT,
          vanue TEXT,
          mount_location TEXT,
          dominant_hand TEXT,
          aim_sync TEXT,
          distance TEXT
        )
      ''');

      // ✅ Optional: Debug - list tables
      final tables = await db.rawQuery(
          "SELECT name FROM sqlite_master WHERE type='table'");
      print("Tables in DB: $tables");

      // Query the user's stage
      List<Map<String, dynamic>> result = await db.query(
        'stages',
        where: 'userId = ?',
        whereArgs: [userId],
      );

      if (result.isNotEmpty) {
        Map<String, dynamic> stageData = result.first;

        final drills = jsonDecode(stageData['drill'] ??
            jsonEncode(DrillsModel(drill: initailDrill).toJson()));
        final mode =
        jsonDecode(stageData['mode'] ?? jsonEncode(initialMode.toJson()));
        final firearm = jsonDecode(
            stageData['firearm'] ?? jsonEncode(initialFirearm.toJson()));
        final venue = stageData['vanue'] ?? kVanue;
        final mountLocation = stageData['mount_location'] ?? kMountLocation;
        final dominantHand = stageData['dominant_hand'] ?? kDominanthand;
        final aimAync = stageData['aim_sync'] ?? kAimAsync;
        final distance = stageData['distance'] != null
            ? '${stageData['distance']} meters'
            : kDistance;

        return StageEntity().copyWith(
          distance: distance,
          dominantHand: dominantHand,
          drill: DrillsModel.fromJson(drills),
          drillsList: initialDrillsList,
          firearm: FirearmEntity.fromJson(firearm),
          mode: Mode.fromJson(mode),
          mountLocation: mountLocation,
          sensitivity: aimAync,
          venue: venue,
        );
      } else {
        return initialStageEntity;
      }
    } catch (e) {
      print("Error in getStageForUser: $e");
      return initialStageEntity;
    }
  }
}
