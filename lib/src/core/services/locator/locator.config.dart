// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pa_sreens/src/core/helper/dio_client.dart' as _i887;
import 'package:pa_sreens/src/core/routes/routes_services.dart' as _i1048;
import 'package:pa_sreens/src/core/services/connectivity_service.dart' as _i168;
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart'
    as _i493;
import 'package:pa_sreens/src/core/services/session_sync_service.dart' as _i505;
import 'package:pa_sreens/src/core/services/sqflite_service/database_helper.dart'
    as _i267;
import 'package:pa_sreens/src/core/services/sqflite_service/stages_db_service.dart'
    as _i107;
import 'package:pa_sreens/src/core/utils/app_keys.dart' as _i571;
import 'package:pa_sreens/src/features/auth_new/authentication/data/datasources/auth_remote_datasource.dart'
    as _i902;
import 'package:pa_sreens/src/features/auth_new/authentication/data/repositories/auth_repository_impl.dart'
    as _i777;
import 'package:pa_sreens/src/features/auth_new/authentication/domain/repositories/auth_repository.dart'
    as _i257;
import 'package:pa_sreens/src/features/auth_new/authentication/domain/usecases/auth_usecase.dart'
    as _i130;
import 'package:pa_sreens/src/features/auth_new/authentication/presentation/bloc/auth_bloc.dart'
    as _i297;
import 'package:pa_sreens/src/features/bottom_nev/presntation/bloc/tab_bloc.dart'
    as _i265;
import 'package:pa_sreens/src/features/profile/data/remote/service/profile_service.dart'
    as _i332;
import 'package:pa_sreens/src/features/profile/data/remote/source/profile_source.dart'
    as _i936;
import 'package:pa_sreens/src/features/profile/data/remote/source/profile_source_impl.dart'
    as _i1025;
import 'package:pa_sreens/src/features/profile/data/repository/profile_repo_impl.dart'
    as _i511;
import 'package:pa_sreens/src/features/profile/domain/repository/profile_repo.dart'
    as _i2;
import 'package:pa_sreens/src/features/profile/domain/usecase/profile_usecase.dart'
    as _i762;
import 'package:pa_sreens/src/features/profile/presentation/blocs/profile_bloc/profile_bloc.dart'
    as _i679;
import 'package:pa_sreens/src/features/session_history/presentation/bloc/session_history_bloc.dart'
    as _i530;
import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart'
    as _i695;
import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/bluetooth_bloc/timer_bloc/listning_timer_bloc.dart'
    as _i541;
import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart'
    as _i154;
import 'package:pa_sreens/src/features/train/session/data/local/service/session_db_helper.dart'
    as _i388;
import 'package:pa_sreens/src/features/train/session/presentation/bloc/rtsp_streaming/rtsp_streaming_bloc.dart'
    as _i240;
import 'package:pa_sreens/src/features/train/session/presentation/bloc/session_bloc/session_bloc.dart'
    as _i994;
import 'package:pa_sreens/src/features/train/session/presentation/bloc/shoQ_data/sho_qdata_bloc.dart'
    as _i525;
import 'package:pa_sreens/src/features/train/stage/data/local/service/stage_db_helper.dart'
    as _i802;
import 'package:pa_sreens/src/features/train/stage/data/local/source/stage_source.dart'
    as _i424;
import 'package:pa_sreens/src/features/train/stage/data/local/source/stage_source_impl.dart'
    as _i939;
import 'package:pa_sreens/src/features/train/stage/data/repository/stage_repo_impl.dart'
    as _i332;
import 'package:pa_sreens/src/features/train/stage/domain/repository/stage_repository.dart'
    as _i151;
import 'package:pa_sreens/src/features/train/stage/domain/usecase/stage_usecase.dart'
    as _i509;
import 'package:pa_sreens/src/features/train/stage/features/distance/data/local/service/distance_db_helper.dart'
    as _i47;
import 'package:pa_sreens/src/features/train/stage/features/distance/data/local/source/distance_source.dart'
    as _i512;
import 'package:pa_sreens/src/features/train/stage/features/distance/data/local/source/distance_source_impl.dart'
    as _i480;
import 'package:pa_sreens/src/features/train/stage/features/distance/data/repository/mode_repo_impl.dart'
    as _i932;
import 'package:pa_sreens/src/features/train/stage/features/distance/domain/repository/distance_repository.dart'
    as _i754;
import 'package:pa_sreens/src/features/train/stage/features/distance/domain/usecase/distance_usecase.dart'
    as _i477;
import 'package:pa_sreens/src/features/train/stage/features/drill/data/local/service/drill_db_helper.dart'
    as _i40;
import 'package:pa_sreens/src/features/train/stage/features/drill/data/local/source/drill_source.dart'
    as _i338;
