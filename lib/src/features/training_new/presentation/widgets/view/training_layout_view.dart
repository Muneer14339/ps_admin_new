import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/features/training_new/presentation/widgets/components/drill_list.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../core/enum/session_enum.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/locatore.dart';
import '../../../../../core/routes/routes_services.dart';
import '../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../core/services/locator/locator.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../test_stream/session_start_view_test.dart';
import '../../../../train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import '../../../../train/connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart';
import '../../../../train/connectivity/presentation/view/bluetooth_view.dart';
import '../../../../train/connectivity/presentation/view/wifi_list_view.dart';
import '../../../../train/session/data/model/session_model.dart';
import '../../../../train/session/presentation/bloc/session_bloc/session_bloc.dart';
import '../../../../train/session/presentation/view/session_start_view_updated.dart';
import '../../../../train/stage/data/local/service/stage_db_helper.dart';
import '../../../../train/stage/data/model/stage_entity.dart';
import '../../../../train/stage/features/drill/data/model/drills_entity.dart';
import '../../../../train/stage/presentation/stage_bloc/stage_bloc.dart';
import '../../../../train/train_view.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_event.dart';
import '../../bloc/training_state.dart';

TrainingBloc blocTr = locator<TrainingBloc>();
SessionPage pageSes = SessionPage.setup;

class TrainingLayoutView extends StatefulWidget {
  static const routeName = '/training-layout';

  const TrainingLayoutView({super.key});

  @override
  State<TrainingLayoutView> createState() => _TrainingLayoutViewState();
}

class _TrainingLayoutViewState extends State<TrainingLayoutView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appBleDeviceBloc.add(const GetConnectedDevice());
    cameraWiBloc.add(const GetConnectedSSID());
    pageSes = SessionPage.setup;
  }
