// lib/user_dashboard/pages/main_app_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pa_sreens/training/presentation/widgets/view/training_layout_view.dart';

import '../../armory/presentation/pages/enhanced_armory_tab_view.dart';
import '../../core/config/app_config.dart';
import '../../authentication/presentation/bloc/login_bloc/auth_bloc.dart';
import '../../authentication/presentation/bloc/login_bloc/auth_event.dart';
import '../../authentication/presentation/bloc/login_bloc/auth_state.dart';
import '../../authentication/presentation/pages/login_page.dart';
import '../../core/theme/app_theme.dart';
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
    userId = FirebaseAuth.instance.currentUser?.uid;

  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
          );
        }
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
            context.read<AuthBloc>().add(const LogoutRequested());
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
        return const TrainingLayoutView();
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
                              color: AppTheme.primary(context).withOpacity(0.3),
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
