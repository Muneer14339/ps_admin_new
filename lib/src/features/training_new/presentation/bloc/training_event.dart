import 'package:equatable/equatable.dart';

import '../../../../core/enum/session_enum.dart';
import '../../../train/stage/features/drill/data/model/drills_entity.dart';
import '../../data/models/session_model.dart';
import '../../data/models/wifi_device_model.dart';

// Base event class
abstract class TrainingEvent extends Equatable {
  const TrainingEvent();

  @override
  List<Object?> get props => [];
}

// Session navigation events
class NavigateToEvent extends TrainingEvent {
  final SessionPage page;
  final String route;

  const NavigateToEvent(this.page, this.route);

  @override
  List<Object?> get props => [page, route];
}

class CompleteStepEvent extends TrainingEvent {
  final SessionPage page;

  const CompleteStepEvent(this.page);

  @override
  List<Object?> get props => [page];
}

class GoToNextStepEvent extends TrainingEvent {}

// Connection events
class ToggleWifiConnectionEvent extends TrainingEvent {
  final WifiDeviceModel device;

  const ToggleWifiConnectionEvent(this.device);

  @override
  List<Object?> get props => [device];
}

class SaveAlertPreferencesEvent extends TrainingEvent {
  final List<bool> audioPreferences;
  final List<bool> safetyPreferences;

  const SaveAlertPreferencesEvent({
    required this.audioPreferences,
    required this.safetyPreferences,
  });

  @override
  List<Object?> get props => [audioPreferences, safetyPreferences];
}

class ToggleBleConnectionEvent extends TrainingEvent {
  final WifiDeviceModel device;

  const ToggleBleConnectionEvent(this.device);

  @override
  List<Object?> get props => [device];
}

// Selection events
class SelectLoadoutEvent extends TrainingEvent {
  final LoadoutModel loadout;

  const SelectLoadoutEvent(this.loadout);

  @override
  List<Object?> get props => [loadout];
}

class SelectDrillEvent extends TrainingEvent {
  final DrillsModel drill;

  const SelectDrillEvent(this.drill);

  @override
  List<Object?> get props => [drill];
}

class SelectRangeEvent extends TrainingEvent {
  final String range;

  const SelectRangeEvent(this.range);

  @override
  List<Object?> get props => [range];
}
class SelectCadenceValuesEvent extends TrainingEvent {
  final int cadenceValues;

  const SelectCadenceValuesEvent(this.cadenceValues);

  @override
  List<Object?> get props => [cadenceValues];
}
class SelectIsCadOrRegularEvent extends TrainingEvent {
  final int isCadOrRegular;

  const SelectIsCadOrRegularEvent(this.isCadOrRegular);

  @override
  List<Object?> get props => [isCadOrRegular];
}

// Session control events
class StartSessionEvent extends TrainingEvent {}

class RecordShotEvent extends TrainingEvent {}

class PauseResumeEvent extends TrainingEvent {}

class EndSessionEvent extends TrainingEvent {}

// Drill configuration events
class SetTimerTypeEvent extends TrainingEvent {
  final String timerType;

  const SetTimerTypeEvent(this.timerType);

  @override
  List<Object?> get props => [timerType];
}

class SetStartSignalEvent extends TrainingEvent {
  final String startSignal;

  const SetStartSignalEvent(this.startSignal);

  @override
  List<Object?> get props => [startSignal];
}

class SetScoringEvent extends TrainingEvent {
  final String scoring;

  const SetScoringEvent(this.scoring);

  @override
  List<Object?> get props => [scoring];
}

class SaveDrillEvent extends TrainingEvent {}

class ResetLoadout extends TrainingEvent {
  const ResetLoadout();
}