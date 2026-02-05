import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/src/core/services/logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pa_sreens/src/core/services/sqflite_service/db_file_loading_service.dart';
import 'package:pa_sreens/src/core/services/usecases/usecase.dart';
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/helper/dio_client.dart';
import 'package:pa_sreens/src/core/theme/theme_bloc/app_theme_bloc.dart';
import 'package:pa_sreens/src/core/theme/theme_data/theme_data.dart';
import 'package:pa_sreens/src/features/armory/data/datasources/armory_local_dataresouces.dart';
import 'package:pa_sreens/src/features/armory/domain/usecases/initial_data_sync_usecase.dart';
import 'package:pa_sreens/src/features/armory/presentation/bloc/armory_bloc.dart';
import 'package:pa_sreens/src/features/armory/presentation/bloc/armory_event.dart';
import 'package:pa_sreens/src/features/armory/presentation/bloc/dropdown/dropdown_bloc.dart';
import 'package:pa_sreens/src/features/auth_new/authentication/presentation/bloc/auth_bloc.dart';
import 'package:pa_sreens/src/features/auth_new/authentication/presentation/pages/login_page.dart';
import 'package:pa_sreens/src/features/bottom_nev/presntation/bloc/tab_bloc.dart';
import 'package:pa_sreens/src/features/session_history/presentation/bloc/session_history_bloc.dart';
import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import 'package:pa_sreens/src/features/train/session/presentation/bloc/session_bloc/session_bloc.dart';
import 'package:pa_sreens/src/features/splash_screen/splash_screen.dart';
import 'package:pa_sreens/src/features/train/session/presentation/bloc/shoQ_data/sho_qdata_bloc.dart';
import 'package:pa_sreens/src/features/train/session/presentation/component/fram_streaming_widget.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_bloc/stage_bloc.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/view/stage_view.dart';
import 'package:pa_sreens/src/features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:pa_sreens/src/features/profile/presentation/blocs/profile_remote_bloc/profile_remote_bloc.dart';
import 'package:pa_sreens/src/features/training_new/presentation/bloc/training_bloc.dart';
import 'package:pa_sreens/src/features/user_dashboard/pages/main_app_page.dart';
import 'package:pa_sreens/src/features/user_dashboard/pages/placeholder_tabs.dart';
import 'src/core/app config/device_config.dart';
import 'src/core/services/locator/locator.dart';
import 'src/core/services/session_sync_service.dart';
import 'src/core/utils/utils.dart';
import 'src/features/train/connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart';
import 'package:path_provider/path_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HydratedBloc.storage = await HydratedStorage.build(
  //   storageDirectory: kIsWeb
  //       ? HydratedStorage.webStorageDirectory
  //       : await getApplicationDocumentsDirectory(),
  // );
  await Firebase.initializeApp();
  Logger.configure();
  await init();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );


  prefs = await initializeSharedPreference();
  configLocator();

  // Initialize auth token in DioClient if exists
  final localStorageService = locator.get<LocalStorageService>();
  final savedToken = localStorageService.getAccessToken();
  if (savedToken != null && savedToken.isNotEmpty) {
    final dioClient = locator.get<DioClient>();
    dioClient.updateAuthToken(savedToken);
  }

  await DbFileLoadingService().openDatabaseFromAssets();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    runApp(MultiBlocProvider(providers: [
      BlocProvider(create: (context) => locator<StageBloc>()),
      BlocProvider(create: (context) => locator<AuthBloc>()),
      BlocProvider(create: (context) => locator<ProfileBloc>()),
      BlocProvider(create: (context) => locator<SessionBloc>()),
      BlocProvider(create: (context) => locator<TabBloc>()),
      BlocProvider(create: (context) => locator<TrainingBloc>()),
      BlocProvider(create: (context) => locator<CameraWifiBloc>()),
      BlocProvider(create: (context) => locator<ShoQdataBloc>()),
      BlocProvider(create: (context) => locator<AppBleDeviceBloc>()),
      BlocProvider(create: (context) => slRtspStreamingBloc),
      BlocProvider<SessionHistoryBloc>(create: (context) => slSessionHistoryBloc),
      BlocProvider(create: (context) => listeningTimerBloc),
      BlocProvider<TrainingBloc>(create: (_) => locator<TrainingBloc>()),
      BlocProvider<ArmoryBloc>(create: (_) => locator<ArmoryBloc>()),
      BlocProvider<DropdownBloc>(create: (_) => locator<DropdownBloc>()),
    ], child: const MainApp()));


}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return ScreenUtilInit(
      designSize: Size(width, height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        final isMobile = DeviceConfig.isMobile(context);

        if (isMobile) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
        } else {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft,
          ]);
        }

        return BlocProvider(
          create: (context) => AppThemeBloc(),
          child: BlocBuilder<AppThemeBloc, AppThemeState>(
            builder: (context, state) {
              final botToastBuilder = BotToastInit();
              return GestureDetector(
                onTap: () {
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                },
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  initialRoute: '/',
                  builder: (context, child) {
                    child = botToastBuilder(context, child);
                    return child;
                  },
                  theme: AppTheme.lightTheme(),
                  navigatorObservers: [BotToastNavigatorObserver()],
                  routes: {
                    '/stage': (context) => const StageView(),
                  },
                  home: const AuthWrapper(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    // Check if user is already logged in
    context.read<AuthBloc>().add(const AuthEvent.checkLoginStatus());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.maybeMap(
          initial: (_) => Scaffold(
            backgroundColor: AppTheme.background(context),
            body: Center(child: CircularProgressIndicator(color: AppTheme.primary(context))),
          ),
          loading: (l) {
            // Only show loading screen for checkStatus, not for login/signup/etc
            // Let individual pages handle their own loading states
            if (l.type == LoadingType.checkStatus) {
              return Scaffold(
                backgroundColor: AppTheme.background(context),
                body: Center(child: CircularProgressIndicator(color: AppTheme.primary(context))),
              );
            }
            // For other loading types, show LoginPage (which will handle its own loading)
            return const LoginPage();
          },
          authenticated: (s) => DataSyncWrapper(userId: s.user.uid),
          unauthenticated: (_) => const LoginPage(),
          error: (_) => const LoginPage(),
          orElse: () => const LoginPage(),
        );
      },
    );
  }
}

class DataSyncWrapper extends StatefulWidget {
  final String userId;
  const DataSyncWrapper({super.key, required this.userId});

  @override
  State<DataSyncWrapper> createState() => _DataSyncWrapperState();
}

class _DataSyncWrapperState extends State<DataSyncWrapper> {
  bool _syncCompleted = false;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  // lib/main.dart - Update DataSyncWrapper _initializeData method
  Future<void> _initializeData() async {
    context.read<ArmoryBloc>().add(SyncLocalToRemoteEvent(userId: widget.userId));

    try {
      final localDataSource = locator<ArmoryLocalDataSource>();
      final isEmpty = await localDataSource.isDatabaseEmpty();

      if (isEmpty) {
        log.i('🔄 Init sync...');
        final syncUseCase = locator<InitialDataSyncUseCase>();
        final result = await syncUseCase(UserIdParams(userId: widget.userId));

        await result.fold(
              (failure) async {
            log.e('❌ Init failed: $failure');
            if (mounted) setState(() => _syncCompleted = false);
          },
              (_) async {
            log.i('✅ Init done');
            if (mounted) setState(() => _syncCompleted = true);
          },
        );
      } else {
        log.i('✅ Has data');
        if (mounted) setState(() => _syncCompleted = true);
      }

      final sessionSyncService = locator<SessionSyncService>();
      sessionSyncService.syncSessionsToRemote(widget.userId);

      if (mounted) {
        context.read<ArmoryBloc>().add(SyncRemoteToLocalEvent(userId: widget.userId));
      }
    } catch (e) {
      log.e('❌ Error: $e');
      if (mounted) setState(() => _syncCompleted = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_syncCompleted) {
      return Scaffold(
        backgroundColor: AppTheme.background(context),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: AppTheme.primary(context)),
              SizedBox(height: AppTheme.spacingLarge),
              Text('Loading your armory data...', style: AppTheme.bodyLarge(context)),
              SizedBox(height: AppTheme.spacingMedium),
              TextButton(
                onPressed: () => _initializeData(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return const MainAppPage();
  }
}

