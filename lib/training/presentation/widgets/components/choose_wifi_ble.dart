import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/core/theme/app_theme.dart';
import 'package:pa_sreens/core/routes/app_routes.dart';
import 'package:pa_sreens/core/routes/locatore.dart';
import 'package:pa_sreens/core/routes/routes_services.dart';
import 'package:pa_sreens/training/presentation/bloc/training_bloc.dart';
import 'package:pa_sreens/training/presentation/bloc/training_state.dart';

class ChooseWifiBle extends StatelessWidget {
  static const String routeName = '/choose_Wifi_Ble';
  const ChooseWifiBle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        return _ChooseWifiBleContent(state: state);
      },
    );
  }
}

class _ChooseWifiBleContent extends StatelessWidget {
  final TrainingState state;

  const _ChooseWifiBleContent({required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButtonWithTitle(title: 'Choose Connection'),
            const SizedBox(height: 20),

            Text(
              "Select how you want to connect your device",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppTheme.textPrimary(context),
              ),
            ),
            const SizedBox(height: 24),

            // --- WiFi Card ---
            _connectionCard(
              context,
              title: "Wi-Fi Connection",
              subtitle: state.selectedWifiDevice?.name ??
                  "Connect via Wi-Fi network",
              icon: Icons.wifi_rounded,
              isConnected: state.isWifiConnected,
              onTap: () {
                locator<RoutesService>().navigateTo(AppRoutes.wifiList);
              },
            ),

            const SizedBox(height: 20),

            // --- Bluetooth Card ---
            _connectionCard(
              context,
              title: "Bluetooth (BLE)",
              subtitle: state.selectedBleDevice?.name ??
                  "Connect to nearby BLE devices",
              icon: Icons.bluetooth_rounded,
              isConnected: state.isBleConnected,
              onTap: () {
                locator<RoutesService>().navigateTo(AppRoutes.bleList);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _connectionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isConnected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isConnected
              ? AppTheme.primary(context).withOpacity(0.2)
              : AppTheme.background(context),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppTheme.primary(context).withOpacity(0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppTheme.primary(context).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: AppTheme.primary(context),
                size: 28,
              ),
            ),
            const SizedBox(width: 20),

            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary(context),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: AppTheme.textSecondary(context),
                    ),
                  ),
                ],
              ),
            ),

            // Connection icon
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isConnected
                  ? Icon(
                      Icons.check_circle,
                      key: const ValueKey('connected'),
                      color: AppTheme.primary(context),
                      size: 28,
                    )
                  : Icon(
                      Icons.arrow_forward_ios_rounded,
                      key: const ValueKey('not_connected'),
                      color: AppTheme.textSecondary(context),
                      size: 22,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackButtonWithTitle extends StatelessWidget {
  final String? title;
  final bool isShowRefreshIcon;
  final VoidCallback? onRefresh;
  const BackButtonWithTitle({
    Key? key,
    this.title,
    this.isShowRefreshIcon = false,
    this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            locator<RoutesService>().goBack();
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppTheme.background(context),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppTheme.primary(context),
                width: 1,
              ),
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: AppTheme.primary(context),
            ),
          ),
        ),
        if (title != null) ...[
          const SizedBox(width: 16),
          Text(
            title!,
            style: TextStyle(
              color: AppTheme.primary(context),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        if (isShowRefreshIcon) ...[
          const Spacer(),
          InkWell(
            onTap: onRefresh,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.background(context),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppTheme.border(context),
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.refresh_outlined,
                color: AppTheme.textSecondary(context),
                size: 22,
              ),
            ),
          ),
        ],
      ],
    );
  }
}