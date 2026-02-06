// lib/src/features/armory/domain/usecases/sync_local_to_remote_usecase.dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/services/error/failures.dart';
import '../../../../core/services/logger.dart';
import '../../../../core/services/usecases/usecase.dart';
import '../../data/datasources/armory_local_dataresouces.dart';
import '../../data/datasources/armory_local_repository_impl.dart';
import '../../data/datasources/armory_remote_datasource.dart';

class SyncLocalToRemoteUseCase implements UseCase<void, UserIdParams> {
  final ArmoryLocalDataSource localDataSource;
  final ArmoryRemoteDataSource remoteDataSource;

  SyncLocalToRemoteUseCase({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, void>> call(UserIdParams params) async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        log.w('⚠️ No internet - skipping upload sync');
        return const Right(null);
      }

      log.i('🔼 Upload sync for: ${params.userId}');
      final impl = localDataSource as ArmoryLocalDataSourceImpl;

      // Delete items
      final tables = ['firearms', 'ammunition', 'gear', 'tools', 'loadouts', 'maintenance'];
      final deleteMethods = [
        remoteDataSource.deleteFirearm,
        remoteDataSource.deleteAmmunition,
        remoteDataSource.deleteGear,
        remoteDataSource.deleteTool,
        remoteDataSource.deleteLoadout,
        remoteDataSource.deleteMaintenance,
      ];

      for (var i = 0; i < tables.length; i++) {
        final items = await impl.getDeletedItems(params.userId, tables[i]);
        for (final item in items) {
          try {
            await deleteMethods[i](params.userId, item['id'] as String);
          } catch (e) {
            if (!e.toString().contains('not-found')) rethrow;
          }
          final db = await impl.db;
          await db.delete(tables[i], where: 'id = ? AND userId = ?', whereArgs: [item['id'], params.userId]);
        }
        log.i('🗑️ Deleted ${items.length} ${tables[i]}');
      }

      // Upload unsynced items
      final firearms = await localDataSource.getUnsyncedFirearms(params.userId);
      for (final item in firearms) {
        await remoteDataSource.addFirearm(params.userId, item);
        await localDataSource.markAsSynced('firearms', params.userId, item.id!);
      }

      final ammo = await localDataSource.getUnsyncedAmmunition(params.userId);
      for (final item in ammo) {
        await remoteDataSource.addAmmunition(params.userId, item);
        await localDataSource.markAsSynced('ammunition', params.userId, item.id!);
      }

      final gear = await localDataSource.getUnsyncedGear(params.userId);
      for (final item in gear) {
        await remoteDataSource.addGear(params.userId, item);
        await localDataSource.markAsSynced('gear', params.userId, item.id!);
      }

      final tools = await localDataSource.getUnsyncedTools(params.userId);
      for (final item in tools) {
        await remoteDataSource.addTool(params.userId, item);
        await localDataSource.markAsSynced('tools', params.userId, item.id!);
      }

      final loadouts = await localDataSource.getUnsyncedLoadouts(params.userId);
      for (final item in loadouts) {
        await remoteDataSource.addLoadout(params.userId, item);
        await localDataSource.markAsSynced('loadouts', params.userId, item.id!);
      }

      final maintenance = await localDataSource.getUnsyncedMaintenance(params.userId);
      for (final item in maintenance) {
        await remoteDataSource.addMaintenance(params.userId, item);
        await localDataSource.markAsSynced('maintenance', params.userId, item.id!);
      }

      log.i('✅ Upload: F:${firearms.length} A:${ammo.length} G:${gear.length} T:${tools.length} L:${loadouts.length} M:${maintenance.length}');
      return const Right(null);
    } catch (e) {
      log.e('❌ Upload failed: $e');
      return Left(FileFailure('Upload failed: $e'));
    }
  }
}