part of 'drill_bloc.dart';

@immutable
sealed class DrillEvent {}

class DrillsLoadEvent extends DrillEvent {
  final List<DrillsEntity> listDrills;

  DrillsLoadEvent({required this.listDrills});
}

class DrillsDeleteEvent extends DrillEvent {
  final List<DrillsEntity> listDrills;

  DrillsDeleteEvent({required this.listDrills});
}
