part of 'listning_timer_bloc.dart';


@freezed
class ListningTimerState with _$ListningTimerState {

  const factory ListningTimerState.initial() = TimerInitial;

  const factory ListningTimerState.onShotDetected(bool isOk) = OnShotDetected;

  const factory ListningTimerState.running(int secondsLeft) = TimerRunning;

}
