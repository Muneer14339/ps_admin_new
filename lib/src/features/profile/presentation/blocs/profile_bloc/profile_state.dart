part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfilePictureChangeState extends ProfileState {
  final File imageFile;
  ProfilePictureChangeState({required this.imageFile});
}

final class DropdownChangedStateGen<T> extends ProfileState {
  final int id;
  final T selectedVal;

  DropdownChangedStateGen({required this.id, required this.selectedVal});
}

final class ExpansionChangeState extends ProfileState {
  final bool isExpanded;

  ExpansionChangeState({required this.isExpanded});
}

final class RegionChangeState extends ProfileState {
  final String regoin;

  RegionChangeState({required this.regoin});
}

final class DateFormatChangeState extends ProfileState {
  final String date;

  DateFormatChangeState({required this.date});
}

final class TimeFormatChangeState extends ProfileState {
  final String time;

  TimeFormatChangeState({required this.time});
}

final class DistanceChangeState extends ProfileState {
  final String distance;

  DistanceChangeState({required this.distance});
}

final class SwitchChangedStateGen<T> extends ProfileState {
  final int id;
  final T selectedVal;

  SwitchChangedStateGen({required this.id, required this.selectedVal});
}

final class BackupFrequencyChangeState extends ProfileState {
  final String frequency;

  BackupFrequencyChangeState({required this.frequency});
}

final class IsBackupLoadingState extends ProfileState {
  final bool isBackupLoading;
  final bool isCancelled;
  IsBackupLoadingState(
      {required this.isBackupLoading, required this.isCancelled});
}

final class RestoreBackUpState extends ProfileState {
  final bool isRestoring;
  final bool isRestored;
  RestoreBackUpState({required this.isRestored, required this.isRestoring});
}

//----------------------------------------------------- Delete User

final class DeleteUserLoading extends ProfileState {}

final class DeleteUserSuccess extends ProfileState {
  final Map<String, dynamic> response;
  DeleteUserSuccess(this.response);
}

final class DeleteUserError extends ProfileState {
  final String error;
  DeleteUserError(this.error);
}


/*
//----------------------------------------------------- passwordChange

final class ChangePassLoading extends ProfileState {}

final class ChangePassSuccess extends ProfileState {
  final Map<String, dynamic> response;
  ChangePassSuccess(this.response);
}

final class ChangePassError extends ProfileState {
  final String error;
  ChangePassError(this.error);
}

//----------------------------------------------------- userProfileGet

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final User user;
  ProfileSuccess(this.user);
}

final class ProfileError extends ProfileState {
  final String error;
  ProfileError(this.error);
}

//----------------------------------------------------- userProfileGet

final class UpdateProfileLoading extends ProfileState {}

final class UpdateProfileSuccess extends ProfileState {
  final User response;
  UpdateProfileSuccess(this.response);
}

final class UpdateProfileError extends ProfileState {
  final String error;
  UpdateProfileError(this.error);
}
 */
