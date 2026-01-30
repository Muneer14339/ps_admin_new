import 'dart:convert';
import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/core/services/sqflite_service/db_file_loading_service.dart';
import '../../model/drills_entity.dart';

@injectable
class DrillDbHelper {
  //--------------------------- Adding Drill

  Future<DrillsModel?> addNewDrill(String userId, DrillsEntity newDrill) async {
    DrillsModel drillsModel = DrillsModel();
    try {
      final db = await DbFileLoadingService().getLocalDatabase();
      int? newDrillId = await db.insert('drills', {
        'userId': userId,
        'drill': jsonEncode(newDrill.toJson()),
      });
      drillsModel = DrillsModel(id: newDrillId, drill: newDrill);
      List<Map<String, dynamic>> result = await db.query(
        'stages',
        where: 'userId = ?',
        whereArgs: [userId],
      );
      if (result.isNotEmpty) {
        await db.update(
          'stages',
          {'drill': jsonEncode(drillsModel.toJson())},
          where: 'userId = ?',
          whereArgs: [userId],
        );
      } else {
        await db.insert('stages', {
          'userId': userId,
          'drill': jsonEncode(drillsModel.toJson()),
        });
      }
      return drillsModel;
    } catch (e) {
      return drillsModel;
    }
  }

  //--------------------------- Updating Drill

  Future<void> updateDrillinStage(
      String userId, Map<String, dynamic> newDrill) async {
    final db = await DbFileLoadingService().getLocalDatabase();
    List<Map<String, dynamic>> result = await db.query(
      'stages',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    if (result.isNotEmpty) {
      await db.update(
        'stages',
        {'drill': jsonEncode(newDrill)},
        where: 'userId = ?',
        whereArgs: [userId],
      );
    } else {
      await db.insert('stages', {
        'userId': userId,
        'drill': jsonEncode(newDrill),
      });
    }
  }

  //-------------------------------------- Getting Drills

  Future<List<Map<String, dynamic>>> getDrillsForUser(String userId) async {
    final db = await DbFileLoadingService().getLocalDatabase();

    List<Map<String, dynamic>> result = await db.query(
      'drills',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    return result.map((drill) {
      return {
        'id': drill['id'],
        'drill': jsonDecode(drill['drill']) // Decode JSON string to Map
      };
    }).toList();
  }

  //-------------------------------------- Deleting Drills

  Future<void> removeDrill(int drillId, String userId) async {
    try {
      final db = await DbFileLoadingService().getLocalDatabase();
      await db.delete(
        'drills',
        where: 'id = ? AND userId = ?',
        whereArgs: [drillId, userId],
      );
      List<Map<String, dynamic>> result = await db.query(
        'stages',
        where: 'userId = ?',
        whereArgs: [userId],
      );
      if (result.isNotEmpty) {
        await db.update(
          'stages',
          {'drill': {}},
          where: 'userId = ?',
          whereArgs: [userId],
        );
      }
    } catch (e) {
      log('removeDrill :: $e');
    }
  }
}
