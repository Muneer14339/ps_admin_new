import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/core/services/sqflite_service/db_file_loading_service.dart';

@injectable
class SingleLineStagesHelper {
  Future<void> updateAimSyncinStage(String userId, String aimSync) async {
    final db = await DbFileLoadingService().getLocalDatabase();
    List<Map<String, dynamic>> result = await db.query(
      'stages',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    if (result.isNotEmpty) {
      await db.update(
        'stages',
        {'aim_sync': aimSync},
        where: 'userId = ?',
        whereArgs: [userId],
      );
    } else {
      await db.insert('stages', {
        'userId': userId,
        'aim_sync': aimSync,
      });
    }
  }

  //-------------------------  updateMountLocationinStage

  Future<void> updateMountLocationinStage(
      String userId, String mountLocation) async {
    final db = await DbFileLoadingService().getLocalDatabase();
    List<Map<String, dynamic>> result = await db.query(
      'stages',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    if (result.isNotEmpty) {
      await db.update(
        'stages',
        {'mount_location': mountLocation},
        where: 'userId = ?',
        whereArgs: [userId],
      );
    } else {
      await db.insert('stages', {
        'userId': userId,
        'mount_location': mountLocation,
      });
    }
  }

  //-------------------------  updateVanue

  Future<void> updateVanueinStage(String userId, String vanue) async {
    final db = await DbFileLoadingService().getLocalDatabase();
    List<Map<String, dynamic>> result = await db.query(
      'stages',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    if (result.isNotEmpty) {
      await db.update(
        'stages',
        {'vanue': vanue},
        where: 'userId = ?',
        whereArgs: [userId],
      );
    } else {
      await db.insert('stages', {
        'userId': userId,
        'vanue': vanue,
      });
    }
  }

  //-------------------------  dominantHand

  Future<void> updateDominantHandStage(
      String userId, String dominantHand) async {
    final db = await DbFileLoadingService().getLocalDatabase();
    List<Map<String, dynamic>> result = await db.query(
      'stages',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    if (result.isNotEmpty) {
      await db.update(
        'stages',
        {'dominant_hand': dominantHand},
        where: 'userId = ?',
        whereArgs: [userId],
      );
    } else {
      await db.insert('stages', {
        'userId': userId,
        'dominant_hand': dominantHand,
      });
    }
  }
}
