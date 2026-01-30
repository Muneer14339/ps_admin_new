import 'dart:convert';
import 'package:injectable/injectable.dart';
import '../../../../../../../../core/services/sqflite_service/db_file_loading_service.dart';

@injectable
class ModeDbHelper {
  Future<void> updateModeinStage(
      String userId, Map<String, dynamic> mode) async {
    final db = await DbFileLoadingService().getLocalDatabase();
    List<Map<String, dynamic>> result = await db.query(
      'stages',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    if (result.isNotEmpty) {
      await db.update(
        'stages',
        {'mode': jsonEncode(mode)},
        where: 'userId = ?',
        whereArgs: [userId],
      );
    } else {
      await db.insert('stages', {
        'userId': userId,
        'mode': jsonEncode(mode),
      });
    }
  }
}
