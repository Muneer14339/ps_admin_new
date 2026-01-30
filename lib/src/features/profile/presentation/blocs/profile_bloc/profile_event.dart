part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class ProfilePictureChangeEvent extends ProfileEvent {
  final File imageFile;
  ProfilePictureChangeEvent({required this.imageFile});
}

class DropDownChangedEventGen<T> extends ProfileEvent {
  final int id;
  final T selectedVal;

  DropDownChangedEventGen({required this.id, required this.selectedVal});
}

final class ExpansionChangeEvent extends ProfileEvent {
  final bool isExpanded;
  ExpansionChangeEvent({required this.isExpanded});
}

final class RegionChangeEvent extends ProfileEvent {
  final String region;

  RegionChangeEvent({required this.region});
}

final class DateFormatChangeEvent extends ProfileEvent {
  final String dateFormat;

  DateFormatChangeEvent({required this.dateFormat});
}

final class TimeFormatChangeEvent extends ProfileEvent {
  final String time;
  TimeFormatChangeEvent({required this.time});
}

//---------------------------

final class DistanceChangeEvent extends ProfileEvent {
  final String distance;
  DistanceChangeEvent({required this.distance});
}

final class SwitchChangedEventGen<T> extends ProfileEvent {
  final int id;
  final T selectedVal;

  SwitchChangedEventGen({required this.id, required this.selectedVal});
}
//---------------------------

final class BackupFrequencyChangeEvent extends ProfileEvent {
  final String freqyency;
  BackupFrequencyChangeEvent({required this.freqyency});
}

//---------------------------

final class IsBackUpLoadingEvent extends ProfileEvent {
  final bool isBackUpLoading;
  IsBackUpLoadingEvent({required this.isBackUpLoading});
}

final class CancelBackUpLoadingEvent extends ProfileEvent {}

//---------------------------

final class RestoreBackupEvent extends ProfileEvent {
  final bool isRestored;
  final bool isRestoring;

  RestoreBackupEvent({required this.isRestored, required this.isRestoring});
}

//---------------------------

final class DeleteUserEvent extends ProfileEvent {}

//---------------------------
/*





final class ChangePassEvent extends ProfileEvent {
  final String oldPass;
  final String newPass;
  ChangePassEvent({required this.oldPass, required this.newPass});
}

//---------------------------

final class UserProfileEvent extends ProfileEvent {
  final String userId;
  UserProfileEvent({required this.userId});
}

//---------------------------

final class UpdateProfileEvent extends ProfileEvent {
  final User user;
  UpdateProfileEvent({required this.user});
}

*/
