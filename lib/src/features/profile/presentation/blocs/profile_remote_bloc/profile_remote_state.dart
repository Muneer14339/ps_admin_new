// part of 'profile_remote_bloc.dart';
//
// sealed class ProfileRemoteState {}
//
// final class ProfileRemoteInitial extends ProfileRemoteState {}
//
// //----------------------------------------------------- passwordChange
//
// final class ChangePassLoading extends ProfileRemoteState {}
//
// final class ChangePassSuccess extends ProfileRemoteState {
//   final Map<String, dynamic> response;
//   ChangePassSuccess(this.response);
// }
//
// final class ChangePassError extends ProfileRemoteState {
//   final String error;
//   ChangePassError(this.error);
// }
//
// //----------------------------------------------------- userProfileGet
//
// final class ProfileLoading extends ProfileRemoteState {}
//
// final class ProfileSuccess extends ProfileRemoteState {
//   final User user;
//   ProfileSuccess(this.user);
// }
//
// final class ProfileError extends ProfileRemoteState {
//   final String error;
//   ProfileError(this.error);
// }
//
// //----------------------------------------------------- userProfileGet
//
// final class UpdateProfileLoading extends ProfileRemoteState {}
//
// final class UpdateProfileSuccess extends ProfileRemoteState {
//   final User response;
//   UpdateProfileSuccess(this.response);
// }
//
// final class UpdateProfileError extends ProfileRemoteState {
//   final String error;
//   UpdateProfileError(this.error);
// }
