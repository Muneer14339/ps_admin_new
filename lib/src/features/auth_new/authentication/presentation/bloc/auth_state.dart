part of 'auth_bloc.dart';

enum LoadingType {
  login,
  signup,
  googleSignIn,
  verifyEmail,
  resendOtp,
  sendPasswordReset,
  verifyResetToken,
  resetPassword,
  logout,
  checkStatus,
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading(LoadingType type) = _Loading;

  const factory AuthState.authenticated(User user) = _Authenticated;

  const factory AuthState.unauthenticated() = _Unauthenticated;

  const factory AuthState.signupSuccess(User user) = _SignupSuccess;

  const factory AuthState.emailVerified(String message) = _EmailVerified;

  const factory AuthState.otpResent(String message) = _OtpResent;

  const factory AuthState.passwordResetSent(String message) = _PasswordResetSent;

  const factory AuthState.resetTokenVerified(String message) = _ResetTokenVerified;

  const factory AuthState.passwordReset(String message) = _PasswordReset;

  const factory AuthState.error(String message, {@Default(false) bool isNetworkError}) = _Error;
}
