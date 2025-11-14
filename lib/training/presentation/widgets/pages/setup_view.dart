import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/core/routes/app_routes.dart';
import 'package:pa_sreens/core/routes/locatore.dart';
import 'package:pa_sreens/core/theme/app_theme.dart';
import 'package:pa_sreens/training/presentation/bloc/training_bloc.dart';
import 'package:pa_sreens/training/presentation/bloc/training_state.dart';
import '../../../../core/routes/routes_services.dart' show RoutesService;

class SessionSetupView extends StatelessWidget {
  static const routeName = '/session-setup';
  const SessionSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        return _SessionSetupContent(state: state);
      },
    );
  }
}

class _SessionSetupContent extends StatelessWidget {
  final TrainingState state;

  const _SessionSetupContent({required this.state});

  @override
  Widget build(BuildContext context) {
    final List<_SetupItem> items = [
      _SetupItem(
        icon: Icons.language_outlined,
        title: 'Connection',
        subtitle: state.isWifiConnected && state.isBleConnected
            ? 'Wi-Fi and Bluetooth connected'
            : 'Set up Wi-Fi and Bluetooth connections',
        validated: state.isWifiConnected && state.isBleConnected,
        onTap: () {
          locator<RoutesService>().navigateTo(AppRoutes.chooseWifiBle);
        },
      ),
      _SetupItem(
        icon: Icons.settings_input_component_rounded,
        title: 'Loadout Setup',
        subtitle: state.isLoadoutSelected
            ? state.selectedLoadout?.name ?? 'Loadout selected'
            : 'Choose a loadout for your training session.',
        validated: state.isLoadoutSelected,
        onTap: () {
          locator<RoutesService>().navigateTo(AppRoutes.loadoutList);
        },
      ),
      _SetupItem(
        icon: Icons.notifications_active_outlined,
        title: 'Configure Alerts',
        subtitle: 'Set up your sound and vibration alerts.',
        validated: true, // Always accessible
        onTap: () {
          locator<RoutesService>().navigateTo(AppRoutes.userAlert);
        },
      ),
      _SetupItem(
        icon: Icons.fitness_center_outlined,
        title: 'Drill Selection',
        subtitle: state.isDrillSelected
            ? state.selectedDrill?.name ?? 'Drill selected'
            : 'Choose a training drill to begin.',
        validated: state.isDrillSelected,
        onTap: () {
          locator<RoutesService>().navigateTo(AppRoutes.drillList);
        },
      ),
    ];

    return Scaffold(
      backgroundColor: AppTheme.background(context),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _setupCard(item, context);
        },
      ),
    );
  }

  /// 🟩 Each item card
  Widget _setupCard(_SetupItem item, BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
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
              child: Icon(item.icon, color: AppTheme.primary(context), size: 26),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary(context),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    style: TextStyle(fontSize: 13, color: AppTheme.textSecondary(context)),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
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