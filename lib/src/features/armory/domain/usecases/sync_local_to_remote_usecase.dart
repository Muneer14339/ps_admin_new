// lib/src/features/armory/domain/usecases/sync_remote_to_local_usecase.dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/services/error/failures.dart';
import '../../../../core/services/logger.dart';
import '../../../../core/services/sqflite_service/database_helper.dart';
import '../../../../core/services/usecases/usecase.dart';
import '../../data/datasources/armory_local_dataresouces.dart';
import '../../data/datasources/armory_remote_datasource.dart';

class SyncRemoteToLocalUseCase implements UseCase<void, UserIdParams> {
  final ArmoryLocalDataSource localDataSource;
  final ArmoryRemoteDataSource remoteDataSource;
  final DatabaseHelper dbHelper;

  SyncRemoteToLocalUseCase({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.dbHelper,
  });

  @override
  Future<Either<Failure, void>> call(UserIdParams params) async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        log.w('⚠️ No internet - skipping download sync');
        return const Right(null);
      }

      log.i('🔽 Download sync for: ${params.userId}');
      final db = await dbHelper.database;

      // Firearms
      final remoteFirearms = await remoteDataSource.getFirearms(params.userId);
      final remoteFirearmIds = remoteFirearms.map((e) => e.id!).toSet();
      final localFirearms = await db.query('firearms', where: 'userId = ?', whereArgs: [params.userId]);

      for (final local in localFirearms) {
        if (!remoteFirearmIds.contains(local['id']) && local['syncStatus'] == 'synced') {
          await db.delete('firearms', where: 'id = ? AND userId = ?', whereArgs: [local['id'], params.userId]);
        }
      }

      final localFirearmIds = localFirearms.map((e) => e['id'] as String).toSet();
      for (final firearm in remoteFirearms) {
        if (!localFirearmIds.contains(firearm.id)) {
          await localDataSource.addFirearm(params.userId, firearm);
          await localDataSource.markAsSynced('firearms', params.userId, firearm.id!);
        }
      }

      // Ammunition
      final remoteAmmo = await remoteDataSource.getAmmunition(params.userId);
      final remoteAmmoIds = remoteAmmo.map((e) => e.id!).toSet();
      final localAmmo = await db.query('ammunition', where: 'userId = ?', whereArgs: [params.userId]);

      for (final local in localAmmo) {
        if (!remoteAmmoIds.contains(local['id']) && local['syncStatus'] == 'synced') {
          await db.delete('ammunition', where: 'id = ? AND userId = ?', whereArgs: [local['id'], params.userId]);
        }
      }

      final localAmmoIds = localAmmo.map((e) => e['id'] as String).toSet();
      for (final ammo in remoteAmmo) {
        if (!localAmmoIds.contains(ammo.id)) {
          await localDataSource.addAmmunition(params.userId, ammo);
          await localDataSource.markAsSynced('ammunition', params.userId, ammo.id!);
        }
      }

      // Gear
      final remoteGear = await remoteDataSource.getGear(params.userId);
      final remoteGearIds = remoteGear.map((e) => e.id!).toSet();
      final localGear = await db.query('gear', where: 'userId = ?', whereArgs: [params.userId]);

      for (final local in localGear) {
        if (!remoteGearIds.contains(local['id']) && local['syncStatus'] == 'synced') {
          await db.delete('gear', where: 'id = ? AND userId = ?', whereArgs: [local['id'], params.userId]);
        }
      }

      final localGearIds = localGear.map((e) => e['id'] as String).toSet();
      for (final gear in remoteGear) {
        if (!localGearIds.contains(gear.id)) {
          await localDataSource.addGear(params.userId, gear);
          await localDataSource.markAsSynced('gear', params.userId, gear.id!);
        }
      }

      // Tools
      final remoteTools = await remoteDataSource.getTools(params.userId);
      final remoteToolIds = remoteTools.map((e) => e.id!).toSet();
      final localTools = await db.query('tools', where: 'userId = ?', whereArgs: [params.userId]);

      for (final local in localTools) {
        if (!remoteToolIds.contains(local['id']) && local['syncStatus'] == 'synced') {
          await db.delete('tools', where: 'id = ? AND userId = ?', whereArgs: [local['id'], params.userId]);
        }
      }

      final localToolIds = localTools.map((e) => e['id'] as String).toSet();
      for (final tool in remoteTools) {
        if (!localToolIds.contains(tool.id)) {
          await localDataSource.addTool(params.userId, tool);
          await localDataSource.markAsSynced('tools', params.userId, tool.id!);
        }
      }

      // Loadouts
      final remoteLoadouts = await remoteDataSource.getLoadouts(params.userId);
      final remoteLoadoutIds = remoteLoadouts.map((e) => e.id!).toSet();
      final localLoadouts = await db.query('loadouts', where: 'userId = ?', whereArgs: [params.userId]);

      for (final local in localLoadouts) {
        if (!remoteLoadoutIds.contains(local['id']) && local['syncStatus'] == 'synced') {
          await db.delete('loadouts', where: 'id = ? AND userId = ?', whereArgs: [local['id'], params.userId]);
        }
      }

      final localLoadoutIds = localLoadouts.map((e) => e['id'] as String).toSet();
      for (final loadout in remoteLoadouts) {
        if (!localLoadoutIds.contains(loadout.id)) {
          await localDataSource.addLoadout(params.userId, loadout);
          await localDataSource.markAsSynced('loadouts', params.userId, loadout.id!);
        }
      }

      // Maintenance
      final remoteMaintenance = await remoteDataSource.getMaintenance(params.userId);
      final remoteMaintenanceIds = remoteMaintenance.map((e) => e.id!).toSet();
      final localMaintenance = await db.query('maintenance', where: 'userId = ?', whereArgs: [params.userId]);

      for (final local in localMaintenance) {
        if (!remoteMaintenanceIds.contains(local['id']) && local['syncStatus'] == 'synced') {
          await db.delete('maintenance', where: 'id = ? AND userId = ?', whereArgs: [local['id'], params.userId]);
        }
      }

      final localMaintenanceIds = localMaintenance.map((e) => e['id'] as String).toSet();
      for (final maintenance in remoteMaintenance) {
        if (!localMaintenanceIds.contains(maintenance.id)) {
          await localDataSource.addMaintenance(params.userId, maintenance);
          await localDataSource.markAsSynced('maintenance', params.userId, maintenance.id!);
        }
      }

      log.i('✅ Download: F:${remoteFirearms.length} A:${remoteAmmo.length} G:${remoteGear.length} T:${remoteTools.length} L:${remoteLoadouts.length} M:${remoteMaintenance.length}');
      return const Right(null);
    } catch (e) {
      log.e('❌ Download failed: $e');
      return Left(FileFailure('Download failed: $e'));
    }
  }
}