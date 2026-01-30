import 'dart:convert';

import '../../../stage/data/model/stage_entity.dart';

SaveSessionModel saveSessionModelFromJson(String str) =>
    SaveSessionModel.fromJson(json.decode(str));

String saveSessionModelToJson(SaveSessionModel data) =>
    json.encode(data.toJson());

class SaveSessionModel {
  int? playedShots;
  int? missingShots;
  int? sessionId;
  String? userId;
  String? dateTime;
  List<SaveShootModel>? shotsList;
  SessionSaveStageEntity? saveStageEntity;
  String? loadoutId;
  String? firearmId;
  String? ammunitionId;

  SaveSessionModel({
    this.userId,
    this.dateTime,
    this.playedShots,
    this.missingShots,
    this.sessionId,
    this.shotsList,
    this.saveStageEntity,
    this.loadoutId,
    this.firearmId,
    this.ammunitionId,
  });

  SaveSessionModel copyWith({
    int? playedShots,
    int? missingShots,
    int? sessionId,
    String? userId,
    String? dateTime,
    List<SaveShootModel>? shotsList,
    SessionSaveStageEntity? stageEntity,
    String? loadoutId,
    String? firearmId,
    String? ammunitionId,
  }) =>
      SaveSessionModel(
        playedShots: playedShots ?? this.playedShots,
        missingShots: missingShots ?? this.missingShots,
        sessionId: sessionId ?? this.sessionId,
        userId: userId ?? this.userId,
        dateTime: dateTime ?? this.dateTime,
        shotsList: shotsList ?? this.shotsList,
        saveStageEntity: stageEntity ?? this.saveStageEntity,
        loadoutId: loadoutId ?? this.loadoutId,
        firearmId: firearmId ?? this.firearmId,
        ammunitionId: ammunitionId ?? this.ammunitionId,
      );

  factory SaveSessionModel.fromJson(Map<String, dynamic> json) =>
      SaveSessionModel(
        playedShots: json["played_shots"],
        missingShots: json["missing_shots"],
        sessionId: json["session_id"],
        userId: json["user_id"],
        dateTime: json["date_time"],
        shotsList: json["shots_list"] == null
            ? []
            : List<SaveShootModel>.from(
                json["shots_list"]!.map((x) => SaveShootModel.fromJson(x))),
        saveStageEntity: json["stage_entity"] == null
            ? null
            : SessionSaveStageEntity.fromJson(json["stage_entity"]),
        loadoutId: json["loadout_id"],
        firearmId: json["firearm_id"],
        ammunitionId: json["ammunition_id"],
      );

  Map<String, dynamic> toJson() => {
        "played_shots": playedShots,
        "missing_shots": missingShots,
        "session_id": sessionId,
        "user_id": userId,
        "date_time": dateTime,
        "shots_list": shotsList == null
            ? []
            : List<dynamic>.from(shotsList!.map((x) => x.toJson())),
        "stage_entity": saveStageEntity?.toJson(),
        "loadout_id": loadoutId,
        "firearm_id": firearmId,
        "ammunition_id": ammunitionId,
      };
}

// - - - - - - - - - - - - - - - - - - - - - - - - - -- ShootModel

class SaveShootModel {
  int? shootNumber;
  int? shootScore;
  int? splitTime;
  String? shootImagePath;
  String? shotDirection;

  SaveShootModel({
    this.shootNumber,
    this.shootScore,
    this.splitTime,
    this.shootImagePath,
    this.shotDirection,
  });

  // int? _parseSplitTimeToSeconds(String? time) {
  //   if (time == null) return null;
  //   List<String> parts = time.split(':').reversed.toList();
  //   int centiseconds = int.parse(parts[0]);
  //   int seconds = parts.length > 1 ? int.parse(parts[1]) : 0;
  //   seconds += centiseconds ~/ 100;
  //   centiseconds = centiseconds % 100;
  //   int totalCentiseconds = (seconds * 100) + centiseconds;
  //   return totalCentiseconds;
  // }

  SaveShootModel copyWith({
    int? shootNumber,
    int? shootScore,
    String? shootImagePath,
    int? splitTime,
    String? shotDirection,
  }) {
    return SaveShootModel(
      shootNumber: shootNumber ?? this.shootNumber,
      shootScore: shootScore ?? this.shootScore,
      splitTime: splitTime ?? this.splitTime,
      shootImagePath: shootImagePath ?? this.shootImagePath,
      shotDirection: shotDirection ?? this.shotDirection,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shootNumber': shootNumber,
      'shootScore': shootScore,
      'splitTime': splitTime,
      'shootImagePath': shootImagePath,
      'shotDirection': shotDirection,
    };
  }

  factory SaveShootModel.fromJson(Map<String, dynamic> json) {
    return SaveShootModel(
      shootNumber: json['shootNumber'] as int?,
      shootScore: json['shootScore'] as int?,
      splitTime: json['splitTime'],
      shootImagePath: json['shootImagePath'] as String?,
      shotDirection: json['shotDirection'] as String?,
    );
  }
}
