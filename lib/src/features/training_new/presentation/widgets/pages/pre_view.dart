import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/widgets/custom_textfield.dart';
import '../../../../../core/app config/device_config.dart';
import '../../../../../core/enum/session_enum.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/routes_services.dart';
import '../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../core/services/locator/locator.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/dropdown_custom.dart';
import '../../../../../core/widgets/modified_container.dart';
import '../../../../armory/domain/entities/dropdown_option.dart';
import '../../../../armory/presentation/widgets/common/dialog_widgets.dart';
import '../../../../test_stream/session_start_view_test.dart';
import '../../../../train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import '../../../../train/connectivity/presentation/view/bluetooth_view.dart';
import '../../../../train/connectivity/presentation/view/wifi_list_view.dart';
import '../../../../train/session/data/model/session_model.dart';
import '../../../../train/session/presentation/bloc/session_bloc/session_bloc.dart';
import '../../../../train/session/presentation/view/session_start_view_updated.dart';
import '../../../../train/stage/data/local/service/stage_db_helper.dart';
import '../../../../train/stage/data/model/stage_entity.dart';
import '../../../../train/stage/features/aimsync/presentation/view/aimsync.dart';
import '../../../../train/train_view.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_event.dart';
import '../../bloc/training_state.dart';
import '../components/choose_wifi_ble.dart';
import '../components/loadout_list.dart';
import '../components/range_dialog.dart';

class SessionPreviewView extends StatelessWidget {
  static const routeName = '/session-preview';

  const SessionPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // You can dispatch a complete step event here if needed
      // context.read<TrainingBloc>().add(CompleteStepEvent(SessionPage.setup));
    });

    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        return _SessionPreviewContent(state: state);
      },
    );
  }
}

class _SessionPreviewContent extends StatelessWidget {
  final TrainingState state;

  const _SessionPreviewContent({required this.state});