import 'package:pa_sreens/src/features/train/stage/features/drill/data/local/source/drill_source_impl.dart'
    as _i59;
import 'package:pa_sreens/src/features/train/stage/features/drill/data/repository/drill_repo_impl.dart'
    as _i73;
import 'package:pa_sreens/src/features/train/stage/features/drill/domain/repository/drill_repository.dart'
    as _i665;
import 'package:pa_sreens/src/features/train/stage/features/drill/domain/usecase/drill_usecase.dart'
    as _i373;
import 'package:pa_sreens/src/features/train/stage/features/drill/presentation/drills_cubit_state/drills_cubit.dart'
    as _i122;
import 'package:pa_sreens/src/features/train/stage/features/firearm/data/local/service/firearm_db_helper.dart'
    as _i292;
import 'package:pa_sreens/src/features/train/stage/features/firearm/data/local/source/firearm_source.dart'
    as _i483;
import 'package:pa_sreens/src/features/train/stage/features/firearm/data/local/source/firearm_source_impl.dart'
    as _i59;
import 'package:pa_sreens/src/features/train/stage/features/firearm/data/repository/firearm_repo_impl.dart'
    as _i1036;
import 'package:pa_sreens/src/features/train/stage/features/firearm/domain/repository/furearm_repository.dart'
    as _i852;
import 'package:pa_sreens/src/features/train/stage/features/firearm/domain/usecase/firearm_usecase.dart'
    as _i1069;
import 'package:pa_sreens/src/features/train/stage/features/mode/data/local/service/mode_db_helper.dart'
    as _i146;
import 'package:pa_sreens/src/features/train/stage/features/mode/data/local/source/mode_source.dart'
    as _i350;
import 'package:pa_sreens/src/features/train/stage/features/mode/data/local/source/mode_source_impl.dart'
    as _i1049;
import 'package:pa_sreens/src/features/train/stage/features/mode/data/repository/mode_repo_impl.dart'
    as _i683;
import 'package:pa_sreens/src/features/train/stage/features/mode/domain/repository/mode_repository.dart'
    as _i763;
import 'package:pa_sreens/src/features/train/stage/features/mode/domain/usecase/mode_usecase.dart'
    as _i870;
import 'package:pa_sreens/src/features/train/stage/features/single_line_stages/data/local/service/singleline_db_helper.dart'
    as _i688;
import 'package:pa_sreens/src/features/train/stage/features/single_line_stages/data/local/source/single_line_impl.dart'
    as _i95;
import 'package:pa_sreens/src/features/train/stage/features/single_line_stages/data/local/source/single_line_source.dart'
    as _i358;
import 'package:pa_sreens/src/features/train/stage/features/single_line_stages/data/repository/mode_repo_impl.dart'
    as _i1010;
import 'package:pa_sreens/src/features/train/stage/features/single_line_stages/domain/repository/mode_repository.dart'
    as _i494;
import 'package:pa_sreens/src/features/train/stage/features/single_line_stages/domain/usecase/mode_usecase.dart'
    as _i804;
import 'package:pa_sreens/src/features/train/stage/presentation/stage_bloc/stage_bloc.dart'
    as _i398;
