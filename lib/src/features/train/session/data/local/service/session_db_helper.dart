import 'dart:convert';
import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/features/train/session/data/model/save_session_model.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../../../core/services/sqflite_service/db_file_loading_service.dart';

@injectable
class SessionDbHelper {
  //--------------------------- Adding Session
  Future<SaveSessionModel?> saveSession(SaveSessionModel session, String? uid) async
  {
    try {
      final db = await DbFileLoadingService().getLocalDatabase();

      await _addColumnIfNotExists(db);

      // Combine all models into a single map
      final combinedData = {
        'session': jsonEncode(session.toJson()),
        'userId': uid,
        'created_at': DateTime.now().toIso8601String(),
      };

      await db.insert('session', combinedData);

      log('Session saved successfully');
      return session;
    } catch (e) {
      log('Error saving session: $e');
      return null;
    }
  }
  Future<List<Map<String, dynamic>>> getSessionsByUid(String uid) async {
    try {
      final db = await DbFileLoadingService().getLocalDatabase();

      // Ensure userId column exists before querying
      await _addColumnIfNotExists(db);

      final List<Map<String, dynamic>> results = await db.query(
        'session',
        where: 'userId = ?',
        whereArgs: [uid],
        orderBy: 'created_at DESC', // Most recent first
      );

      return results.map((row) {
        return {
          'session': row['session'] != null
              ? SaveSessionModel.fromJson(jsonDecode(row['session']))
              : null,
          'loadout_json': row['loadout'] != null
              ? jsonDecode(row['loadout'])
              : null,
          'firearm_json': row['firearm'] != null
              ? jsonDecode(row['firearm'])
              : null,
          'ammunition_json': row['ammunition'] != null
              ? jsonDecode(row['ammunition'])
              : null,
          'userId': row['userId'],
          'created_at': row['created_at'],
          'id': row['id'],
        };
      }).toList();
    } catch (e) {
      log('Error getting sessions by UID: $e');
      return [];
    }
  }

  //-------------------------------------- Getting Session

  Future<List<SaveSessionModel>> geSessions(String userId) async {
    final db = await DbFileLoadingService().getLocalDatabase();

    try {
      List<Map<String, dynamic>> result = await db.query('session');
      // return result;
      return result.map((firearm) {
        return SaveSessionModel.fromJson(firearm);
      }).toList();
    } catch (e) {
      log('$e');
      return [];
    }
  }

  //-------------------------------------- Deleting Session

  Future<void> removeSession(int drillId, String userId) async {
    try {
      final db = await DbFileLoadingService().getLocalDatabase();
      await db.delete(
        'session',
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
          {'session': '{}'},
          where: 'userId = ?',
          whereArgs: [userId],
        );
      }
    } catch (e) {
      log('removeSession :: $e');
    }
  }

// Update column creation to include all new columns
  Future<void> _addColumnIfNotExists(Database db) async {
    try {
      // Get current table structure
      List<Map<String, dynamic>> result =
      await db.rawQuery("PRAGMA table_info(session)");

      List<String> existingColumns = result
          .map((col) => col['name'].toString())
          .toList();
      log('Existing columns: $existingColumns');

      // Define all required columns
      Map<String, String> requiredColumns = {
        'userId': 'TEXT',
        'loadout': 'TEXT',
        'firearm': 'TEXT',
        'ammunition': 'TEXT',
        'created_at': 'TEXT',
        'added_by_user': 'INTEGER',
      };

      // Add missing columns
      for (var entry in requiredColumns.entries) {
        if (!existingColumns.contains(entry.key)) {
          try {
            await db.execute(
                'ALTER TABLE session ADD COLUMN ${entry.key} ${entry.value}');
            log('Column ${entry.key} added successfully');
          } catch (e) {
            log('Error adding column ${entry.key}: $e');
          }
        }
      }

      // Verify columns were added
      List<Map<String, dynamic>> updatedResult =
      await db.rawQuery("PRAGMA table_info(session)");
      List<String> updatedColumns = updatedResult.map((col) =>
          col['name'].toString()).toList();
      log('Updated columns: $updatedColumns');
    } catch (e) {
      log('Error in _addColumnIfNotExists: $e');
    }
  }

}






// Helper function to convert objects to JSON-compatible maps

// Save combined session data


