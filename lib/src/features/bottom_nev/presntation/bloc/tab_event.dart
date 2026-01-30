part of 'tab_bloc.dart';

@freezed
// class TabEvent with _$TabEvent {
//   const factory TabEvent.started() = _Started;
// }

class TabEvent with _$TabEvent {
  const factory TabEvent.setTab(int index) = _SetTab;
}
