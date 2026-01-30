// lib/user_dashboard/pages/main_app_page.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app config/app_config.dart';
import '../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../core/services/locator/locator.dart';
import '../../../core/theme/theme_data/theme_data.dart';
import '../../auth_new/authentication/presentation/bloc/auth_bloc.dart';
import '../../auth_new/authentication/presentation/pages/login_page.dart';
import '../../session_history/presentation/view/history_tab_view.dart';
import '../../train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import '../../train/connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart';
import '../../train/connectivity/presentation/view/bluetooth_view.dart';
import '../../train/connectivity/presentation/view/wifi_list_view.dart';
import '../../training_new/presentation/widgets/view/training_layout_view.dart';
import '../../training_new/presentation/widgets/view/training_layout_wrapper.dart';
import '../presentation/widgets/tab_widgets/enhanced_armory_tab_view.dart';
import 'placeholder_tabs.dart';

class MainAppPage extends StatelessWidget {
  const MainAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainAppView();
  }
}

class MainAppView extends StatefulWidget {
  const MainAppView({super.key});

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  String? userId;
  int _currentIndex = 1;

  final List<BottomNavTab> _tabs = const [
    BottomNavTab(assetPath: 'assets/icons/bottom_navigation/home.png'),
    BottomNavTab(assetPath: 'assets/icons/bottom_navigation/armory.png'),
    BottomNavTab(assetPath: 'assets/icons/bottom_navigation/training.png'),
    BottomNavTab(assetPath: 'assets/icons/bottom_navigation/history.png'),
    BottomNavTab(assetPath: 'assets/icons/bottom_navigation/profile.png'),
  ];

  @override
  void initState() {
    super.initState();
    userId = locator<LocalStorageService>().userId!;

    Future.delayed(Duration.zero, () {
      if (mounted) {
        showSetupRequiredDialog(context);
      }
    });
  }

  void showSetupRequiredDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E212C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          titlePadding: EdgeInsets.only(top: 24.h),
          title: Center(
            child: Text(
              'Setup Required',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          content: Text(
            'Please turn on your AimSync Camera and AimSync BLE device before continuing.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11.sp,
              color: const Color(0xFFB0B3BA),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: EdgeInsets.only(bottom: 20),
          actions: [
            SizedBox(
              width: 0.30.sw,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  cameraWiBloc.add(ConnectToWifiBackGround());
                  // await exportAllInternalVideos();
                  appBleDeviceBloc.add(
                    AppBleDeviceEvent.backgroundConnectToBLEDevice(),
                  );

                  Navigator.of(dialogContext).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeMap(
          unauthenticated: (_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: AppTheme.background(context),
        extendBody: false, // ensures proper layout with SafeArea
        body: SafeArea(
          top: false,
          bottom: false,
          child: userId == null ? _buildUnauthenticatedView() : _buildBody(),
        ),
        bottomNavigationBar: SafeArea(
          top: false,
          child: _buildBottomNavigation(),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppTheme.primary(context),
      elevation: 0,
      title: Text(
        AppConfig.appName,
        style: AppTheme.headingMedium(context),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.logout,
            color: AppTheme.textPrimary(context),
            size: AppTheme.iconMedium,
          ),
          onPressed: () {
            // context.read<AuthBloc>().add(const LogoutRequested());
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const HomeTabWidget();
      case 1:
        return const EnhancedArmoryTabView();
      case 2:
        return const TrainingLayoutWrapper();
      case 3:
        return const HistoryTabWidget();
      case 4:
        return const ProfileTabWidget();
      default:
        return const HomeTabWidget();
    }
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 70,
      padding: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: AppTheme.background(context),
        border: Border(
          top: BorderSide(
            color: AppTheme.primary(context).withOpacity(0.2),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary(context).withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: _tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isActive = _currentIndex == index;

          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOutBack,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AnimatedScale(
                  scale: isActive ? 1.25 : 1.0, // 👈 expand on active
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutBack,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // 👇 Optional glow effect when active
                      if (isActive)
                        Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // border: Border.all(
                            //   color: AppTheme.primary(context),
                            //   width: 2,),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    AppTheme.primary(context).withOpacity(0.3),
                                blurRadius: 10,
                                spreadRadius: 3,
                              ),
                            ],
                          ),
                        ),
                      Opacity(
                        opacity: isActive ? 1.0 : 0.6,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            isActive
                                ? AppTheme.primary(context)
                                : AppTheme.textPrimary(context),
                            BlendMode.srcIn,
                          ),
                          child: Image.asset(
                            tab.assetPath,
                            width: isActive ? 34 : 32,
                            height: isActive ? 35 : 32,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildUnauthenticatedView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: AppTheme.error(context),
            size: AppTheme.iconXLarge,
          ),
          SizedBox(height: AppTheme.spacingMedium),
          Text(
            'User not authenticated',
            style: AppTheme.bodyMedium(context).copyWith(
              color: AppTheme.error(context),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavTab {
  final String assetPath;

  const BottomNavTab({
    required this.assetPath,
  });
}
