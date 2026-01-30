import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/enum/session_enum.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../train/stage/features/drill/data/model/drills_entity.dart';
import '../../data/models/session_model.dart';
import '../../data/models/wifi_device_model.dart';

class TrainingState extends Equatable {
  final SessionModel session;
  final int shotCount;
  final int sessionTimer;
  final bool isRunning;
  final bool isConnected;
  final bool isLoadoutSelected;
  final bool isDrillSelected;
  final bool isWifiConnected;
  final bool isBleConnected;
  final SessionPage currentPage;
  final Set<SessionPage> completedSteps;
  final LoadoutModel? selectedLoadout;
  final DrillsModel? selectedDrill;
  final List<WifiDeviceModel> wifiNetworks;
  final String? connectedWifiId;
  final WifiDeviceModel? selectedWifiDevice;
  final WifiDeviceModel? selectedBleDevice;
  final List<WifiDeviceModel> bluetoothDevices;
  final String? connectedBleId;
  final String timerType;
  final String startSignal;
  final String scoring;
  final String? error;

  final List<bool>? audioPreferences;
  final List<bool>? safetyPreferences;

  TrainingState({
    SessionModel? session,
    this.shotCount = 0,
    this.sessionTimer = 0,
    this.isRunning = false,
    this.isConnected = false,
    this.isLoadoutSelected = false,
    this.isDrillSelected = false,
    this.isWifiConnected = false,
    this.isBleConnected = false,
    this.currentPage = SessionPage.setup,
    this.completedSteps = const {},
    this.selectedLoadout,
    this.selectedDrill,
    this.wifiNetworks = const [],
    this.connectedWifiId,
    this.selectedWifiDevice,
    this.selectedBleDevice,
    this.bluetoothDevices = const [],
    this.connectedBleId,
    this.timerType = 'Free',
    this.startSignal = 'Beep',
    this.scoring = 'Time-only',
    this.error,
    this.audioPreferences,
    this.safetyPreferences,
  }) : session = session ?? SessionModel();

  // Helper getters (equivalent to GetX computed values)
  bool get isSetupComplete => session.loadout != null && isConnected;

  bool isStepCompleted(SessionPage page) => completedSteps.contains(page);

  bool isAllowed(SessionPage page) {
    final sections = getSections();
    final idx = sections.indexWhere((s) => s['page'] == page);
    if (idx <= 0) return true;
    final prev = sections[idx - 1]['page'] as SessionPage;
    return isStepCompleted(prev);
  }

  List<Map<String, dynamic>> getSections() {
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
      {
        'title': 'Start Session',
        'icon': Icons.play_arrow,
        'page': SessionPage.active,
        'route': AppRoutes.activeView,
      },
    ];
  }

  TrainingState copyWith({
    SessionModel? session,
    int? shotCount,
    int? sessionTimer,
    bool? isRunning,
    bool? isConnected,
    bool? isLoadoutSelected,
    bool? isDrillSelected,
    bool? isWifiConnected,
    bool? isBleConnected,
    SessionPage? currentPage,
    Set<SessionPage>? completedSteps,
    LoadoutModel? selectedLoadout,
    DrillsModel? selectedDrill,
    List<WifiDeviceModel>? wifiNetworks,
    String? connectedWifiId,
    WifiDeviceModel? selectedWifiDevice,
    WifiDeviceModel? selectedBleDevice,
    List<WifiDeviceModel>? bluetoothDevices,
    String? connectedBleId,
    String? timerType,
    String? startSignal,
    String? scoring,
    String? error,
    List<bool>? audioPreferences,
    List<bool>? safetyPreferences,
  }) {
    return TrainingState(
      session: session ?? this.session,
      shotCount: shotCount ?? this.shotCount,
      sessionTimer: sessionTimer ?? this.sessionTimer,
      isRunning: isRunning ?? this.isRunning,
      isConnected: isConnected ?? this.isConnected,
      isLoadoutSelected: isLoadoutSelected ?? this.isLoadoutSelected,
      isDrillSelected: isDrillSelected ?? this.isDrillSelected,
      isWifiConnected: isWifiConnected ?? this.isWifiConnected,
      isBleConnected: isBleConnected ?? this.isBleConnected,
      currentPage: currentPage ?? this.currentPage,
      completedSteps: completedSteps ?? this.completedSteps,
      selectedLoadout: selectedLoadout ?? this.selectedLoadout,
      selectedDrill: selectedDrill ?? this.selectedDrill,
      wifiNetworks: wifiNetworks ?? this.wifiNetworks,
      connectedWifiId: connectedWifiId ?? this.connectedWifiId,
      selectedWifiDevice: selectedWifiDevice ?? this.selectedWifiDevice,
      selectedBleDevice: selectedBleDevice ?? this.selectedBleDevice,
      bluetoothDevices: bluetoothDevices ?? this.bluetoothDevices,
      connectedBleId: connectedBleId ?? this.connectedBleId,
      timerType: timerType ?? this.timerType,
      startSignal: startSignal ?? this.startSignal,
      scoring: scoring ?? this.scoring,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    session,
    shotCount,
    sessionTimer,
    isRunning,
    isConnected,
    isLoadoutSelected,
    isDrillSelected,
    isWifiConnected,
    isBleConnected,
    currentPage,
    completedSteps,
    selectedLoadout,
    selectedDrill,
    wifiNetworks,
    connectedWifiId,
    selectedWifiDevice,
    selectedBleDevice,
    bluetoothDevices,
    connectedBleId,
    timerType,
    startSignal,
    scoring,
    error,
  ];
}
