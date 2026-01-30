// import 'dart:developer';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';

class SessionModel {
  int? playedShoots;
  int? missingShots;
  int? totalScores;
  double? totalTime;

  double? highestSplitTime;
  double? lowestSplitTime;
  String? lowestSplitTimeString;
  double? averageSplitTime;
  double? averageScore;
  int? highestScore;
  int? lowestScore;

  int? sessionId;
  int? numberOfShots;
  int? sessionCountDown;
  int? cadenceValues;
  int? isCadOrOpen;
  bool? isSessionStart;
  bool? playBeep;
  bool? makeScoreVisible;
  bool? showSliderImages;
  bool? isSessionPaused;
  bool? isSessionAuto;
  ShootModel? shootModel;
  List<ShootModel>? listShots;
  StageEntity? stageEntity;

  SessionModel({
    this.playedShoots,
    this.missingShots,
    this.totalScores,
    this.totalTime,
    this.numberOfShots,
    this.sessionId,
    this.highestSplitTime,
    this.lowestSplitTime,
    this.lowestSplitTimeString,
    this.averageSplitTime,
    this.averageScore,
    this.highestScore,
    this.lowestScore,
    this.shootModel,
    this.isSessionStart,
    this.playBeep,
    this.makeScoreVisible,
    this.showSliderImages,
    this.isSessionPaused,
    this.isSessionAuto,
    this.listShots,
    this.stageEntity,
    this.sessionCountDown,
    this.cadenceValues,
    this.isCadOrOpen,
  });

  // The copyWith method
  SessionModel copyWith({
    int? playedShoots,
    int? missingShots,
    int? totalScores,
    double? totalTime,
    int? sessionId,
    double? highestSplitTime,
    double? lowestSplitTime,
    String? lowestSplitTimeString,
    double? averageSplitTime,
    double? averageScore,
    int? highestScore,
    int? lowestScore,
    int? numberOfShots,
    int? sessionCountDown,
    int? cadenceValues,
    int? isCadOrOpen,
    bool? isSessionStart,
    bool? makeScoreVisible,
    bool? showSliderImages,
    bool? playBeep,
    bool? isSessionPaused,
    bool? isSessionAuto,
    ShootModel? shootModel,
    List<ShootModel>? listShots,
    StageEntity? stageEntity,
  }) {
    return SessionModel(
      playedShoots: playedShoots ?? this.playedShoots,
      missingShots: missingShots ?? this.missingShots,
      totalScores: totalScores ?? this.totalScores,
      totalTime: totalTime ?? this.totalTime,
      sessionId: sessionId ?? this.sessionId,
      highestSplitTime: highestSplitTime ?? this.highestSplitTime,
      lowestSplitTime: lowestSplitTime ?? this.lowestSplitTime,
      lowestSplitTimeString:
          lowestSplitTimeString ?? this.lowestSplitTimeString,
      averageSplitTime: averageSplitTime ?? this.averageSplitTime,
      averageScore: averageScore ?? this.averageScore,
      highestScore: highestScore ?? this.highestScore,
      lowestScore: lowestScore ?? this.lowestScore,
      numberOfShots: numberOfShots ?? this.numberOfShots,
      shootModel: shootModel ?? this.shootModel,
      isSessionStart: isSessionStart ?? this.isSessionStart,
      playBeep: playBeep ?? this.playBeep,
      makeScoreVisible: makeScoreVisible ?? this.makeScoreVisible,
      showSliderImages: showSliderImages ?? this.showSliderImages,
      isSessionPaused: isSessionPaused ?? this.isSessionPaused,
      isSessionAuto: isSessionAuto ?? this.isSessionAuto,
      listShots: listShots ?? this.listShots,
      sessionCountDown: sessionCountDown ?? this.sessionCountDown,
      cadenceValues: cadenceValues ?? this.cadenceValues,
      isCadOrOpen: isCadOrOpen ?? this.isCadOrOpen,
      stageEntity: stageEntity ?? this.stageEntity,
    );
  }
}

class ShootModel {
  int? shootNumber;
  int? shootScore;
  String? shotDirection;
  String? _splitTime;
  int? splitTimeInt;
  String? shootImagePath;
  int? parTime;

  String? get splitTime => _splitTime;

  set splitTime(String? value) {
    _splitTime = value;
    splitTimeInt = _parseSplitTimeToSeconds(value);
  }

  ShootModel({
    this.shootNumber,
    this.shootScore,
    this.shotDirection,
    String? splitTime,
    this.shootImagePath,
    this.splitTimeInt,
    this.parTime,
  }) {
    this.splitTime = splitTime;
  }

  int? _parseSplitTimeToSeconds(String? time) {
    if (time == null) return null;
    print("_parseSplitTimeToSeconds===$time");
    // List<String> parts = time.split(':').reversed.toList();
    double centiseconds = double.parse(time);
    int milliseconds = (centiseconds * 1000).toInt();

    // int seconds = parts.length > 1 ? int.parse(parts[1]) : 0;
    // seconds += centiseconds ~/ 100;
    // centiseconds = centiseconds % 100;
    // int totalCentiseconds = (seconds * 100) + centiseconds;
    return milliseconds;
  }

  String parseExactTimeString(int? totalCentiseconds) {
    if (totalCentiseconds == null) return '00.00';
    // int seconds = totalCentiseconds ~/ 100;
    // int remainingCentiseconds = totalCentiseconds % 100;
    // String secondsStr = seconds.toString().padLeft(2, '0');
    // String centisecondsStr = remainingCentiseconds.toString().padLeft(2, '0');
    double centisecondsStr = totalCentiseconds/1000;
    return '$centisecondsStr';
  }

  // int? _parseSplitTimeToMilliseconds(String? time) {
  //   if (time == null) return null;
  //   List<String> parts = time.split(':').reversed.toList();
  //   int milliseconds = 0;
  //   for (int i = 0; i < parts.length; i++) {
  //     int parsedPart = int.parse(parts[i]);
  //     milliseconds += parsedPart * (i == 0 ? 1000 : (i == 1 ? 60000 : 3600000));
  //   }
  //   return milliseconds;
  // }

  ShootModel copyWith({
    int? shootNumber,
    int? shootScore,
    String? shotDirection,
    String? splitTime,
    String? shootImagePath,
    int? splitTimeInt,
    int? parTime,
  }) {
    return ShootModel(
      shootNumber: shootNumber ?? this.shootNumber,
      shootScore: shootScore ?? this.shootScore,
      shotDirection: shotDirection ?? this.shotDirection,
      splitTime: splitTime ?? this.splitTime,
      shootImagePath: shootImagePath ?? this.shootImagePath,
      splitTimeInt: splitTimeInt ?? this.splitTimeInt,
      parTime: parTime ?? this.parTime,
    );
  }
}
