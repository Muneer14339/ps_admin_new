part of 'drill_bloc.dart';

@immutable
sealed class DrillState {}

final class DrillInitial extends DrillState {}

final class DrillLoadState extends DrillState {
  final List<DrillsEntity> listDrills;

  DrillLoadState({required this.listDrills});
}

final class DrillDeleteState extends DrillState {
  final List<DrillsEntity> listDrills;

  DrillDeleteState({required this.listDrills});
}
