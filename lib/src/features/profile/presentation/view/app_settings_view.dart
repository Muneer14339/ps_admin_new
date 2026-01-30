import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/theme_bloc/app_theme_bloc.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/custom_switch.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';
import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart'
    as ble;
import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart';
import 'package:pa_sreens/src/features/profile/data/model/app_settings_model.dart';
import 'package:pa_sreens/src/features/profile/presentation/view/community_forms_view.dart';
import 'package:pa_sreens/src/features/profile/presentation/view/data_backup_view.dart';
import 'package:pa_sreens/src/features/profile/presentation/view/faqs_view.dart';
import 'package:pa_sreens/src/features/profile/presentation/widgets/app_settings_tile.dart';
import 'package:pa_sreens/src/features/profile/presentation/widgets/expension_child.dart';
import 'package:pa_sreens/src/features/profile/presentation/widgets/lang_region_tile.dart';
import 'package:pa_sreens/src/features/profile/presentation/widgets/settings_dropdown.dart';
import 'package:pa_sreens/src/features/profile/presentation/widgets/settings_label_widget.dart';
import 'package:pa_sreens/src/features/profile/presentation/view/support_feedback_view.dart';
import '../blocs/profile_bloc/profile_bloc.dart';

// ignore: must_be_immutable
class AppSettingsView extends StatefulWidget {
  const AppSettingsView({super.key});

  @override
  State<AppSettingsView> createState() => _AppSettingsViewState();
}

