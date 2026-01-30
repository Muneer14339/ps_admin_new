part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = AuthEventLogin;

  const factory AuthEvent.signup({
    required String username,
    required String email,
    required String password,
    String? location,
  }) = AuthEventSignup;

  const factory AuthEvent.googleSignIn() = AuthEventGoogleSignIn;

  const factory AuthEvent.verifyEmail({
    required String token,
  }) = AuthEventVerifyEmail;

  const factory AuthEvent.resendOtp({
    required String email,
  }) = AuthEventResendOtp;

  const factory AuthEvent.sendPasswordReset({
    required String email,
  }) = AuthEventSendPasswordReset;

  const factory AuthEvent.verifyResetToken({
    required String token,
  }) = AuthEventVerifyResetToken;

  const factory AuthEvent.resetPassword({
    required String email,
    required String newPassword,
    required String passwordConfirmation,
  }) = AuthEventResetPassword;

  const factory AuthEvent.logout() = AuthEventLogout;

  const factory AuthEvent.checkLoginStatus() = AuthEventCheckLoginStatus;
}