// Update existing session
// Future<bool> updateSession(
//     int id,
//     SaveSessionModel session,
//     ArmoryLoadout? loadoutArm,
//     ArmoryFirearm? armoryFirearmA,
//     ArmoryAmmunition? armoryAmmunitionA,
//     String uid) async {
//   try {
//     final db = await DbFileLoadingService().getLocalDatabase();
//
//     await _addColumnIfNotExists(db);
//
//     // Combine all models into a single map
//     final combinedData = {
//       'session': jsonEncode(session.toJson()),
//       'loadout': loadoutArm != null ? jsonEncode(loadoutArm) : null,
//       'firearm': armoryFirearmA != null ? jsonEncode(armoryFirearmA) : null,
//       'ammunition': armoryAmmunitionA != null ? jsonEncode(armoryAmmunitionA) : null,
//       'userId': uid,
//       'created_at': DateTime.now().toIso8601String(),
//     };
//
//     int rowsAffected = await db.update(
//       'session',
//       combinedData,
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//
//     log('Session updated successfully: $rowsAffected rows');
//     return rowsAffected > 0;
//   } catch (e) {
//     log('Error updating session: $e');
//     return false;
//   }
// }

// Get all sessions with combined data (returns raw JSON strings)
// Future<List<Map<String, dynamic>>> getAllSessions() async {
//   try {
//     final db = await DbFileLoadingService().getLocalDatabase();
//     final List<Map<String, dynamic>> results = await db.query('session');
//
//     // Parse the JSON strings back to maps
//     return results.map((row) {
//       return {
//         'session': row['session'] != null
//             ? SaveSessionModel.fromJson(jsonDecode(row['session']))
//             : null,
//         'loadout_json': row['loadout'] != null
//             ? jsonDecode(row['loadout'])
//             : null,
//         'firearm_json': row['firearm'] != null
//             ? jsonDecode(row['firearm'])
//             : null,
//         'ammunition_json': row['ammunition'] != null
//             ? jsonDecode(row['ammunition'])
//             : null,
//         'userId': row['userId'],
//         'created_at': row['created_at'],
//         'id': row['id'],
//       };
//     }).toList();
//   } catch (e) {
//     log('Error getting sessions: $e');
//     return [];
//   }
// }

// Alternative: Get raw data if you want to manually reconstruct objects
// Future<List<Map<String, dynamic>>> getAllSessionsRaw() async {
//   try {
//     final db = await DbFileLoadingService().getLocalDatabase();
//     final List<Map<String, dynamic>> results = await db.query('session');
//
//     return results.map((row) {
//       return {
//         'session_json': row['session'],
//         'loadout_json': row['loadout'],
//         'firearm_json': row['firearm'],
//         'ammunition_json': row['ammunition'],
//         'uid': row['uid'],
//         'created_at': row['created_at'],
//         'id': row['id'],
//       };
//     }).toList();
//   } catch (e) {
//     log('Error getting raw sessions: $e');
//     return [];
//   }
// }

// Get a specific session by ID
// Future<Map<String, dynamic>?> getSessionById(int id) async {
//   try {
//     final db = await DbFileLoadingService().getLocalDatabase();
//     final List<Map<String, dynamic>> results = await db.query(
//       'session',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//
//     if (results.isEmpty) return null;
//
//     final row = results.first;
//     return {
//       'session': row['session'] != null
//           ? SaveSessionModel.fromJson(jsonDecode(row['session']))
//           : null,
//       'loadout_json': row['loadout'] != null
//           ? jsonDecode(row['loadout'])
//           : null,
//       'firearm_json': row['firearm'] != null
//           ? jsonDecode(row['firearm'])
//           : null,
//       'ammunition_json': row['ammunition'] != null
//           ? jsonDecode(row['ammunition'])
//           : null,
//       'uid': row['uid'],
//       'created_at': row['created_at'],
//       'id': row['id'],
//     };
//   } catch (e) {
//     log('Error getting session by ID: $e');
//     return null;
//   }
// }

// Get sessions by UID

// Update column creation to include all new columns

// Delete a session
// Future<bool> deleteSession(int id) async {
//   try {
//     final db = await DbFileLoadingService().getLocalDatabase();
//     await db.delete('session', where: 'id = ?', whereArgs: [id]);
//     log('Session deleted successfully');
//     return true;
//   } catch (e) {
//     log('Error deleting session: $e');
//     return false;
//   }
// }