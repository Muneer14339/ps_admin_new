import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/enum/session_enum.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/locatore.dart';
import '../../../../../core/routes/routes_services.dart';
import '../../../../../core/services/locator/locator.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import '../../../../train/connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart';
import '../../../../train/connectivity/presentation/view/bluetooth_view.dart';
import '../../../../train/connectivity/presentation/view/wifi_list_view.dart';
import '../../../../train/stage/features/aimsync/presentation/view/aimsync.dart';
import '../../../../train/stage/features/drill/presentation/view/select_drill_view.dart';
import '../../../../train/stage/presentation/stage_bloc/stage_bloc.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_event.dart';
import '../../bloc/training_state.dart';

class SessionSetupView extends StatefulWidget {
  static const routeName = '/session-setup';

  const SessionSetupView({super.key});

  @override
  State<SessionSetupView> createState() => _SessionSetupViewState();
}

class _SessionSetupViewState extends State<SessionSetupView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appBleDeviceBloc.add(const GetConnectedDevice());
    cameraWiBloc.add(const GetConnectedSSID());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        return _SessionSetupContent(state: state);
      },
    );
  }
}

class _SessionSetupContent extends StatefulWidget {
  final TrainingState state;

  const _SessionSetupContent({required this.state});

  @override
  State<_SessionSetupContent> createState() => _SessionSetupContentState();
}

