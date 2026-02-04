import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/routes_services.dart';
import '../../../../../core/services/locator/locator.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../../../../../core/widgets/dropdown_custom.dart';
import '../../../../train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import '../../../../train/connectivity/presentation/view/bluetooth_view.dart';
import '../../../../train/connectivity/presentation/view/wifi_list_view.dart';
import '../../../../train/session/data/model/session_model.dart';
import '../../../../train/session/presentation/bloc/session_bloc/session_bloc.dart';
import '../../../../train/stage/data/local/service/stage_db_helper.dart';
import '../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../train/stage/data/model/stage_entity.dart';
import '../../../../train/stage/features/aimsync/presentation/view/aimsync.dart';
import '../../../../train/train_view.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_event.dart';
import '../../bloc/training_state.dart';
import '../components/choose_wifi_ble.dart';
import '../components/loadout_list.dart';
import '../components/range_dialog.dart';
import '../../../../train/session/presentation/view/session_start_view_updated.dart';
import '../../../../test_stream/session_start_view_test.dart';
import '../../../../../core/utils/utils.dart';

class SessionPreviewViewMobile extends StatelessWidget {
  const SessionPreviewViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        final bloc = context.read<TrainingBloc>();
        final cadence = <int>[2, 3, 4, 5, 6, 7];
        final ranges = <String>[
          'Oak Ridge Range',
          'Precision Shooting Center',
          'Metro Gun Club',
          'Blue Mountain Range',
        ];

        return Scaffold(
          backgroundColor: AppTheme.background(context),
          body: ListView(
            padding: EdgeInsets.all(20.w),
            children: [
              SizedBox(height: 10.h),
              const BackButtonWithTitle(title: 'Preview & Configure'),
              SizedBox(height: 10.h),
              Text(
                "Review your setup before starting",
                style: TextStyle(color: AppTheme.textSecondary(context), fontSize: 14.sp),
              ),
              SizedBox(height: 20.h),

              CustomTextField(
                label: "Session Name",
                hint: 'Morning Practice',
                controller: bloc.titleCtrl,
              ),
              SizedBox(height: 16.h),

              RangeDropdown(
                ranges: ranges,
                selected: state.session.rangeName,
                isLoading: false,
                onChanged: (selected) {
                  context.read<TrainingBloc>().add(SelectRangeEvent(selected));
                },
              ),
              SizedBox(height: 16.h),

              CustomTextField(
                label: "Session Notes",
                hint: 'Session notes',
                controller: bloc.notesCtrl,
              ),
              SizedBox(height: 24.h),

              SelectCandenceWrapper(selectedIndexCad: state.session.isCadOrRegular ?? 0),
              SizedBox(height: 16.h),

              if (state.session.isCadOrRegular == 1)
                CadenceDropdown(
                  values: cadence,
                  selected: state.session.cadenceValues,
                  isLoading: false,
                  onChanged: (selected) {
                    context.read<TrainingBloc>().add(SelectCadenceValuesEvent(selected));
                  },
                ),
              SizedBox(height: 16.h),

              AudioAlertsSelectorWrapper(),
              SizedBox(height: 24.h),

              _buildInfoCard(
                context,
                title: 'Loadout',
                items: [
                  _InfoItem(
                    label: 'Firearm',
                    value: armoryFirearmA?.nickname ?? "None",
                    subtitle: armoryFirearmA?.caliber ?? "",
                  ),
                  _InfoItem(
                    label: 'Ammunition',
                    value: armoryAmmunitionA?.caliber ?? "None",
                    subtitle: armoryAmmunitionA?.brand ?? "",
                  ),
                ],
                onTap: () => locator<RoutesService>().navigateTo(AppRoutes.loadoutList),
              ),
              SizedBox(height: 16.h),

              _buildInfoCard(
                context,
                title: 'Drill',
                items: [
                  _InfoItem(
                    label: 'Name',
                    value: state.selectedDrill?.drill?.name ?? 'None',
                    subtitle: state.selectedDrill?.drill?.description ?? '',
                  ),
                ],
                onTap: () => locator<RoutesService>().navigateTo(AppRoutes.drillList),
              ),
              SizedBox(height: 32.h),

              ElevatedButton.icon(
                icon: const Icon(Icons.play_arrow_rounded, size: 24),
                label: const Text("Start Session", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary(context),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => _startSession(context, state),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoCard(BuildContext context, {
    required String title,
    required List<_InfoItem> items,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppTheme.background(context),

          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppTheme.primary(context).withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppTheme.textPrimary(context))),
                Icon(Icons.edit, size: 20, color: AppTheme.primary(context)),
              ],
            ),
            SizedBox(height: 12.h),
            ...items.map((item) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.label.toUpperCase(), style: TextStyle(fontSize: 10.sp, color: AppTheme.textSecondary(context))),
                  SizedBox(height: 4.h),
                  Text(item.value, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppTheme.primary(context))),
                  if (item.subtitle.isNotEmpty)
                    Text(item.subtitle, style: TextStyle(fontSize: 12.sp, color: AppTheme.textSecondary(context))),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Future<void> _startSession(BuildContext context, TrainingState state) async {
    StageEntity stageEntity = await StageDbHelper().getStageForUser(locator<LocalStorageService>().userIdString);

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
          stageEntity: stageEntity.copyWith(),
        ),
      ));
      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => UsbCameraPage()));
    } else {
      bool wifiConnected = cameraWiBloc.lastConnectedSsid != null && cameraWiBloc.lastConnectedSsid != '';
      bool bluetoothConnected = appBleDeviceBloc.deviceConn?.remoteId != null;

      if (bluetoothConnected && wifiConnected) {
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
            stageEntity: stageEntity,
          ),
        ));

        final des = int.tryParse((stageEntity.distance ?? '1 meter').split(' ').first) ?? 1;
        dis_glob = des;

        Navigator.of(context, rootNavigator: true)
            .push(MaterialPageRoute(builder: (_) => SessionStartViewUpdated(distance: des, withCable: false)))
            .then((_) => appBleDeviceBloc.add(const GetConnectedDevice()));
      } else {
        toast('Connect both wifi and bluetooth to continue');
      }
    }
  }
}

class _InfoItem {
  final String label;
  final String value;
  final String subtitle;

  _InfoItem({required this.label, required this.value, this.subtitle = ''});
}