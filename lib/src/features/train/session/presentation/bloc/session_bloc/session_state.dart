part of 'session_bloc.dart';

sealed class SessionState extends Equatable {}

final class SessionInitial extends SessionState {
  @override
  List<Object?> get props => [];
}

final class ShootState extends SessionState {
  final SessionModel sessionModel;
  ShootState(this.sessionModel);

  @override
  List<Object?> get props => [sessionModel];
}

final class CountDownState extends SessionState {
  final SessionModel sessionModel;
  CountDownState(this.sessionModel);
  @override
  List<Object?> get props => [sessionModel];
}

// class CheckboxState {
//   final bool isMainSelected;
//   final List<bool> itemsSelected;

//   CheckboxState({required this.isMainSelected, required this.itemsSelected});

//   CheckboxState copyWith({bool? isMainSelected, List<bool>? itemsSelected}) {
//     return CheckboxState(
//       isMainSelected: isMainSelected ?? this.isMainSelected,
//       itemsSelected: itemsSelected ?? this.itemsSelected,
//     );
//   }

//   int get selectedCount => itemsSelected.where((selected) => selected).length;
// }
