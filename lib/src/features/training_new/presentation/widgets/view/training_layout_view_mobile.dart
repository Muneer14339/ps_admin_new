// lib/src/features/training_new/presentation/widgets/view/training_layout_view_mobile.dart (REPLACE FILE)
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../core/enum/session_enum.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/routes_services.dart';
import '../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../core/services/locator/locator.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import '../../../../train/connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart';
import '../../../../train/connectivity/presentation/view/bluetooth_view.dart';
import '../../../../train/connectivity/presentation/view/wifi_list_view.dart';
import '../../../../train/stage/data/local/service/stage_db_helper.dart';
import '../../../../train/stage/data/model/stage_entity.dart';
import '../../../../train/stage/features/drill/data/model/drills_entity.dart';
import '../../../../train/stage/presentation/stage_bloc/stage_bloc.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_event.dart';
import '../../bloc/training_state.dart';

TrainingBloc blocTrMobile = locator<TrainingBloc>();

class TrainingLayoutViewMobile extends StatefulWidget {
  static const routeName = '/training-layout-mobile';
  const TrainingLayoutViewMobile({super.key});

  @override
  State<TrainingLayoutViewMobile> createState() => _TrainingLayoutViewMobileState();
}

class _TrainingLayoutViewMobileState extends State<TrainingLayoutViewMobile> {

  @override
  void initState() {
    super.initState();
    cameraWiBloc.add(const GetConnectedSSID());
    appBleDeviceBloc.add(const GetConnectedDevice());
    getStageData();
    _requestPermission();
    context.read<TrainingBloc>().add(SelectDrillEvent(DrillsModel(drill: initailDrill)));
    blocTrMobile = locator<TrainingBloc>();

    const lightSystemIconsStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(lightSystemIconsStyle);
  }

  Future<void> _requestPermission() async {
    if (await Permission.photos.request().isGranted ||
        await Permission.videos.request().isGranted) {
    } else {
      await Permission.photos.request();
      await Permission.videos.request();
    }
  }

  void getStageData() async {
    StageEntity stageEntity = await StageDbHelper()
        .getStageForUser(locator<LocalStorageService>().userIdString);
    if (mounted) {
      context.read<StageBloc>().add(StageUpdateEvent(stageEntity: stageEntity));
    }
  }

  void _navigateToSection(String title, String route, SessionPage page) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: appBleDeviceBloc,
      child: BlocBuilder<AppBleDeviceBloc, AppBleDeviceState>(
        builder: (context, stateBle) {
          return BlocProvider.value(
            value: cameraWiBloc,
            child: BlocBuilder<CameraWifiBloc, CameraWifiState>(
              builder: (context, stateCam) {
                final isConnected = ((cameraWiBloc.lastConnectedSsid != null &&
                    cameraWiBloc.lastConnectedSsid != '') ||
                    (cameraWiBloc.withWire != null && cameraWiBloc.withWire == true)) &&
                    appBleDeviceBloc.deviceConn?.remoteId != null;

                return Scaffold(
                  backgroundColor: AppTheme.background(context),
                  body: Navigator(
                    key: locator<RoutesService>().navigatorKey,
                    onGenerateRoute: (settings) {
                      print("Names*************");
                      print(settings.name);
                      if (settings.name == '/') {
                        return MaterialPageRoute(
                          builder: (_) => BlocBuilder<AppBleDeviceBloc, AppBleDeviceState>(
                            bloc: appBleDeviceBloc,
                            builder: (ctx, bleState) {
                              return BlocBuilder<CameraWifiBloc, CameraWifiState>(
                                bloc: cameraWiBloc,
                                builder: (ctx, wifiState) {
                                  final isConnected = ((cameraWiBloc.lastConnectedSsid != null &&
                                      cameraWiBloc.lastConnectedSsid != '') ||
                                      (cameraWiBloc.withWire != null && cameraWiBloc.withWire == true)) &&
                                      appBleDeviceBloc.deviceConn?.remoteId != null;

                                  return SafeArea(
                                    child: Padding(
                                      padding: AppTheme.paddingLarge,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          SizedBox(height: 20.h),
                                          _buildSectionButton(
                                            title: 'Session Setup',
                                            icon: Icons.settings,
                                            isEnabled: true,
                                            onTap: () => locator<RoutesService>().navigateTo(AppRoutes.setupView),
                                          ),
                                          SizedBox(height: 16.h),
                                          _buildSectionButton(
                                            title: 'Preview & Configure',
                                            icon: Icons.list_alt,
                                            isEnabled: isConnected,
                                            onTap: isConnected
                                                ? () => locator<RoutesService>().navigateTo(AppRoutes.previewView)
                                                : null,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      }
                      return AppPages.onGenerateRoute(settings);
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionButton({
    required String title,
    required IconData icon,
    required bool isEnabled,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppTheme.surface(context),
            borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
            border: Border.all(
              color: isEnabled
                  ? AppTheme.primary(context).withOpacity(0.3)
                  : AppTheme.border(context),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: isEnabled
                      ? AppTheme.primary(context).withOpacity(0.1)
                      : Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                ),
                child: Icon(
                  icon,
                  color: isEnabled ? AppTheme.primary(context) : Colors.grey,
                  size: 28.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  title,
                  style: AppTheme.titleLarge(context).copyWith(
                    color: isEnabled ? AppTheme.textPrimary(context) : Colors.grey,
                  ),
                ),
              ),
              if (!isEnabled)
                Icon(Icons.lock_outline, color: Colors.grey, size: 24.sp)
              else
                Icon(Icons.arrow_forward_ios,
                    color: AppTheme.textSecondary(context), size: 20.sp),
            ],
          ),
        ),
      ),
    );
  }
}

