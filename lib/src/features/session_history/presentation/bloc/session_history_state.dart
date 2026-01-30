part of 'session_history_bloc.dart';

@freezed
class SessionHistoryState with _$SessionHistoryState {
  const factory SessionHistoryState.initial({
    @Default(false) bool  isLoading,
    @Default([])  List<SaveSessionModel> session,

}) = _Initial;
}
