import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/armory/domain/usecases/initial_data_sync_usecase.dart';
import 'package:pa_sreens/authentication/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:pa_sreens/core/routes/app_pages.dart';
import 'package:pa_sreens/core/routes/locatore.dart';
import 'package:pa_sreens/core/usecases/usecase.dart';
import 'package:pa_sreens/core/utills/logger.dart';
import 'package:pa_sreens/training/presentation/bloc/training_bloc.dart';
import 'armory/data/datasources/armory_local_dataresouces.dart';
import 'armory/presentation/bloc/armory_bloc.dart';
import 'armory/presentation/bloc/dropdown/dropdown_bloc.dart';
import 'authentication/presentation/bloc/login_bloc/auth_bloc.dart';
import 'authentication/presentation/bloc/login_bloc/auth_event.dart';
import 'authentication/presentation/bloc/login_bloc/auth_state.dart';
import 'authentication/presentation/pages/login_page.dart';
import 'core/theme/app_theme.dart';
import 'injection_container.dart' as di;
import 'user_dashboard/pages/main_app_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Logger.configure();
  setupLocator();
  await di.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _orientationLocked = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_orientationLocked) {
      _setOrientationBasedOnScreenSize(context);
      _orientationLocked = true;
    }
  }

  void _setOrientationBasedOnScreenSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final diagonalInches = sqrt(pow(size.width / pixelRatio, 2) + pow(size.height / pixelRatio, 2)) / 160;
    final isTablet = diagonalInches >= 3;

    if (isTablet) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => di.sl<AuthBloc>()..add(const CheckLoginStatus())),
        BlocProvider<SignupBloc>(create: (_) => di.sl<SignupBloc>()),

        BlocProvider<TrainingBloc>(create: (_) => di.sl<TrainingBloc>()),
        BlocProvider<ArmoryBloc>(create: (_) => di.sl<ArmoryBloc>()),
        BlocProvider<DropdownBloc>(create: (_) => di.sl<DropdownBloc>()),
      ],
      child: MaterialApp(
        onGenerateRoute: AppPages.onGenerateRoute,
        title: 'PA Screens',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme(),
        home: const AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading || state is AuthInitial) {
          return Scaffold(
            backgroundColor: AppTheme.background(context),
            body: Center(child: CircularProgressIndicator(color: AppTheme.primary(context))),
          );
        } else if (state is AuthAuthenticated) {
          return DataSyncWrapper(userId: state.user.uid);
        } else {
          return const LoginPage();
        }
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

  // lib/main.dart - MODIFY _initializeData
  Future<void> _initializeData() async {
    try {
      final localDataSource = di.sl<ArmoryLocalDataSource>();
      final isEmpty = await localDataSource.isDatabaseEmpty();

      if (isEmpty) {
        log.i('🔄 Fetching system data...');
        final syncUseCase = di.sl<InitialDataSyncUseCase>();
        final result = await syncUseCase(UserIdParams(userId: widget.userId));

        result.fold(
              (failure) {
            log.e('❌ Sync failed: $failure');
            if (mounted) setState(() => _syncCompleted = false);
          },
              (_) {
            log.i('✅ System data synced');
            if (mounted) setState(() => _syncCompleted = true);
          },
        );
      } else {
        final hasUserData = await localDataSource.hasUserData(widget.userId);

        if (!hasUserData) {
          log.i('🔄 Fetching user data for: ${widget.userId}');
          final syncUseCase = di.sl<InitialDataSyncUseCase>();
          final result = await syncUseCase(UserIdParams(userId: widget.userId));

          result.fold(
                (failure) {
              log.e('❌ User sync failed: $failure');
              if (mounted) setState(() => _syncCompleted = false);
            },
                (_) {
              log.i('✅ User data synced');
              if (mounted) setState(() => _syncCompleted = true);
            },
          );
        } else {
          log.i('✅ Data ready');
          if (mounted) setState(() => _syncCompleted = true);
        }
      }
    } catch (e) {
      log.e('❌ Init error: $e');
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