  @override
  Widget build(BuildContext context) {
    final twoCols = 1.sw >= 680; // 1.sw = current screen width in logical px

    final bloc = context.read<TrainingBloc>();
    final s = state.session;
    final isConnected = ((cameraWiBloc.lastConnectedSsid != null &&
                cameraWiBloc.lastConnectedSsid != '') ||
            (cameraWiBloc.withWire != null && cameraWiBloc.withWire == true)) &&
        appBleDeviceBloc.deviceConn?.remoteId != null;
    final cadence = <int>[
      2,3,4,5,6,7
    ];   final ranges = <String>[
      'Oak Ridge Range',
      'Precision Shooting Center',
      'Metro Gun Club',
      'Blue Mountain Range',
    ];
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (DeviceConfig.isMobile(context))
              BackButtonWithTitle(title: 'Preview & Configure'),
            const SizedBox(height: 10),
            Text(
              "Review your setup and adjust details before starting your session.",
              style: TextStyle(
                  color: AppTheme.textSecondary(context), fontSize: 16),
            ),
            SizedBox(height: 24.h),
            Container(
              decoration: AppDecorations.containerBoxNew(context: context),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Session Details",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppTheme.primary(context)),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: "Session Name",
                    hint: 'Morning Practice',
                    controller: bloc.titleCtrl,
                    onChanged: (v) {
                      // Update session name through BLoC
                      // final updatedSession = s.copyWith(sessionName: v);
                      // context.read<TrainingBloc>().add(UpdateSessionEvent(updatedSession));
                    },
                  ),
                  const SizedBox(height: 16),
              RangeDropdown(
                ranges: ranges,
                selected: state.session.rangeName,
                isLoading: false, // or false if not applicable
                onChanged: (selected) {
                  context.read<TrainingBloc>().add(SelectRangeEvent(selected));
                },
              ),

                  // CustomSelectableField(
                  //   label: "Range Name",
                  //   value: state.session.rangeName??"Select Range",
                  //   onTap: () => _showRangeDialog(context),
                  // ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: "Session Notes",
                    hint: 'Session notes',

                    controller: bloc.notesCtrl,
                    onChanged: (v) {
                      // Update session notes through BLoC
                      // final updatedSession = s.copyWith(notes: v);
                      // context.read<TrainingBloc>().add(UpdateSessionEvent(updatedSession));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            SelectCandence(selectedIndexCad: state.session.isCadOrRegular??0,),
            SizedBox(height: 15.h),

           if(state.session.isCadOrRegular!=null && state.session.isCadOrRegular==1)CadenceDropdown(
              values: cadence,
              selected: state.session.cadenceValues,
              isLoading: false, // or false if not applicable
              onChanged: (selected) {
                context.read<TrainingBloc>().add(SelectCadenceValuesEvent(selected));
              },
            ),
            SizedBox(height: 30.h),

            AudioAlertsSelector(),
            SizedBox(height: 40.h),

            // Container(
            //   decoration: AppDecorations.containerBox(context: context),
            //   padding: const EdgeInsets.all(20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Configuration Summary",
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 18,
            //             color: AppTheme.primary(context)),
            //       ),
            //       const SizedBox(height: 16),
            //
            //       _previewRow(
            //         context: context,
            //         label: "Connection",
            //         value: isConnected ? "Connected" : "Not Connected",
            //       ),
            //       _previewRow(
            //         context: context,
            //         label: "Loadout",
            //         value: state.selectedLoadout?.name ?? "Not selected",
            //         onTap: () {
            //           locator<RoutesService>()
            //               .navigateTo(AppRoutes.loadoutList);
            //         },
            //       ),
            //       _previewRow(
            //         context: context,
            //         label: "Drill",
            //         value: state.selectedDrill?.name ?? "None",
            //         onTap: () {
            //           locator<RoutesService>().navigateTo(AppRoutes.drillList);
            //         },
            //       ),
            //       // _previewRow(
            //       //   context: context,
            //       //   label: "Range",
            //       //   value: "Not selected",
            //       //   onTap: () => _showRangeDialog(context),
            //       // ),
            //       // _previewRow(
            //       //   context: context,
            //       //   label: "Alerts",
            //       //   value: "Configure", // You can add alert state here
            //       //   onTap: () {
            //       //     locator<RoutesService>().navigateTo(AppRoutes.userAlert);
            //       //   },
            //       // ),
            //     ],
            //   ),
            // ),
            SectionCard(
              title: 'Loadout Summary',
              twoColumns: twoCols,
              children: [
                InfoTile(
                  label: 'FIREARM',
                  value: armoryFirearmA?.nickname ?? "None",
                  caption: armoryFirearmA?.caliber ?? "None",
                  onTap: () {
                              locator<RoutesService>()
                                  .navigateTo(AppRoutes.loadoutList);

                  },
                ),
                InfoTile(
                  label: 'AMMUNITION',
                  value: armoryAmmunitionA?.caliber ?? "None",
                  caption: armoryAmmunitionA?.brand ?? "None",
                  onTap: () {
                              locator<RoutesService>()
                                  .navigateTo(AppRoutes.loadoutList);
                  },
                ),
              ],
            ),
            SizedBox(height: 16.h),
            SectionCard(
              title: 'Drill Configuration',
              twoColumns: twoCols,
              children: [
                InfoTile(
                  label: 'DRILL NAME',
                  value: state.selectedDrill?.drill?.name ?? 'None',
                  caption: 'System Drill',
                  onTap: () {
                    locator<RoutesService>().navigateTo(AppRoutes.drillList);

                  },
                ),
                InfoTile(
                  label: 'PARAMETERS',
                  value: '7 yards',
                  caption: state.selectedDrill?.drill?.description ?? 'None',
                  onTap: () {
                    locator<RoutesService>().navigateTo(AppRoutes.drillList);

                  },
                ),
              ],
            ),
            SizedBox(height: 40.h),

            // 🟦 START BUTTON
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.play_arrow_rounded, size: 20),
                label: const Text(
                  "Start Session",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary(context),
                  foregroundColor: AppTheme.textPrimary(context),
                  padding:  EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 12.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => _startSession(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _previewRow({
    required String label,
    required String value,
    VoidCallback? onTap,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textSecondary(context)),
            ),
            Row(
              children: [
                Text(
                  value,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary(context)),
                ),
                if (onTap != null)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.orange),
                    ),
                    child:
                        const Icon(Icons.edit, size: 24, color: Colors.orange),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showRangeDialog(BuildContext context) async {
    final selectedRange = await showDialog<String>(
      context: context,
      useRootNavigator: true, // important with nested Navigators
      barrierDismissible: true,
      builder: (ctx) => RangeDialog(
        initiallySelected:
            context.read<TrainingBloc>().state.session?.rangeName,
      ),
    );

    if (!context.mounted) return;

    if (selectedRange != null) {
      context.read<TrainingBloc>().add(SelectRangeEvent(selectedRange));
      // Optional feedback
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Range: $selectedRange')));
    }
  }

  Future<void> _startSession(BuildContext context) async {

    print("stageEntity_distance =====3");
    StageEntity stageEntity = await StageDbHelper()
        .getStageForUser(locator<LocalStorageService>().userIdString);
    if (cameraWiBloc.withWire != null && cameraWiBloc.withWire == true) {
      context.read<SessionBloc>().add(ShootEvent(
        sessionModel: SessionModel(
            missingShots: 0,
            listShots: null,
            shootModel: null,
            totalTime: null,
            sessionCountDown: null,
            isSessionStart: false,
            isSessionPaused: false,
            playedShoots: 0,
            totalScores: 0,
            cadenceValues: state.session.cadenceValues,
            isCadOrOpen: state.session.isCadOrRegular,
            sessionId: sessionIdFun(),
            sessionName: context.read<TrainingBloc>().titleCtrl.text,
            stageEntity: stageEntity.copyWith()),
      ));

      Navigator.of(context, rootNavigator: true)
          .push(
        MaterialPageRoute(
          builder: (_)  => UsbCameraPage(),
        ),
      );
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (_) => UsbCameraPage()));
    } else {
      // showSetupRequiredDialog(context);
      bool wifiConnected = cameraWiBloc.lastConnectedSsid != null &&
          cameraWiBloc.lastConnectedSsid != '';
      bool bluetoothConnected = appBleDeviceBloc.deviceConn?.remoteId != null;
      if (bluetoothConnected && wifiConnected) {
        BotToast.showLoading();

        print("stageEntity_distance =====3");

        BotToast.closeAllLoading();
        if (context.mounted) {
          print("stageEntity_distance =====2");

          context.read<SessionBloc>().add(ShootEvent(
                sessionModel: SessionModel(
                    missingShots: 0,
                    listShots: null,
                    shootModel: null,
                    totalTime: null,
                    sessionCountDown: null,
                    isSessionStart: false,
                    isSessionPaused: false,
                    playedShoots: 0,
                    totalScores: 0,
                    cadenceValues: state.session.cadenceValues,
                    isCadOrOpen: state.session.isCadOrRegular,
                    sessionId: sessionIdFun(),
                    sessionName: context.read<TrainingBloc>().titleCtrl.text,
                    stageEntity: stageEntity),
              ));

          print("stageEntity_distance =====1");

          // int des = int.parse(stageEntity.distance??"1");
          final des = int.tryParse((stageEntity.distance ?? '1 meter').split(' ').first) ??
              1;
          dis_glob = null;
          dis_glob = des;
          print("stageEntity_distance $des");
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => SessionStartViewUpdated(
          //               distance: des,
          //               withCable: false,
          //             ))).then((v) {
          //
          //   appBleDeviceBloc.add(const GetConnectedDevice());
          // });
          Navigator.of(context, rootNavigator: true)
              .push(
            MaterialPageRoute(
              builder: (_) => SessionStartViewUpdated(
                distance: des,
                withCable: false,
              ),
            ),
          )
              .then((_) => appBleDeviceBloc.add(const GetConnectedDevice()));
        }
      } else {
        toast('Connect both wifi and bluetooth to continue');
      }
    }
    // final bloc = context.read<TrainingBloc>();
    // final sessionName = bloc.titleCtrl.text;
    //
    // // Validation
    // if (sessionName.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Please fill in the session name and select a range.'),
    //       backgroundColor: Colors.red,
    //       behavior: SnackBarBehavior.floating,
    //     ),
    //   );
    //   return;
    // }
    //
    // // Update session with final values
    //
    // // bloc.add(UpdateSessionEvent(updatedSession));
    //
    // // Complete steps and start session
    // bloc.add(CompleteStepEvent(SessionPage.preview));
    // bloc.add(CompleteStepEvent(SessionPage.active));
    // bloc.add(StartSessionEvent());
    //
    // // Navigate to active session
    // bloc.add(NavigateToEvent(SessionPage.active, AppRoutes.activeView));
    //
    // // Show success message
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('Session Started - Good luck!'),
    //     backgroundColor: Colors.green,
    //     behavior: SnackBarBehavior.floating,
    //     duration: const Duration(seconds: 2),
    //   ),
    // );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool twoColumns;

  const SectionCard({
    super.key,
    required this.title,
    required this.children,
    this.twoColumns = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppTheme.background(context),

        borderRadius: BorderRadius.circular(12.r),
        // border: Border.all(color:  AppTheme.primary(context).withOpacity(0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 14.sp, color: AppTheme.textPrimary(context))),
          SizedBox(height: 12.h),
          Container(
            height: 1.h,
            color: AppTheme.primary(context).withOpacity(0.2),
          ),
          SizedBox(height: 16.h),
          _ResponsiveGrid(twoColumns: twoColumns, children: children),
        ],
      ),
    );
  }
}

