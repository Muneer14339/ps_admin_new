part of 'tab_bloc.dart';

@freezed
// class TabState with _$TabState {
//   const factory TabState.initial() = _Initial;
// }

class TabState with _$TabState {
  const factory TabState.initial({
    required int index,
    required Widget screen,
  }) = _Initial;
}
