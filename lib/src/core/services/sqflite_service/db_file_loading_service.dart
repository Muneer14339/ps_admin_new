import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pa_sreens/src/core/services/sqflite_service/stages_db_service.dart';
import 'package:pa_sreens/src/core/utils/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbFileLoadingService {
  Database? _localDatabase;

  Future<void> openDatabaseFromAssets() async {
    var databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, databaseName);

    bool exists = await databaseExists(dbPath);

    if (!exists) {
      log("Copying database from assets...");
      try {
        ByteData data = await rootBundle.load("assets/database/$databaseName");
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(dbPath).writeAsBytes(bytes);
        final db = await getLocalDatabase();
        await StagesDBService().addAdditionalTables(db);
      } catch (e) {
        log("Error copying the database: $e");
        // return [];
      }
    } else {
      getLocalDatabase();
      // log("Database already exists = $dbPath");
    }

    Database assetDatabase = await openDatabase(dbPath);

    await assetDatabase.close();
  }
  //---------------------------------------------------
  Future<Database> getLocalDatabase() async {
    if (_localDatabase != null) {
      return _localDatabase!;
    }

    var databasesPath = await getDatabasesPath();
    String localDbPath = join(databasesPath, databaseName);

    _localDatabase = await openDatabase(localDbPath,version: 3);
    print('--- paths $localDbPath');

    return _localDatabase!;
  }
  //---------------------------------------------------
  Future<bool> doesTableExist(Database db, String tableName) async {
    var result = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
      [tableName],
    );
    return result.isNotEmpty;
  }
  //---------------------------------------------------
  Future<void> insertDataIntoStages(List<Map<String, dynamic>> data) async {
    Database db = await getLocalDatabase();
    for (var record in data) {
      await db.insert('stages', record);
    }
  }

}