import 'package:pa_sreens/src/features/training_new/presentation/bloc/training_bloc.dart'
    as _i71;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i107.StagesDBService>(() => _i107.StagesDBService());
    gh.factory<_i265.TabBloc>(() => _i265.TabBloc());
    gh.factory<_i332.ProfileService>(() => _i332.ProfileService());
    gh.factory<_i530.SessionHistoryBloc>(() => _i530.SessionHistoryBloc());
    gh.factory<_i695.AppBleDeviceBloc>(() => _i695.AppBleDeviceBloc());
    gh.factory<_i541.ListningTimerBloc>(() => _i541.ListningTimerBloc());
    gh.factory<_i154.CameraWifiBloc>(() => _i154.CameraWifiBloc());
    gh.factory<_i388.SessionDbHelper>(() => _i388.SessionDbHelper());
    gh.factory<_i240.RtspStreamingBloc>(() => _i240.RtspStreamingBloc());
    gh.factory<_i994.SessionBloc>(() => _i994.SessionBloc());
    gh.factory<_i525.ShoQdataBloc>(() => _i525.ShoQdataBloc());
    gh.factory<_i802.StageDbHelper>(() => _i802.StageDbHelper());
    gh.factory<_i47.DistanceDbHelper>(() => _i47.DistanceDbHelper());
    gh.factory<_i40.DrillDbHelper>(() => _i40.DrillDbHelper());
    gh.factory<_i292.FirearmDbHelper>(() => _i292.FirearmDbHelper());
    gh.factory<_i146.ModeDbHelper>(() => _i146.ModeDbHelper());
    gh.factory<_i688.SingleLineStagesHelper>(
      () => _i688.SingleLineStagesHelper(),
    );
    gh.factory<_i398.StageBloc>(() => _i398.StageBloc());
    gh.factory<_i71.TrainingBloc>(() => _i71.TrainingBloc());
    gh.singleton<_i887.DioClient>(() => _i887.DioClient());
    gh.singleton<_i168.ConnectivityService>(() => _i168.ConnectivityService());
    gh.singleton<_i267.DatabaseHelper>(() => _i267.DatabaseHelper());
    gh.singleton<_i571.AppKeys>(() => _i571.AppKeys());
    gh.lazySingleton<_i1048.RoutesService>(() => _i1048.RoutesService());
    gh.factory<_i483.FirearmSource>(() => _i59.FirearmSourceImpl());
    gh.factory<_i424.StageSource>(() => _i939.DistanceSourceImpl());
    gh.factory<_i512.DistanceSource>(() => _i480.DistanceSourceImpl());
    gh.factory<_i350.ModeSource>(() => _i1049.ModelSourceImpl());
    gh.factory<_i936.ProfileSource>(() => _i1025.ProfileSourceImpl());
    gh.factory<_i2.ProfileRepository>(
      () => _i511.ProfileRepositoryImpl(gh<_i936.ProfileSource>()),
    );
    gh.singleton<_i505.SessionSyncService>(
      () => _i505.SessionSyncService(
        gh<_i168.ConnectivityService>(),
        gh<_i267.DatabaseHelper>(),
      ),
    );
    gh.factory<_i358.SingleLineSource>(() => _i95.SingleLineImpl());
    gh.factory<_i762.ProfileUsecase>(
      () => _i762.ProfileUsecase(gh<_i2.ProfileRepository>()),
    );
    gh.factory<_i338.DrillSource>(() => _i59.DrillSourceImpl());
    gh.factory<_i754.DistanceRepository>(
      () => _i932.DistanceRepositoryImpl(gh<_i512.DistanceSource>()),
    );
    gh.factory<_i151.StageRepository>(
      () => _i332.StageRepositoryImpl(gh<_i424.StageSource>()),
    );
    gh.singleton<_i493.LocalStorageService>(
      () => _i493.LocalStorageService(gh<_i571.AppKeys>()),
    );
    gh.factory<_i852.FirearmRepository>(
      () => _i1036.FirearmRepositoryImpl(gh<_i483.FirearmSource>()),
    );
    gh.singleton<_i902.AuthRemoteDataSource>(
      () => _i902.AuthRemoteDataSourceImpl(gh<_i887.DioClient>()),
    );
    gh.factory<_i763.ModeRepository>(
      () => _i683.ModeRepositoryImpl(gh<_i350.ModeSource>()),
    );
    gh.factory<_i665.DrillRepository>(
      () => _i73.DrillRepositoryImpl(gh<_i338.DrillSource>()),
    );
    gh.factory<_i1069.FirearmUsecase>(
      () => _i1069.FirearmUsecase(gh<_i852.FirearmRepository>()),
    );
    gh.factory<_i494.SingleLineRepository>(
      () => _i1010.SingleLineRepositoryImpl(gh<_i358.SingleLineSource>()),
    );
    gh.factory<_i509.Stagecase>(
      () => _i509.Stagecase(gh<_i151.StageRepository>()),
    );
    gh.factory<_i870.ModeUsecase>(
      () => _i870.ModeUsecase(gh<_i763.ModeRepository>()),
    );
    gh.factory<_i804.ModeUsecase>(
      () => _i804.ModeUsecase(gh<_i763.ModeRepository>()),
    );
    gh.factory<_i257.AuthRepository>(
      () => _i777.AuthRepositoryImpl(gh<_i902.AuthRemoteDataSource>()),
    );
    gh.factory<_i373.DrillUsecase>(
      () => _i373.DrillUsecase(gh<_i665.DrillRepository>()),
    );
    gh.factory<_i679.ProfileBloc>(
      () => _i679.ProfileBloc(gh<_i762.ProfileUsecase>()),
    );
    gh.factory<_i477.DistanceUsecase>(
      () => _i477.DistanceUsecase(gh<_i754.DistanceRepository>()),
    );
    gh.factory<_i130.AuthUseCase>(
      () => _i130.AuthUseCase(gh<_i257.AuthRepository>()),
    );
    gh.factory<_i122.DrillsCubit>(
      () => _i122.DrillsCubit(gh<_i373.DrillUsecase>()),
    );
    gh.factory<_i297.AuthBloc>(
      () => _i297.AuthBloc(
        gh<_i130.AuthUseCase>(),
        gh<_i505.SessionSyncService>(),
      ),
    );
    return this;
  }
}
