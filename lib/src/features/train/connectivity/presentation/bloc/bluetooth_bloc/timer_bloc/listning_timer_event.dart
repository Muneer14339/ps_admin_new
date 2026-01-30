part of 'listning_timer_bloc.dart';

@freezed
class ListningTimerEvent with _$ListningTimerEvent {
  const factory ListningTimerEvent.startTimer() = StartTimerEvent;
  const factory ListningTimerEvent.stopTimer() = StopTimerEvent;
  const factory ListningTimerEvent.updateTimer() = UpdateTimerEvent; // New event
  const factory ListningTimerEvent.onShotDetectedEvent(bool isMissingShot) = OnShotDetectedEvent; // New event

  // const factory ListningTimerEvent.startSession(DateTime startTime) = StartSession;

}