@override
  void didUpdateWidget(covariant TrainingLayoutView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    pageSes = SessionPage.setup;
  }
  @override
  void initState() {
    super.initState();
    pageSes = SessionPage.setup;
    cameraWiBloc.add(const GetConnectedSSID());
    appBleDeviceBloc.add(const GetConnectedDevice());

    getStageData();
    _requestPermission();
    context.read<TrainingBloc>().add(SelectDrillEvent(DrillsModel(drill: initailDrill)));

    blocTr = locator<TrainingBloc>();

    const lightSystemIconsStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(lightSystemIconsStyle);
  }

  Future<void> _requestPermission() async {
    // Use scoped storage permissions for Android 13+
    if (await Permission.photos.request().isGranted ||
        await Permission.videos.request().isGranted) {
    } else {
      await Permission.photos.request();
      await Permission.videos.request();
      // if (mounted) {
      //   showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //       title: const Text('Permission Denied'),
      //       content:
      //           const Text('Please grant storage permission to use this app.'),
      //       actions: [
      //         TextButton(
      //           onPressed: () => Navigator.pop(context),
      //           child: const Text('OK'),
      //         ),
      //       ],
      //     ),
      //   );
      // }
    }
  }

  void getStageData() async {
    StageEntity stageEntity = await StageDbHelper()
        .getStageForUser(locator<LocalStorageService>().userIdString);
    if (mounted) {
      context.read<StageBloc>().add(StageUpdateEvent(stageEntity: stageEntity));
    }
  }

  Future<void> _handleNavigation(
      SessionPage page, String route, bool? isDisabled) async {
    // if (route == AppRoutes.activeView) {
    //   // showSetupRequiredDialog(context);
    //   bool wifiConnected = cameraWiBloc.lastConnectedSsid != null &&
    //       cameraWiBloc.lastConnectedSsid != '';
    //   bool bluetoothConnected = appBleDeviceBloc.deviceConn?.remoteId != null;
    //   if (bluetoothConnected && wifiConnected) {
    //     BotToast.showLoading();
    //     StageEntity stageEntity = await StageDbHelper()
    //         .getStageForUser(locator<LocalStorageService>().userIdString);
    //     print("stageEntity_distance =====3");
    //
    //     BotToast.closeAllLoading();
    //     if (context.mounted) {
    //       print("stageEntity_distance =====2");
    //
    //       context.read<SessionBloc>().add(ShootEvent(
    //             sessionModel: SessionModel(
    //                 missingShots: 0,
    //                 listShots: null,
    //                 shootModel: null,
    //                 totalTime: null,
    //                 sessionCountDown: null,
    //                 isSessionStart: false,
    //                 isSessionPaused: false,
    //                 playedShoots: 0,
    //                 totalScores: 0,
    //                 sessionId: sessionIdFun(),
    //                 stageEntity: stageEntity),
    //           ));
    //       print("stageEntity_distance =====1");
    //
    //       // int des = int.parse(stageEntity.distance??"1");
    //       final des = int.tryParse(
    //               (stageEntity.distance ?? '1 meter').split(' ').first) ??
    //           1;
    //       dis_glob = null;
    //       dis_glob = des;
    //       print("stageEntity_distance $des");
    //       Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => SessionStartViewUpdated(
    //                     distance: des,
    //                     withCable: false,
    //                   ))).then((v) {
    //         // if (context.mounted) {
    //         //   final state =
    //         //       BlocProvider.of<AppBleDeviceBloc>(context)
    //         //           .state;
    //         //   if ((state is! Connected) ||
    //         //       state is! ServicesDiscovered) {
    //         appBleDeviceBloc.add(const GetConnectedDevice());
    //         //   }
    //         // }
    //       });
    //     }
    //   } else {
    //     toast('Connect both wifi and bluetooth to continue');
    //   }
    // }
    if (isDisabled==null || !isDisabled) return;

    // Use the stored bloc reference instead of context.read
    blocTr.add(NavigateToEvent(page, route));

    // blocTr!.add(NavigateToEvent(SessionPage.preview, AppRoutes.previewView));
    // locator<RoutesService>().navigateTo(route);

    pageSes = page;
    // // pageSes using the local navigator key
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted &&
          locator<RoutesService>().navigatorKey.currentState?.mounted == true) {
        locator<RoutesService>().navigateTo(route);
      }
    });
    setState(() {});
  }

  Widget _buildSideBar(TrainingState state) {
    return Container(
      width: 0.35.sw,
      color: AppTheme.background(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: _buildSectionsList(state),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionsList(TrainingState state) {
    final sections = _getSections();

    return ListView(
      shrinkWrap: true,
      children: sections.map((sec) {
        final page = sec['page'] as SessionPage;
        final icon = sec['icon'] as IconData;
        final title = sec['title'] as String;
        final route = sec['route'] as String;

        // final isCompleted = state.isStepCompleted(page);
        final isDisabled =  ((cameraWiBloc.lastConnectedSsid != null &&
                    cameraWiBloc.lastConnectedSsid != '') ||
                (cameraWiBloc.withWire != null &&
                    cameraWiBloc.withWire == true)) &&
            appBleDeviceBloc.deviceConn?.remoteId != null ;
            // && (state.isLoadoutSelected);

        final isActive = pageSes == page;

        return _SidebarTile(
          title: title,
          icon: icon,
          isActive: isActive,
          isCompleted: SessionPage.setup == page,
          isDisabled: isDisabled,
          // onTap: () => _handleNavigation(page, route, isDisabled),
          onTap:
          // route == AppRoutes.activeView
              // ? () async {
              //     print("stageEntity_distance =====3");
              //     if (cameraWiBloc.withWire != null &&
              //         cameraWiBloc.withWire == true) {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (_) => UsbCameraPage()));
              //     } else {
              //       // showSetupRequiredDialog(context);
              //       bool wifiConnected =
              //           cameraWiBloc.lastConnectedSsid != null &&
              //               cameraWiBloc.lastConnectedSsid != '';
              //       bool bluetoothConnected =
              //           appBleDeviceBloc.deviceConn?.remoteId != null;
              //       if (bluetoothConnected && wifiConnected) {
              //         BotToast.showLoading();
              //         StageEntity stageEntity = await StageDbHelper()
              //             .getStageForUser(
              //                 locator<LocalStorageService>().userIdString);
              //         print("stageEntity_distance =====3");
              //
              //         BotToast.closeAllLoading();
              //         if (context.mounted) {
              //           print("stageEntity_distance =====2");
              //
              //           context.read<SessionBloc>().add(ShootEvent(
              //                 sessionModel: SessionModel(
              //                     missingShots: 0,
              //                     listShots: null,
              //                     shootModel: null,
              //                     totalTime: null,
              //                     sessionCountDown: null,
              //                     isSessionStart: false,
              //                     isSessionPaused: false,
              //                     playedShoots: 0,
              //                     totalScores: 0,
              //                     sessionId: sessionIdFun(),
              //                     stageEntity: stageEntity),
              //               ));
              //           print("stageEntity_distance =====1");
              //
              //           // int des = int.parse(stageEntity.distance??"1");
              //           final des = int.tryParse(
              //                   (stageEntity.distance ?? '1 meter')
              //                       .split(' ')
              //                       .first) ??
              //               1;
              //           dis_glob = null;
              //           dis_glob = des;
              //           print("stageEntity_distance $des");
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => SessionStartViewUpdated(
              //                         distance: des,
              //                         withCable: false,
              //                       ))).then((v) {
              //             // if (context.mounted) {
              //             //   final state =
              //             //       BlocProvider.of<AppBleDeviceBloc>(context)
              //             //           .state;
              //             //   if ((state is! Connected) ||
              //             //       state is! ServicesDiscovered) {
              //             appBleDeviceBloc.add(const GetConnectedDevice());
              //             //   }
              //             // }
              //           });
              //         }
              //       } else {
              //         toast('Connect both wifi and bluetooth to continue');
              //       }
              //     }
              //   }
              // :
            () => _handleNavigation(page, route, isDisabled),
        );
      }).toList(),
    );
  }

  List<Map<String, dynamic>> _getSections() {
    return [
      {
        'title': 'Session Setup',
        'icon': Icons.settings,
        'page': SessionPage.setup,
        'route': AppRoutes.setupView,
      },
      {
        'title': 'Preview & Configure',
        'icon': Icons.list_alt,
        'page': SessionPage.preview,
        'route': AppRoutes.previewView,
      },
      // {
      //   'title': 'Start Session',
      //   'icon': Icons.play_arrow,
      //   'page': SessionPage.active,
      //   'route': AppRoutes.activeView,
      // },
      // {
      //   'title': 'Start Session\nwith wire',
      //   'icon': Icons.play_arrow,
      //   'page': SessionPage.active,
      //   'route': AppRoutes.activeViewWithWire,
      // },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: appBleDeviceBloc,
      child: BlocBuilder<AppBleDeviceBloc, AppBleDeviceState>(
        builder: (context, stateBle) {
          print("stateBle=== $stateBle");
          if(stateBle is DeviceIsDisconnected){
            final isConnected =  ((cameraWiBloc.lastConnectedSsid != null &&
                cameraWiBloc.lastConnectedSsid != '') ||
                (cameraWiBloc.withWire != null &&
                    cameraWiBloc.withWire == true)) &&
                appBleDeviceBloc.deviceConn?.remoteId != null;
            if(isConnected==false){
              final page =  SessionPage.setup;
            final route = AppRoutes.setupView;
              pageSes = SessionPage.setup;
              // blocTr.add(NavigateToEvent(page, route));
              locator<RoutesService>().navigateTo(route);
            }

          }

          // appBleDeviceBloc.deviceConn?.remoteId != null;

          return BlocProvider.value(
            value: cameraWiBloc,
            child: BlocBuilder<CameraWifiBloc, CameraWifiState>(
              builder: (context, stateCam) {
                if(stateCam is DisConnectedCam){
                  final isConnected =  ((cameraWiBloc.lastConnectedSsid != null &&
                      cameraWiBloc.lastConnectedSsid != '') ||
                      (cameraWiBloc.withWire != null &&
                          cameraWiBloc.withWire == true)) &&
                      appBleDeviceBloc.deviceConn?.remoteId != null;
                  if(isConnected==false){
                    final page =  SessionPage.setup;
                    final route = AppRoutes.setupView;
                    pageSes = SessionPage.setup;
                    // blocTr.add(NavigateToEvent(page, route));
                    locator<RoutesService>().navigateTo(route);
                  }

                }
                // cameraWiBloc.lastConnectedSsid != null &&
                //     cameraWiBloc.lastConnectedSsid != '';
                // appBleDeviceBloc.deviceConn?.remoteId != null;
                // final isConnected =  ((cameraWiBloc.lastConnectedSsid != null &&
                //     cameraWiBloc.lastConnectedSsid != '') ||
                //     (cameraWiBloc.withWire != null &&
                //         cameraWiBloc.withWire == true)) &&
                //     appBleDeviceBloc.deviceConn?.remoteId != null;
                // if(isConnected==false){
                //   final page =  SessionPage.setup;
                // final route = AppRoutes.setupView;
                //   pageSes = SessionPage.setup;
                //   // blocTr.add(NavigateToEvent(page, route));
                //   locator<RoutesService>().navigateTo(route);
                // }
                return BlocBuilder<TrainingBloc, TrainingState>(
                  builder: (context, state) {
                    // context.read<TrainingBloc>().add(ToggleWifiConnectionEvent(device));

                    return Scaffold(
                      backgroundColor: AppTheme.background(context),
                      body: Row(
                        children: [
                          _buildSideBar(state),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.background(context),
                                border: Border(
                                  left: BorderSide(
                                    color: AppTheme.primary(context)
                                        .withOpacity(0.2),
                                  ),
                                ),
                              ),
                              child: Navigator(
                                key: locator<RoutesService>().navigatorKey,
                                initialRoute: AppRoutes.setupView,
                                clipBehavior: Clip.none,
                                onGenerateRoute: AppPages.onGenerateRoute,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _SidebarTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;

  final bool isCompleted;
  final bool isDisabled;
  final VoidCallback? onTap;

   const _SidebarTile({
    required this.title,
    required this.icon,
    required this.isActive,
    required this.isCompleted,
     required this.isDisabled,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    print("isDisabled====$isDisabled");
    print("isActive====$isActive");
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive
              ? AppTheme.primary(context).withOpacity(0.2)
              : AppTheme.background(context),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive
                ? AppTheme.primary(context).withOpacity(0.2)
                : AppTheme.background(context),
          ),
          boxShadow: [
            if (isActive)
              const BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          onTap: onTap,
          leading: Icon(icon, color: AppTheme.textPrimary(context)),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary(context),
              fontSize: 14.sp,
            ),
          ),
          trailing: isCompleted==true?null:(!isDisabled
              ? const Icon(Icons.lock_outline, color: Colors.grey)
              : Icon(Icons.check_circle, color: AppTheme.primary(context))),
        ),
      ),
    );
  }
}
