class LoadoutModel {
  final String name;
  final String details;

  LoadoutModel({
    required this.name,
    required this.details,
  });
}

class DrillModel {
  final String name;
  final String details;
  final bool isOpen;

  DrillModel({
    required this.name,
    required this.details,
    this.isOpen = false,
  });
}

/// Represents a single training session configuration
class SessionModel {
  // 🧱 Basic info
  String? sessionName;

  // 🏹 Range and Drill setup
  String? rangeName;
  LoadoutModel? loadout;
  DrillModel? drill;

  // 🔊 Audio feedback toggle
  bool audioEnabled;

  // 🎯 Training parameters
  int? distance;
  int? expectedRounds;

  // 🗒️ User notes
  String? notes;


  String? connectionType;
  bool isConnected = false;

  SessionModel({
    this.sessionName,
    this.rangeName,
    this.loadout,
    this.drill,
    this.audioEnabled = true,
    this.distance,
    this.expectedRounds,
    this.notes,
    this.connectionType,
    this.isConnected = false,
  });

  /// 🔁 Copy method for updating values immutably (optional but useful)
  SessionModel copyWith({
    String? sessionName,
    String? rangeName,
    LoadoutModel? loadout,
    DrillModel? drill,
    bool? audioEnabled,
    int? distance,
    int? expectedRounds,
    String? notes,
    String? connectionType,
    bool? isConnected,
  }) {
    return SessionModel(
      sessionName: sessionName ?? this.sessionName,
      rangeName: rangeName ?? this.rangeName,
      loadout: loadout ?? this.loadout,
      drill: drill ?? this.drill,
      audioEnabled: audioEnabled ?? this.audioEnabled,
      distance: distance ?? this.distance,
      expectedRounds: expectedRounds ?? this.expectedRounds,
      notes: notes ?? this.notes,
      connectionType: connectionType ?? this.connectionType,
      isConnected: isConnected ?? this.isConnected,
    );
  }
}
