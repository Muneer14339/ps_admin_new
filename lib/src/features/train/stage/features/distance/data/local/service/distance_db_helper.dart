import 'package:injectable/injectable.dart';
import '../../../../../../../../core/services/sqflite_service/db_file_loading_service.dart';

@injectable
class DistanceDbHelper {
  Future<void> updateDistanceinStage(String userId, String distance) async {
    final db = await DbFileLoadingService().getLocalDatabase();
    List<Map<String, dynamic>> result = await db.query(
      'stages',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    if (result.isNotEmpty) {
      await db.update(
        'stages',
        {'distance': distance},
        where: 'userId = ?',
        whereArgs: [userId],
      );
    } else {
      await db.insert('stages', {
        'userId': userId,
        'distance': distance,
      });
    }
  }
}