class _ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final bool twoColumns;

  const _ResponsiveGrid({required this.children, required this.twoColumns});

  @override
  Widget build(BuildContext context) {
    if (!twoColumns) {
      return Column(
        children: [
          for (int i = 0; i < children.length; i++) ...[
            children[i],
            if (i != children.length - 1) SizedBox(height: 14.h),
          ]
        ],
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: children.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 100.h,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
      ),
      itemBuilder: (_, i) => children[i],
    );
  }
}

class InfoTile extends StatelessWidget {
  final String label;
  final String value;
  final String? caption;
  final VoidCallback onTap;

  const InfoTile({
    super.key,
    required this.label,
    required this.value,
    this.caption,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 1.h),
        decoration: BoxDecoration(
            color: AppTheme.background(context),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
                color: AppTheme.primary(context).withOpacity(0.2), width: 1),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primary(context).withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: TextStyle(
                  fontSize: 14.sp, color: AppTheme.textPrimary(context)),
            ),
            SizedBox(height: 6.h),
            Text(
              value,
              style:
                  TextStyle(fontSize: 16.sp, color: AppTheme.primary(context)),
            ),
            if (caption != null) ...[
              SizedBox(height: 4.h),
              Text(
                caption!,
                style: TextStyle(
                    fontSize: 12.sp, color: AppTheme.textPrimary(context)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
