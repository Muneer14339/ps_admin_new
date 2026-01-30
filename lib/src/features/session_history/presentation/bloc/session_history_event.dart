part of 'session_history_bloc.dart';

@freezed
class SessionHistoryEvent with _$SessionHistoryEvent {
  const factory SessionHistoryEvent.getAllSessions() = _GetAllSessions;
}