class _AppSettingsViewState extends State<AppSettingsView> {
  OverlayPortalController dateFormatController = OverlayPortalController();
  OverlayPortalController timeFormatController = OverlayPortalController();
  OverlayPortalController languageController = OverlayPortalController();
  OverlayPortalController distanceController = OverlayPortalController();
  OverlayPortalController linkedAccController = OverlayPortalController();
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrainBackgroundPainter(context), //BackgroundPainter(),
      child: Scaffold(
        appBar: appBarCustom(ctx: context, title: 'App Settings'),
        body: BlocProvider.value(
          value: locator<ProfileBloc>(),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return ListView(
                padding: hPadding,
                children: [
                  const Gap(35),
                  const SettingsLabelWidget(label: 'General'),
                  const Gap(8),
                  ModifiedContainer(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    borderRadius: 12,
                    color: Theme.of(context).cardColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Gap(16),
                        AppSettingsTile(
                          leadingIcon: 'assets/icons/theme.png',
                          title: 'Theme',
                          text: 'Light Theme',
                          trailing: CustomSwitch(
                            value:
                                Theme.of(context).brightness != Brightness.dark,
                            enableColor: AppColors.kPrimaryColor,
                            disableColor:
                                AppColors.switchColor.withOpacity(0.3),
                            onChanged: (value) {
                              settingsModel.isLightTheme = value;
                              context
                                  .read<AppThemeBloc>()
                                  .add(const AppThemeEvent.toggleTheme());
                            },
                          ),
                        ),
                        AppSettingsTile(
                          leadingIcon: 'assets/icons/pushNotifications.png',
                          title: 'Allow Push Notification',
                          text: 'Disallow',
                          trailing: CustomSwitch(
                              value: settingsModel.pushNotifications == true,
                              enableColor: AppColors.kPrimaryColor,
                              disableColor:
                                  AppColors.switchColor.withOpacity(0.3),
                              onChanged: (value) {
                                settingsModel.pushNotifications = value;
                              }),
                        ),
                        AppSettingsTile(
                          leadingIcon: 'assets/icons/refresh.png',
                          title: 'Background Updates',
                          text: 'ON',
                          trailing: CustomSwitch(
                              value: settingsModel.backgroundUpdated == true,
                              enableColor: AppColors.kPrimaryColor,
                              disableColor:
                                  AppColors.switchColor.withOpacity(0.3),
                              onChanged: (value) {
                                settingsModel.backgroundUpdated = value;
                              }),
                        ),
                        SettingsDropdown(
                          items: const [
                            AccountTile(
                              profileImage: 'assets/shotpulse.png',
                              name: 'ShotPulse',
                              username: '@username',
                              iconColor: Colors.green,
                              initials: 'Δ',
                            ),
                            AccountTile(
                              profileImage: 'assets/coachv.png',
                              name: 'Coach V',
                              username: '@username',
                              iconColor: Colors.orange,
                              initials: 'CV',
                            ),
                            AccountTile(
                              profileImage: 'assets/rt.png',
                              name: 'RT',
                              username: '@username',
                              iconColor: Colors.blue,
                              initials: 'RT',
                            ),
                          ],
                          text: '3 Accounts',
                          title: 'Linked Accounts',
                          overlayController: linkedAccController,
                          leadingIcon: 'assets/icons/linked2.png',
                        ),
                        SettingsDropdown(
                          items: [
                            LanguageRegionTile(
                                onChanged: (p0) {
                                  settingsModel.region = p0;
                                  context
                                      .read<ProfileBloc>()
                                      .add(RegionChangeEvent(region: p0 ?? ''));
                                  languageController.hide();
                                },
                                groupValue: (state is RegionChangeState)
                                    ? state.regoin
                                    : settingsModel.region ?? '',
                                value: 'English, UK'),
                            LanguageRegionTile(
                                onChanged: (p0) {
                                  settingsModel.region = p0;
                                  context
                                      .read<ProfileBloc>()
                                      .add(RegionChangeEvent(region: p0 ?? ''));
                                  languageController.hide();
                                },
                                groupValue: (state is RegionChangeState)
                                    ? state.regoin
                                    : settingsModel.region ?? '',
                                value: 'English, USA'),
                            LanguageRegionTile(
                                onChanged: (p0) {
                                  settingsModel.region = p0;
                                  context
                                      .read<ProfileBloc>()
                                      .add(RegionChangeEvent(region: p0 ?? ''));
                                  languageController.hide();
                                },
                                groupValue: (state is RegionChangeState)
                                    ? state.regoin
                                    : settingsModel.region ?? '',
                                value: 'English, Australia'),
                            LanguageRegionTile(
                                onChanged: (p0) {
                                  settingsModel.region = p0;
                                  context
                                      .read<ProfileBloc>()
                                      .add(RegionChangeEvent(region: p0 ?? ''));
                                  languageController.hide();
                                },
                                groupValue: (state is RegionChangeState)
                                    ? state.regoin
                                    : settingsModel.region ?? '',
                                value: 'Urdu, Pakistan'),
                            LanguageRegionTile(
                                onChanged: (p0) {
                                  settingsModel.region = p0;
                                  context
                                      .read<ProfileBloc>()
                                      .add(RegionChangeEvent(region: p0 ?? ''));
                                  languageController.hide();
                                },
                                groupValue: (state is RegionChangeState)
                                    ? state.regoin
                                    : settingsModel.region ?? '',
                                value: 'Hindi, India UK'),
                            LanguageRegionTile(
                                onChanged: (p0) {
                                  settingsModel.region = p0;
                                  context
                                      .read<ProfileBloc>()
                                      .add(RegionChangeEvent(region: p0 ?? ''));
                                  languageController.hide();
                                },
                                groupValue: (state is RegionChangeState)
                                    ? state.regoin
                                    : settingsModel.region ?? '',
                                value: 'Chinese, China'),
                            LanguageRegionTile(
                                onChanged: (p0) {
                                  settingsModel.region = p0;
                                  context
                                      .read<ProfileBloc>()
                                      .add(RegionChangeEvent(region: p0 ?? ''));
                                  languageController.hide();
                                },
                                groupValue: (state is RegionChangeState)
                                    ? state.regoin
                                    : settingsModel.region ?? '',
                                value: 'Arabic, Saudi Arabia'),
                            LanguageRegionTile(
                                onChanged: (p0) {
                                  settingsModel.region = p0;
                                  context
                                      .read<ProfileBloc>()
                                      .add(RegionChangeEvent(region: p0 ?? ''));
                                  languageController.hide();
                                },
                                groupValue: (state is RegionChangeState)
                                    ? state.regoin
                                    : settingsModel.region ?? '',
                                value: 'German, Germany'),
                          ],
                          text: (state is RegionChangeState)
                              ? state.regoin
                              : settingsModel.region ?? '',
                          title: 'Language and Region',
                          overlayController: languageController,
                          leadingIcon: 'assets/icons/region.png',
                        ),
                        SettingsDropdown(
                          items: [
                            LanguageRegionTile(
                                onChanged: (p0) {
                                  settingsModel.dateFormat = p0;
                                  context.read<ProfileBloc>().add(
                                      DateFormatChangeEvent(
                                          dateFormat: p0 ?? ''));
                                  dateFormatController.hide();
                                },
                                groupValue: (state is DateFormatChangeState)
                                    ? state.date
                                    : settingsModel.dateFormat ?? '',
                                value: 'MM/DD/YYYY'),
                            LanguageRegionTile(
                                onChanged: (p0) {
                                  settingsModel.dateFormat = p0;
                                  context.read<ProfileBloc>().add(
                                      DateFormatChangeEvent(
                                          dateFormat: p0 ?? ''));
                                  dateFormatController.hide();
                                },
                                groupValue: (state is DateFormatChangeState)
                                    ? state.date
                                    : settingsModel.dateFormat ?? '',
                                value: 'DD/MM/YYYY')
                          ],
                          overlayController: dateFormatController,
                          text: (state is DateFormatChangeState)
                              ? state.date
                              : settingsModel.dateFormat ?? '',
                          title: 'Date Format',
                          leadingIcon: 'assets/icons/dateFormat3.png',
                        ),
                        SettingsDropdown(
                            items: [
                              LanguageRegionTile(
                                  onChanged: (p0) {
                                    settingsModel.timeFormat = p0;
                                    context.read<ProfileBloc>().add(
                                        TimeFormatChangeEvent(time: p0 ?? ''));
                                    timeFormatController.hide();
                                  },
                                  groupValue: (state is TimeFormatChangeState)
                                      ? state.time
                                      : settingsModel.timeFormat ?? '',
                                  value: '12 Hours'),
                              LanguageRegionTile(
                                  onChanged: (p0) {
                                    settingsModel.timeFormat = p0;
                                    context.read<ProfileBloc>().add(
                                        TimeFormatChangeEvent(time: p0 ?? ''));
                                    timeFormatController.hide();
                                  },
                                  groupValue: (state is TimeFormatChangeState)
                                      ? state.time
                                      : settingsModel.timeFormat ?? '',
                                  value: '24 Hours')
                            ],
                            text: (state is TimeFormatChangeState)
                                ? state.time
                                : settingsModel.timeFormat ?? '',
                            title: 'Time Fromat',
                            overlayController: timeFormatController,
                            leadingIcon: 'assets/icons/timeFormat3.png'),
                        SettingsDropdown(
                          items: [
                            LanguageRegionTile(
                                onChanged: (p0) {
                                  settingsModel.distance = p0;
                                  context.read<ProfileBloc>().add(
                                      DistanceChangeEvent(distance: p0 ?? ''));
                                  distanceController.hide();
                                },
                                groupValue: (state is DistanceChangeState)
                                    ? state.distance
                                    : settingsModel.distance ?? '',
                                value: 'Yards'),
                            LanguageRegionTile(
                                onChanged: (p0) {
                                  settingsModel.distance = p0;
                                  context.read<ProfileBloc>().add(
                                      DistanceChangeEvent(distance: p0 ?? ''));
                                  distanceController.hide();
                                },
                                groupValue: (state is DistanceChangeState)
                                    ? state.distance
                                    : settingsModel.distance ?? '',
                                value: 'Feet'),
                            LanguageRegionTile(
                                onChanged: (p0) {
                                  settingsModel.distance = p0;
                                  context.read<ProfileBloc>().add(
                                      DistanceChangeEvent(distance: p0 ?? ''));
                                  distanceController.hide();
                                },
                                groupValue: (state is DistanceChangeState)
                                    ? state.distance
                                    : settingsModel.distance ?? '',
                                value: 'Meter')
                          ],
                          text: (state is DistanceChangeState)
                              ? state.distance
                              : settingsModel.distance ?? '',
                          title: 'Distance Unit',
                          overlayController: distanceController,
                          leadingIcon: 'assets/icons/location_settings.png',
                        ),
                      ],
                    ),
                  ),
                  const SettingsLabelWidget(label: 'Connection Wizard'),
                  const Gap(8),
                  ModifiedContainer(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      borderRadius: 12,
                      color: Theme.of(context).cardColor,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        BlocBuilder<ble.AppBleDeviceBloc,
                            ble.AppBleDeviceState>(
                          builder: (context, state) {
                            return AppSettingsTile(
                                leadingIcon:
                                    'assets/icons/bluetooth_profile.png',
                                title: 'PulseAim Bluetooth',
                                text: settingsModel.bluetooth ?? 'OFF',
                                trailing: CustomSwitch(
                                    value: state is ble.ServicesDiscovered,
                                    //settingsModel.bluetooth == 'ON',
                                    enableColor: AppColors.kPrimaryColor,
                                    disableColor:
                                        AppColors.switchColor.withOpacity(0.3),
                                    onChanged: (value) {
                                      settingsModel.bluetooth =
                                          value ? 'ON' : 'OFF';
                                    }));
                          },
                        ),
                        BlocProvider(
                          create: (context) =>
                              CameraWifiBloc()..add(const GetConnectedSSID()),
                          child: BlocBuilder<CameraWifiBloc, CameraWifiState>(
                            builder: (context, state) {
                              return AppSettingsTile(
                                  leadingIcon: 'assets/icons/wifi_profile.png',
                                  title: 'Camera WiFi',
                                  text: 'OFF',
                                  trailing: CustomSwitch(
                                    value: state is Connected &&
                                        state.ssid.isNotEmpty &&
                                        state.ssid != '<unknown ssid>',
                                    enableColor: AppColors.kPrimaryColor,
                                    disableColor:
                                        AppColors.switchColor.withOpacity(0.3),
                                    onChanged: (value) {
                                      // settingsModel.wifi = value ? 'ON' : 'OFF';
                                    },
                                  ));
                            },
                          ),
                        )
                      ])),
                  const SettingsLabelWidget(label: 'Data & Backup'),
                  const Gap(8),
                  ModifiedContainer(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const DataBackupView()));
                      },
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      borderRadius: 12,
                      color: Theme.of(context).cardColor,
                      child: const AppSettingsTile(
                          leadingIcon: 'assets/icons/backup.png',
                          title: 'Data and Backup',
                          text: '',
                          trailing: Icon(Icons.arrow_forward_ios_rounded,
                              size: arrowIconSize))),
                  const SettingsLabelWidget(label: 'Other'),
                  const Gap(8),
                  ModifiedContainer(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      borderRadius: 12,
                      color: Theme.of(context).cardColor,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        AppSettingsTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SupportFeedback()));
                          },
                          leadingIcon: 'assets/icons/support.png',
                          title: 'Support & Feedback',
                          text: '',
                          trailing: const Icon(Icons.arrow_forward_ios_rounded,
                              size: arrowIconSize),
                        ),
                        AppSettingsTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const FaqsView()));
                          },
                          leadingIcon: 'assets/icons/faqs.png',
                          title: 'In-app FAQs',
                          text: '',
                          trailing: const Icon(Icons.arrow_forward_ios_rounded,
                              size: arrowIconSize),
                        ),
                        AppSettingsTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const CommunityFormsView()));
                          },
                          leadingIcon: 'assets/icons/community.png',
                          title: 'Community & Forums',
                          text: '',
                          trailing: const Icon(Icons.arrow_forward_ios_rounded,
                              size: arrowIconSize),
                        ),
                      ])),
                  Gap(70.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  AppSettingsModel settingsModel = AppSettingsModel(
    isLightTheme: false,
    pushNotifications: false,
    backgroundUpdated: false,
  );
}
