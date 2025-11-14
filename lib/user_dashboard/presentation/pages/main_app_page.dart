// lib/user_dashboard/presentation/pages/main_app_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pa_sreens/armory/presentation/bloc/armory_bloc.dart'
    show ArmoryBloc;
import 'package:pa_sreens/core/theme/app_theme.dart';
import 'package:pa_sreens/training/presentation/widgets/view/training_layout_view.dart';
import 'package:pa_sreens/user_dashboard/pages/placeholder_tabs.dart';
import '../../../armory/presentation/pages/enhanced_armory_tab_view.dart';
import '../../../injection_container.dart';
import '../../../core/config/app_config.dart'; // Add this import
import '../../../authentication/presentation/bloc/login_bloc/auth_bloc.dart';
import '../../../authentication/presentation/bloc/login_bloc/auth_event.dart';
import '../../../authentication/presentation/bloc/login_bloc/auth_state.dart';
import '../../../authentication/presentation/pages/login_page.dart';

class MainAppPage extends StatelessWidget {
  const MainAppPage({super.key}); // Remove navigation style parameter

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => sl<AuthBloc>()),
        BlocProvider<ArmoryBloc>(create: (_) => sl<ArmoryBloc>()),
      ],
      child: const MainAppView(), // Remove navigation style parameter
    );
  }
}

class MainAppView extends StatefulWidget {
  const MainAppView({super.key}); // Remove navigation style parameter

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  String? userId;
  int _currentIndex = 1; // Start with Armory tab (index 1)

  final List<BottomNavTab> _tabs = [
    const BottomNavTab(assetPath: 'assets/icons/bottom_navigation/home.png'),
    const BottomNavTab(assetPath: 'assets/icons/bottom_navigation/armory.png'),
    const BottomNavTab(
      assetPath: 'assets/icons/bottom_navigation/training.png',
    ),
    const BottomNavTab(assetPath: 'assets/icons/bottom_navigation/history.png'),
    const BottomNavTab(assetPath: 'assets/icons/bottom_navigation/profile.png'),
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
        // appBar: _buildAppBar(),
        body: userId == null ? _buildUnauthenticatedView() : _buildBody(),
        bottomNavigationBar: _buildBottomNavigation(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppTheme.primary(context),
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConfig.appName, // Use config app name
            style: AppTheme.headingMedium(context),
          ),
          Text(
            AppConfig.appSubtitle, // Use config subtitle
            style: AppTheme.labelMedium(context),
          ),
        ],
      ),
      actions: [
        // Remove navigation style selector - no conditional logic needed
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.white, size: 24),
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
        return const EnhancedArmoryTabView(); // Remove navigation style parameter
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
      height: 60,
      decoration: BoxDecoration(
        color: AppTheme.background(context),
        border: Border(
          top: BorderSide(color: AppTheme.background(context), width: 1),
        ),
      ),
      child: Row(
        children: _tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isActive = _currentIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });
              },
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: isActive ? 40 : 35,
                    height: isActive ? 40 : 35,
                    child: Opacity(
                      opacity: isActive ? 1.0 : 0.6,
                      child: Image.asset(tab.assetPath, fit: BoxFit.contain),
                    ),
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
            size: AppTheme.elevationHigh,
          ),
          const SizedBox(height: 20),
          Text(
            'User not authenticated',
            style: TextStyle(color: AppTheme.error(context), fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class BottomNavTab {
  final String assetPath;

  const BottomNavTab({required this.assetPath});
}
