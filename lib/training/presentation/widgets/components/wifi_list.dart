import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/core/theme/app_theme.dart';
import 'package:pa_sreens/training/presentation/widgets/components/choose_wifi_ble.dart';

import 'package:pa_sreens/training/data/models/wifi_device_model.dart';
import 'package:pa_sreens/training/presentation/bloc/training_bloc.dart';
import 'package:pa_sreens/training/presentation/bloc/training_event.dart';
import 'package:pa_sreens/training/presentation/bloc/training_state.dart';

class WifiList extends StatelessWidget {
  static const String routeName = '/wifiList';
  const WifiList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        return _WifiListContent(state: state);
      },
    );
  }
}

class _WifiListContent extends StatelessWidget {
  final TrainingState state;

  const _WifiListContent({required this.state});

  @override
  Widget build(BuildContext context) {
    // Use dummy list directly in this widget
    final wifiNetworks = [
      WifiDeviceModel(name: 'Home WiFi', subtitle: 'WPA2 • 2.4 GHz', signal: 4),
      WifiDeviceModel(name: 'OfficeGuest', subtitle: 'Open • 5 GHz', signal: 2),
      WifiDeviceModel(name: 'MyPhone-Hotspot', subtitle: 'WPA3', signal: 3),
      WifiDeviceModel(
        name: 'Camera_WiFi_001',
        subtitle: 'AimSync Camera Network',
        signal: 4,
      ),
      WifiDeviceModel(
        name: 'Training_Range_WiFi',
        subtitle: 'Secure • 2.4 GHz',
        signal: 3,
      ),
    ];

    final connectedDevices = wifiNetworks
        .where((d) => state.connectedWifiId == d.id)
        .toList();
    final availableDevices = wifiNetworks
        .where((d) => state.connectedWifiId != d.id)
        .toList();

    return Scaffold(
      body: Container(
        color: AppTheme.background(context),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: BackButtonWithTitle(
                title: 'Wi-Fi Connections',
                isShowRefreshIcon: true,
                onRefresh: () {
                  // You can add refresh logic here if needed
                  // For example: context.read<TrainingBloc>().add(RefreshWifiNetworksEvent());
                },
              ),
            ),

            const SizedBox(height: 20),
            if (connectedDevices.isNotEmpty) ...[
              const SectionHeader(title: 'Connected Device', icon: Icons.wifi),
              const SizedBox(height: 8),
              ...connectedDevices.map(
                (d) => DeviceTile(
                  device: d,
                  connected: true,
                  onTapConnect: () {
                    _toggleConnection(context, d);
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
            const SectionHeader(title: 'Available Devices', icon: Icons.wifi),
            const SizedBox(height: 8),
            ...availableDevices.map(
              (d) => DeviceTile(
                device: d,
                connected: false,
                onTapConnect: () {
                  _toggleConnection(context, d);
                },
              ),
            ),
            const SizedBox(height: 20),

            // FIXED: Use Column instead of Row for better responsive layout
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // For smaller screens, stack buttons vertically
                if (MediaQuery.of(context).size.width < 600) ...[
                  _AddNetworkButton(),
                  const SizedBox(height: 12),
                  const _WarningCard(),
                ] else ...[
                  // For larger screens, use Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _AddNetworkButton(),
                      const SizedBox(width: 20),
                      Expanded(child: const _WarningCard()),
                    ],
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _toggleConnection(BuildContext context, WifiDeviceModel device) {
    // Dispatch event to BLoC
    context.read<TrainingBloc>().add(ToggleWifiConnectionEvent(device));

    // Navigate back after connection (optional)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // You can choose to navigate back immediately or stay on the screen
      // If you want to navigate back:
      // if (Navigator.of(context).canPop()) {
      //   Navigator.of(context).pop();
      // }
    });
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  const SectionHeader({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary(context),
          ),
        ),
      ],
    );
  }
}

class DeviceTile extends StatelessWidget {
  final WifiDeviceModel device;
  final bool connected;
  final VoidCallback onTapConnect;

  const DeviceTile({
    super.key,
    required this.device,
    required this.connected,
    required this.onTapConnect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapConnect,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: connected
              ? AppTheme.primary(context).withOpacity(0.2)
              : AppTheme.background(context),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppTheme.primary(context).withOpacity(0.2)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        child: Row(
          children: [
            Icon(Icons.wifi, color: AppTheme.textSecondary(context), size: 26),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppTheme.textPrimary(context),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    device.subtitle,
                    style: TextStyle(
                      color: AppTheme.textSecondary(context),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: connected
                  ? TextButton.icon(
                      key: const ValueKey('connected'),
                      onPressed: onTapConnect,
                      icon: Icon(
                        Icons.check,
                        size: 18,
                        color: AppTheme.background(context),
                      ),
                      label: Text(
                        'Connected',
                        style: TextStyle(color: AppTheme.background(context)),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: AppTheme.primary(context),
                        foregroundColor: AppTheme.background(context),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    )
                  : OutlinedButton(
                      key: const ValueKey('connect'),
                      onPressed: onTapConnect,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.primary(context),
                        side: BorderSide(color: AppTheme.primary(context)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Connect',
                        style: TextStyle(color: AppTheme.primary(context)),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddNetworkButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.orangeAccent,
        side: const BorderSide(color: Colors.orangeAccent),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        // Add network logic here
      },
      icon: const Icon(Icons.add),
      label: const Text('Add Network'),
    );
  }
}

class _WarningCard extends StatelessWidget {
  const _WarningCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // FIXED: Provide explicit width
      constraints: const BoxConstraints(
        minWidth: 200,
        maxWidth: 500, // FIXED: Set maximum width
      ),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.orangeAccent.withOpacity(0.6)),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.orangeAccent),
          const SizedBox(width: 10),
          Expanded(
            // FIXED: Now safe to use Expanded since parent has constraints
            child: Text(
              'If Camera Wi-Fi name is not listed here, you need to turn on your camera',
              style: TextStyle(
                color: Colors.orangeAccent.withOpacity(0.9),
                fontSize: 14,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
