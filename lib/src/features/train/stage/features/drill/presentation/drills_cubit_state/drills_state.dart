part of 'drills_cubit.dart';

sealed class DrillsState {}

final class DrillsInitial extends DrillsState {}

final class DrillsLoading extends DrillsState {}

final class DrillsLoaded extends DrillsState {
  final List<DrillsModel> drillsEntity;
  DrillsLoaded(this.drillsEntity);
}

final class DrillsError extends DrillsState {
  final String error;
  DrillsError(this.error);
}
