import 'dart:async';
import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/data/model/drills_entity.dart';
import 'package:pa_sreens/src/features/train/session/data/model/session_model.dart';
import 'package:torch_light/torch_light.dart';

class StopwatchApp extends StatefulWidget {
  const StopwatchApp({
    required this.startNow,
    required this.callBackCallback,
    required this.beepStopedCallback,
    required this.callBackContinuous,
    required this.sessionModel,
    this.isCountdown,
    this.countDownTime,
    super.key, required this.child,
  });

  final bool startNow;
  final void Function(String) callBackCallback;
  final void Function(String) beepStopedCallback;
  final void Function(String) callBackContinuous;
  final Widget child;
  final bool? isCountdown;
  final String? countDownTime;
  final SessionModel sessionModel;

  @override
  State<StopwatchApp> createState() => _StopwatchAppState();
}

class _StopwatchAppState extends State<StopwatchApp> {
  @override
  Widget build(BuildContext context) {
    if (widget.startNow && !onceBeeped && !_isRunning) {
      _startStopwatch();
    } else if (!widget.startNow) {
      _pauseStopwatch();
    }

    if (_milliseconds == 0 && isBackgroundCalled) {
      isBackgroundCalled = false;
      widget.callBackContinuous('$_milliseconds');
    }

    if (!widget.isCountdown!) {
      // log('1 !widget.isCountdown! ${widget.sessionModel.stageEntity?.distance}');
      if (parTimeCount < (drillsEntity.parTimeList?.length ?? 0)) {
        // log('1 !widget.isCountdown!');
        int targetParTime =
            (drillsEntity.parTimeList?[parTimeCount] ?? 0) + _previousPerTime;

        if (_milliseconds >= targetParTime - tolerance &&
            _milliseconds <= targetParTime + tolerance) {
          // log('2 !widget.isCountdown!');
          if (drillsEntity.isMute == 1) {
            _startBlinking();
          } else {
            playParTimeBeep();
          }
          if (drillsEntity.partTimeType == 'for-each') {
            // log('3 !widget.isCountdown!');
            _previousPerTime += drillsEntity.parTimeList?[parTimeCount] ?? 0;
            parTimeCount++;
          } else {
            // log('${drillsEntity.parTimeList?[parTimeCount]} partTimeType ------ ${drillsEntity.partTimeType}');
          }
        } else {
          // log('Reached par time - Waiting for par time: $targetParTime +/- $tolerance');
        }
      }
    }
    else {
      // log(' - - - - - - -- !widget.isCountdown!');
      if (parTimeCount < drillsEntity.parTimeList!.length) {
        if (isPartTimeCounted) {
          targetParTime =
              _milliseconds - ((drillsEntity.parTimeList?[parTimeCount] ?? 0));
          log('- - - - - - - - --- - - - - - - -- - ----- - - - - - - -  $targetParTime ');
          isPartTimeCounted = false;
        }

        if (_milliseconds >= targetParTime - tolerance &&
            _milliseconds <= targetParTime + tolerance) {
          log('$_milliseconds  - - - - - - - - --- - - - - - - -- - ----- - - - - - - -  $targetParTime +/- $tolerance');
          if (drillsEntity.isMute == 1) {
            _startBlinking();
          } else {
            playParTimeBeep();
          }
          if (drillsEntity.partTimeType == 'for-each') {
            isPartTimeCounted = true;
            _previousPerTime += drillsEntity.parTimeList?[parTimeCount] ?? 0;
            parTimeCount++;
          }
        } else {
          // log('$_milliseconds Countdown - Waiting for par time: $targetParTime +/- $tolerance');
        }
      }
    }
    return widget.child;
    // return Text(
    //   _formattedTime,
    //   style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
    // );
  }

  Future<void> playBeep() async {
    if (onceBeeped) {
      final AudioPlayer audioPlayer = AudioPlayer();
      await audioPlayer.play(AssetSource(
          widget.sessionModel.stageEntity?.mode?.id == 6
              ? 'audio/iphon.mp3'
              : 'audio/sharp_beep_1s_1.mp3'));
      audioPlayer.onPlayerComplete.listen(
        (event) {
          onceBeeped = false;
          setState(() {});
          widget.beepStopedCallback('');
          log('in play beep method');
        },
      );
    }
  }

  Future<void> playParTimeBeep() async {
    final AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play(AssetSource('audio/sharp_beep_1s_1.mp3'));
  }

  void _startBlinking() async {
    // setState(() {
    //   _isBlinking = true;
    // });

    // while (_isBlinking) {
    // await Future.delayed(const Duration(milliseconds: 500));
    await TorchLight.enableTorch();
    await Future.delayed(const Duration(milliseconds: 500));
    await TorchLight.disableTorch();
    // }
  }

  int targetParTime = 0;
  int tolerance = 10;
  Timer? _timer;
  int _milliseconds = 0;
  bool _isRunning = false;
  bool isPartTimeCounted = true;
  int _lastSplitTime = 0;
  int _previousPerTime = 0;
  bool isBackgroundCalled = true;
  bool onceBeeped = true;
  int parTimeCount = 0;
  DrillsEntity drillsEntity = DrillsEntity();

  @override
  void initState() {
    super.initState();

    if (widget.isCountdown == true && widget.countDownTime != null) {
      _milliseconds = _parseCountdownTime(widget.countDownTime!);
      _lastSplitTime = _milliseconds;
    } else {
      _milliseconds = 0;
      _lastSplitTime = 0;
    }
    drillsEntity =
        widget.sessionModel.stageEntity?.drill?.drill ?? DrillsEntity();
    if (widget.sessionModel.playBeep == true) {
      playBeep();
    }
  }

  int _parseCountdownTime(String time) {
    final miliSeconds = int.parse(time)*1000;
    return miliSeconds ;
  }

  // String get _formattedTime {
  //   final int seconds = _milliseconds ~/ 1000;
  //   final int hundredths = (_milliseconds % 1000) ~/ 10;
  //   return "${_twoDigits(seconds)}:${_twoDigits(hundredths)}";
  // }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  void _startStopwatch() {
    if (_isRunning) return;
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        if (widget.isCountdown == true) {
          if (_milliseconds > 0) {
            _milliseconds -= 10;
          } else {
            _timer?.cancel();
            _isRunning = false;
            _milliseconds = 0;
          }
        } else {
          _milliseconds += 10;
        }
      });
    });
    setState(() {
      _isRunning = true;
    });
  }

  void _pauseStopwatch() {
    if (!_isRunning) return;
    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  // void _resetStopwatch() {
  //   _timer?.cancel();
  //   setState(() {
  //     _milliseconds = widget.isCountdown == true && widget.countDownTime != null
  //         ? _parseCountdownTime(widget.countDownTime!)
  //         : 0;
  //     _lastSplitTime = _milliseconds;
  //     _isRunning = false;
  //   });
  // }

  void _recordSplitIfShotNoChanged() {
      final int splitTime = widget.isCountdown == true
          ? _lastSplitTime - _milliseconds
          : _milliseconds - _lastSplitTime;

      if (splitTime > 0) {
        double timeInSeconds = splitTime / 1000.0;
        final String seconds = timeInSeconds.toStringAsFixed(3);
        // final int seconds = splitTime ~/ 1000;
        // final int hundredths = (splitTime % 1000) ~/ 10;
        widget.callBackCallback(
            // "${_twoDigits(seconds)}.${_twoDigits(hundredths)}");
            seconds);
        _lastSplitTime = _milliseconds;
      }

  }

  @override
  void didUpdateWidget(covariant StopwatchApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    _recordSplitIfShotNoChanged();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
