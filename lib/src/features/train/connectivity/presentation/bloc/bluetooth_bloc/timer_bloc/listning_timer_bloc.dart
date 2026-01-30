import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../session/presentation/component/frams_streaming/native_opencv.dart';

part 'listning_timer_event.dart';

part 'listning_timer_state.dart';

part 'listning_timer_bloc.freezed.dart';

@injectable
class ListningTimerBloc extends Bloc<ListningTimerEvent, ListningTimerState> {
  Timer? timer;
  bool isBleActiveBloc = false;
  bool isBlePlay = true;
  ListningTimerBloc() : super(const TimerInitial()) {
    on<StartTimerEvent>(_onStartTimer);
    on<StopTimerEvent>(_onStopTimer);
    on<UpdateTimerEvent>(_onUpdateTimer); // Handle the update timer event
    on<OnShotDetectedEvent>(_onShotDetectedEvent);
    // on<StartSession>(_onStartSession);
  }

  // Future<void> _onStartTimer(
  //     StartTimerEvent event, Emitter<ListningTimerState> emit) async {
  //   // add(StopTimerEvent());
  //   emit(const TimerRunning(1000)); // Start with 5 seconds
  //   isBleActive();
  //   timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
  //     add(const UpdateTimerEvent()); // Dispatch the update timer event
  //   });
  // }
  // Future<void> _onUpdateTimer(
  //     UpdateTimerEvent event, Emitter<ListningTimerState> emit) async {
  //   final currentState = state;
  //   if (currentState is TimerRunning) {
  //     print("_onUpdateTimer+++++0");
  //
  //     if (currentState.secondsLeft == 0) {
  //       print("_onUpdateTimer+++++2");
  //       timer?.cancel();
  //       // emit(const TimerCompleted());
  //       emit(const TimerInitial());
  //     } else {
  //       print("_onUpdateTimer+++++1");
  //       emit(TimerRunning(currentState.secondsLeft - 100));
  //     }
  //   }
  // }



  static const int _totalMs = 900;
  static const int _tickMs  = 100;

  int _gen = 0; // increments each start to cancel stale timers

  void _log(String m) => print(m);

  Future<void> _onStartTimer(
      StartTimerEvent event,
      Emitter<ListningTimerState> emit,
      )
  async {
    _gen++;
    final myGen = _gen;

    final wasActive = timer?.isActive ?? false;
    timer?.cancel();
    timer = null;

    emit(TimerRunning(_totalMs));
    // _log('START gen=$myGen (prevActive=$wasActive) -> EMIT TimerRunning($_totalMs)');

    try {
      isBleActiveBloc = true;
      isBleActive();
    } catch (e, st) {
      _log('BLE error: $e\n$st');
    }

    timer = Timer.periodic(const Duration(milliseconds: _tickMs), (t) {
      if (myGen != _gen) {
        // _log('TICK gen=$myGen -> CANCEL (superseded by gen=$_gen)');
        t.cancel();
        return;
      }

      // ❌ Removed strict `state is! TimerRunning` cancel
      // so timer continues even if another state is emitted
      add(const UpdateTimerEvent());
    });

    // _log('TIMER created gen=$myGen hash=${timer.hashCode}');
  }

  Future<void> _onUpdateTimer(
      UpdateTimerEvent event,
      Emitter<ListningTimerState> emit,
      )
  async {
    int current = _totalMs;

    if (state is TimerRunning) {
      current = (state as TimerRunning).secondsLeft;
    }

    final next = current - _tickMs;
    final clamped = next <= 0 ? 0 : next;

    if (clamped == 0) {
      timer?.cancel();
      // _log('EMIT TimerRunning(0) then COMPLETE; timer canceled hash=${timer?.hashCode}');
      emit(const TimerRunning(0));
      add(StopTimerEvent());
      // _log('EMIT -> TimerCompleted');
    } else {
      emit(TimerRunning(clamped));
      // _log('EMIT -> TimerRunning($clamped)');
    }
  }




  Future<void> _onStopTimer(
      StopTimerEvent event, Emitter<ListningTimerState> emit) async {
    if (timer != null) {
      timer?.cancel();
    } else {
    }
    emit(const TimerInitial());

  }

  Future<void> _onShotDetectedEvent(
      OnShotDetectedEvent event, Emitter<ListningTimerState> emit) async {
    // timer?.cancel();
    // print("_onShotDetectedEvent+++++$state");
    //
    // // if (state is OnShotDetected) {
    //   print("_onShotDetectedEvent+++++2");
    //
    //   // final currentState = state as OnShotDetected;
    //   final currentTime = DateTime.now();
    //   // final difference =
    //   //     currentTime.difference(currentState.previousTime).inMilliseconds / 1000.0;
    //   // print("_onShotDetectedEvent+++++$difference");
    //
    //   emit(ListningTimerState.onShotDetected(
    //     sessionStartTime: currentTime,
    //     previousTime: currentTime,
    //     lastDifference: 0.8,
    //   ));
    // // }
    if (!event.isMissingShot) {
      // print("isMissingShot=:${event.isMissingShot}");
      isBleActiveBloc = false;

      isBleStop();
      add(StopTimerEvent());

    }
    emit(OnShotDetected(event.isMissingShot));
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
