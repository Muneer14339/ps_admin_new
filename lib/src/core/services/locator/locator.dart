import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/core/services/locator/locator.config.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../features/armory/data/datasources/armory_local_dataresouces.dart';
import '../../../features/armory/data/datasources/armory_local_repository_impl.dart';
import '../../../features/armory/data/datasources/armory_remote_datasource.dart';
import '../../../features/armory/data/repositories/armory_repository_impl.dart';
import '../../../features/armory/domain/repositories/armory_repository.dart';
import '../../../features/armory/domain/usecases/add_ammunition_usecase.dart' as user_add_ammo;
import '../../../features/armory/domain/usecases/add_firearm_usecase.dart';
import '../../../features/armory/domain/usecases/add_gear_usecase.dart';
import '../../../features/armory/domain/usecases/add_loadout_usecase.dart';
import '../../../features/armory/domain/usecases/add_maintenance_usecase.dart';
import '../../../features/armory/domain/usecases/add_tool_usecase.dart';
import '../../../features/armory/domain/usecases/batch_delete_ammunition_usecase.dart';
import '../../../features/armory/domain/usecases/batch_delete_loadouts_usecase.dart';
import '../../../features/armory/domain/usecases/delete_ammunition_usecase.dart';
import '../../../features/armory/domain/usecases/delete_firearm_usecase.dart';
import '../../../features/armory/domain/usecases/delete_gear_usecase.dart';
import '../../../features/armory/domain/usecases/delete_loadout_usecase.dart';
import '../../../features/armory/domain/usecases/delete_maintenance_usecase.dart';
import '../../../features/armory/domain/usecases/delete_tool_usecase.dart';
import '../../../features/armory/domain/usecases/get_ammunition_usecase.dart' as user_ammo;
import '../../../features/armory/domain/usecases/get_dropdown_options_usecase.dart';
import '../../../features/armory/domain/usecases/get_firearms_usecase.dart' as user_firearms;
import '../../../features/armory/domain/usecases/get_gear_usecase.dart';
import '../../../features/armory/domain/usecases/get_loadouts_usecase.dart';
import '../../../features/armory/domain/usecases/get_maintenance_usecase.dart';
import '../../../features/armory/domain/usecases/get_tools_usecase.dart';
import '../../../features/armory/domain/usecases/initial_data_sync_usecase.dart';
import '../../../features/armory/domain/usecases/sync_local_to_remote_usecase.dart';
import '../../../features/armory/domain/usecases/sync_remote_to_local_usecase.dart';
import '../../../features/armory/presentation/bloc/armory_bloc.dart';
import '../../../features/armory/presentation/bloc/dropdown/dropdown_bloc.dart';
import '../../../features/train/session/presentation/bloc/session_bloc/session_bloc.dart';
import '../sqflite_service/database_helper.dart';

final GetIt locator = GetIt.instance;

@InjectableInit()
void configLocator() => locator.init();


final  slSessionBlocLocat = locator<SessionBloc>();

Future<void> init() async {

  locator.registerLazySingleton(() => SyncLocalToRemoteUseCase(
    localDataSource: locator(),
    remoteDataSource: locator(),
  ));

  locator.registerLazySingleton(() => SyncRemoteToLocalUseCase(
    localDataSource: locator(),
    remoteDataSource: locator(),
    dbHelper: locator(),
  ));

  // lib/injection_container.dart - UPDATE ArmoryBloc factory

  locator.registerFactory(
        () => ArmoryBloc(
      getFirearmsUseCase: locator<user_firearms.GetFirearmsUseCase>(),
      addFirearmUseCase: locator(),
      getAmmunitionUseCase: locator<user_ammo.GetAmmunitionUseCase>(),
      addAmmunitionUseCase: locator<user_add_ammo.AddAmmunitionUseCase>(),
      getGearUseCase: locator(),
      addGearUseCase: locator(),
      getToolsUseCase: locator(),
      addToolUseCase: locator(),
      getLoadoutsUseCase: locator(),
      addLoadoutUseCase: locator(),
      getMaintenanceUseCase: locator(),
      addMaintenanceUseCase: locator(),
      deleteFirearmUseCase: locator(),
      deleteAmmunitionUseCase: locator(),
      deleteGearUseCase: locator(),
      deleteLoadoutUseCase: locator(),
      deleteMaintenanceUseCase: locator(),
      deleteToolUseCase: locator(),
      syncLocalToRemoteUseCase: locator(),
      syncRemoteToLocalUseCase: locator(),
      batchDeleteLoadoutsUseCase: locator(),
      batchDeleteAmmunitionUseCase: locator(),
    ),
  );
  locator.registerFactory(() => DropdownBloc(getDropdownOptionsUseCase: locator<GetDropdownOptionsUseCase>()));

  locator.registerLazySingleton(() => user_firearms.GetFirearmsUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => AddFirearmUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => user_ammo.GetAmmunitionUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => user_add_ammo.AddAmmunitionUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => GetGearUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => AddGearUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => GetToolsUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => AddToolUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => GetLoadoutsUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => AddLoadoutUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => GetMaintenanceUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => AddMaintenanceUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => DeleteFirearmUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => DeleteAmmunitionUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => DeleteGearUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => DeleteToolUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => DeleteLoadoutUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => DeleteMaintenanceUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => BatchDeleteLoadoutsUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => BatchDeleteAmmunitionUseCase(locator<ArmoryRepository>()));
  locator.registerLazySingleton(() => GetDropdownOptionsUseCase(locator<ArmoryRepository>(), locator<FirebaseAuth>()));
  locator.registerLazySingleton(() => InitialDataSyncUseCase(remoteDataSource: locator(), localDataSource: locator()));


  locator.registerLazySingleton<ArmoryRepository>(
        () => ArmoryRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<ArmoryRemoteDataSource>(
        () => ArmoryRemoteDataSourceImpl(firestore: locator()),
  );

  locator.registerLazySingleton<ArmoryLocalDataSource>(
        () => ArmoryLocalDataSourceImpl(dbHelper: locator()),
  );

  // DatabaseHelper is now registered via @singleton annotation
  locator.registerLazySingleton(() => FirebaseAuth.instance);
  locator.registerLazySingleton(() => FirebaseFirestore.instance);
  locator.registerLazySingleton(() => GoogleSignIn());
}


//
// void setupLocator() {
//    locator.registerLazySingleton(() => RoutesService());
// }