class _SessionSetupContentState extends State<_SessionSetupContent> {
  @override
  Widget build(BuildContext context) {
    final List<_SetupItem> items = [
      _SetupItem(
        icon: Icons.language_outlined,
        title: 'Connection',
        subtitle: cameraWiBloc.lastConnectedSsid != null &&
                cameraWiBloc.lastConnectedSsid != '' &&
                appBleDeviceBloc.deviceConn?.remoteId != null
            ? 'Wi-Fi and Bluetooth connected'
            : 'Set up Wi-Fi and Bluetooth connections',
        validated: cameraWiBloc.lastConnectedSsid != null &&
            cameraWiBloc.lastConnectedSsid != '' &&
            appBleDeviceBloc.deviceConn?.remoteId != null,
        onTap: () {
          locator<RoutesService>().navigateTo(AppRoutes.chooseWifiBle);
        },
      ),
      _SetupItem(
        icon: Icons.settings_input_component_rounded,
        title: 'Loadout Setup',
        subtitle: widget.state.isLoadoutSelected
            ? widget.state.selectedLoadout?.name ?? 'Loadout selected'
            : 'Choose a loadout for your training session.',
        validated: widget.state.isLoadoutSelected,
        onTap: () {
          locator<RoutesService>().navigateTo(AppRoutes.loadoutList);
        },
      ),
      // _SetupItem(
      //   icon: Icons.notifications_active_outlined,
      //   title: 'AimSync Sensitivity',
      //   subtitle: 'Set up your AimSync Sensitivity values',
      //   validated: true, // Always accessible
      //   onTap: () {
      //     if ( appBleDeviceBloc.deviceConn?.remoteId != null) {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (_) =>
      //                   AimsyncPage(stageEntity: initialStageEntity)));
      //     } else {
      //       toast('BLE device is not connected');
      //     }        },
      // ),
      _SetupItem(
        icon: Icons.fitness_center_outlined,
        title: 'Drill Selection',
        subtitle: widget.state.isDrillSelected
            ? widget.state.selectedDrill?.drill?.name ?? 'Drill selected'
            : 'Choose a training drill to begin.',
        validated: false,
        onTap: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SelectDrillView(stageEntity: initialStageEntity)))
              .then((value) {
            // context
            //     .read<StageBloc>()
            //     .add(StageUpdateEvent(stageEntity: initialStageEntity));
          });
          // locator<RoutesService>().navigateTo(AppRoutes.drillList);
        },
      ),
    ];

    return Scaffold(
        backgroundColor: AppTheme.background(context),
        body: BlocProvider.value(
            value: appBleDeviceBloc,
            child: BlocBuilder<AppBleDeviceBloc, AppBleDeviceState>(
                builder: (context, stateBle) {
              print("stateBle=== $stateBle");
              appBleDeviceBloc.deviceConn?.remoteId != null;
              return BlocProvider.value(
                  value: cameraWiBloc,
                  child: BlocBuilder<CameraWifiBloc, CameraWifiState>(
                      builder: (context, stateCam) {
                       bool isConnected =  ((cameraWiBloc.lastConnectedSsid != null &&
                            cameraWiBloc.lastConnectedSsid != '') ||
                            (cameraWiBloc.withWire != null &&
                                cameraWiBloc.withWire == true)) &&
                            appBleDeviceBloc.deviceConn?.remoteId != null;
                        return ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(20),
                      children: [
                        SizedBox(height: 10,),
                        _setupCard(_SetupItem(
                          icon: Icons.language_outlined,
                          title: 'Connection',
                          subtitle: isConnected
                              ? 'Wi-Fi and Bluetooth connected'
                              : 'Set up Wi-Fi and Bluetooth connections',
                          validated: isConnected,
                          onTap: () {
                            locator<RoutesService>()
                                .navigateTo(AppRoutes.chooseWifiBle);
                          },
                        )),
                        _setupCard(
                          _SetupItem(
                            icon: Icons.settings_input_component_rounded,
                            title: 'Loadout Setup',
                            subtitle: widget.state.isLoadoutSelected
                                ? widget.state.selectedLoadout?.name ??
                                    'Loadout selected'
                                : 'Choose a loadout for your training session.',
                            validated: widget.state.isLoadoutSelected,
                            onTap: () {
                              locator<RoutesService>()
                                  .navigateTo(AppRoutes.loadoutList);
                            },
                          ),
                        ),
                        // _SetupItem(
                        //   icon: Icons.notifications_active_outlined,
                        //   title: 'AimSync Sensitivity',
                        //   subtitle: 'Set up your AimSync Sensitivity values',
                        //   validated: true, // Always accessible
                        //   onTap: () {
                        //     if ( appBleDeviceBloc.deviceConn?.remoteId != null) {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (_) =>
                        //                   AimsyncPage(stageEntity: initialStageEntity)));
                        //     } else {
                        //       toast('BLE device is not connected');
                        //     }        },
                        // ),
                        _setupCard(
                          _SetupItem(
                            icon: Icons.fitness_center_outlined,
                            title: 'Drill Selection',
                            subtitle: widget.state.isDrillSelected
                                ? widget.state.selectedDrill?.drill?.name ??
                                    'Drill selected'
                                : 'Choose a training drill to begin.',
                            validated: false,
                            onTap: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SelectDrillView(
                                              stageEntity: initialStageEntity)))
                                  .then((value) {
                                // context
                                //     .read<StageBloc>()
                                //     .add(StageUpdateEvent(stageEntity: initialStageEntity));
                              });
                              // locator<RoutesService>().navigateTo(AppRoutes.drillList);
                            },
                          ),
                        )
                      ],
                    );
                  }));
            })));
  }

  /// 🟩 Each item card
  Widget _setupCard(_SetupItem item) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.h),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: item.validated
              ? AppTheme.primary(context).withOpacity(0.2)
              : AppTheme.background(context),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppTheme.primary(context).withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.primary(context).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child:
                  Icon(item.icon, color: AppTheme.primary(context), size: 26),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary(context),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    item.subtitle,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: AppTheme.textSecondary(context)),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            Icon(
              item.validated ? Icons.check_circle : Icons.chevron_right_rounded,
              color: item.validated ? AppTheme.primary(context) : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

/// Internal model for setup list item
class _SetupItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool validated;
  final VoidCallback onTap;

  _SetupItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.validated,
    required this.onTap,
  });
}
