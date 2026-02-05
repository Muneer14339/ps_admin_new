// lib/src/features/armory/domain/usecases/initial_data_sync_usecase.dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/services/error/failures.dart';
import '../../../../core/services/logger.dart';
import '../../../../core/services/usecases/usecase.dart';
import '../../data/datasources/armory_local_dataresouces.dart';
import '../../data/datasources/armory_remote_datasource.dart';
import '../../data/models/armory_ammunition_model.dart';
import '../../data/models/armory_firearm_model.dart';

class InitialDataSyncUseCase implements UseCase<void, UserIdParams> {
  final ArmoryRemoteDataSource remoteDataSource;
  final ArmoryLocalDataSource localDataSource;

  InitialDataSyncUseCase({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, void>> call(UserIdParams params) async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        log.w('⚠️ No internet - skipping initial sync');
        return const Right(null);
      }

      final isEmpty = await localDataSource.isDatabaseEmpty();
      if (isEmpty) {
        log.i('📥 System data...');
        final systemFirearmsData = await remoteDataSource.getFirearmsRawData();
        final systemFirearms = systemFirearmsData.map<ArmoryFirearmModel>((e) => ArmoryFirearmModel.fromMap(e, e['id'])).toList();
        await localDataSource.saveSystemFirearms(systemFirearms);

        final systemAmmoData = await remoteDataSource.getAmmunitionRawData();
        final systemAmmo = systemAmmoData.map<ArmoryAmmunitionModel>((e) => ArmoryAmmunitionModel.fromMap(e, e['id'])).toList();
        await localDataSource.saveSystemAmmunition(systemAmmo);
        log.i('✅ System: ${systemFirearms.length}F ${systemAmmo.length}A');
      }

      final hasUserData = await localDataSource.hasUserData(params.userId);
      if (!hasUserData) {
        log.i('📥 User data: ${params.userId}');

        final remoteFirearms = await remoteDataSource.getFirearms(params.userId);
        await localDataSource.saveUserFirearms(params.userId, remoteFirearms);
        for (final item in remoteFirearms) {
          await localDataSource.markAsSynced('firearms', params.userId, item.id!);
        }

        final remoteAmmunition = await remoteDataSource.getAmmunition(params.userId);
        await localDataSource.saveUserAmmunition(params.userId, remoteAmmunition);
        for (final item in remoteAmmunition) {
          await localDataSource.markAsSynced('ammunition', params.userId, item.id!);
        }

        final remoteGear = await remoteDataSource.getGear(params.userId);
        await localDataSource.saveUserGear(params.userId, remoteGear);
        for (final item in remoteGear) {
          await localDataSource.markAsSynced('gear', params.userId, item.id!);
        }

        final remoteTools = await remoteDataSource.getTools(params.userId);
        await localDataSource.saveUserTools(params.userId, remoteTools);
        for (final item in remoteTools) {
          await localDataSource.markAsSynced('tools', params.userId, item.id!);
        }

        final remoteLoadouts = await remoteDataSource.getLoadouts(params.userId);
        await localDataSource.saveUserLoadouts(params.userId, remoteLoadouts);
        for (final item in remoteLoadouts) {
          await localDataSource.markAsSynced('loadouts', params.userId, item.id!);
        }

        final remoteMaintenance = await remoteDataSource.getMaintenance(params.userId);
        await localDataSource.saveUserMaintenance(params.userId, remoteMaintenance);
        for (final item in remoteMaintenance) {
          await localDataSource.markAsSynced('maintenance', params.userId, item.id!);
        }

        log.i('✅ User: ${remoteFirearms.length}F ${remoteAmmunition.length}A ${remoteGear.length}G ${remoteTools.length}T ${remoteLoadouts.length}L ${remoteMaintenance.length}M');
      }

      return const Right(null);
    } catch (e, stackTrace) {
      log.e('❌ Init failed: $e\n$stackTrace');
      return Left(FileFailure('Init failed: $e'));
    }
  }
}