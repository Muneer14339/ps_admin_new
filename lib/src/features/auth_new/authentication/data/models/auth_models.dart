import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

// Base user model
@Freezed(toJson: true)
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    @JsonKey(name: 'first_name') required String firstName,
    required String email,
    String? location,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

// Authentication request models
@Freezed(toJson: true)
class SignupRequest with _$SignupRequest {
  const SignupRequest._();

  const factory SignupRequest({
    required String email,
    String? username,
    required String password,
    @JsonKey(name: 'has_default_coach') @Default(true) bool hasDefaultCoach,
  }) = _SignupRequest;

  factory SignupRequest.fromJson(Map<String, dynamic> json) => _$SignupRequestFromJson(json);

  // Helper constructor that extracts username from email
  factory SignupRequest.fromEmail({
    required String email,
    required String password,
    bool hasDefaultCoach = true,
    String? username,
  }) {
    final usernameRequired = email.split('@').first;
    return SignupRequest(
      email: email,
      username: username ?? usernameRequired,
      password: password,
      hasDefaultCoach: hasDefaultCoach,
    );
  }
}

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
}

@freezed
class GoogleSignInRequest with _$GoogleSignInRequest {
  const factory GoogleSignInRequest({
    required String idToken,
    String? accessToken,
  }) = _GoogleSignInRequest;

  factory GoogleSignInRequest.fromJson(Map<String, dynamic> json) => _$GoogleSignInRequestFromJson(json);
}

@freezed
class SignupResponse with _$SignupResponse {
  const factory SignupResponse({
    required String email,
    required String message,
    @JsonKey(name: 'user_id') required String userId,
  }) = _SignupResponse;

  factory SignupResponse.fromJson(Map<String, dynamic> json) => _$SignupResponseFromJson(json);
}

// Authentication response models
@freezed
class ForgotPasswordRequest with _$ForgotPasswordRequest {
  const factory ForgotPasswordRequest({
    required String email,
  }) = _ForgotPasswordRequest;

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) => _$ForgotPasswordRequestFromJson(json);
}

@freezed
class ForgotPasswordResponse with _$ForgotPasswordResponse {
  const factory ForgotPasswordResponse({
    required String email,
    @Default('Password reset code has been sent to your email') String message,
  }) = _ForgotPasswordResponse;

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => _$ForgotPasswordResponseFromJson(json);
}

@freezed
class ResetPasswordResponse with _$ResetPasswordResponse {
  const factory ResetPasswordResponse({
    @Default('Password reset successfully!') String message,
  }) = _ResetPasswordResponse;

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) => _$ResetPasswordResponseFromJson(json);
}

@freezed
class VerifyResetTokenRequest with _$VerifyResetTokenRequest {
  const factory VerifyResetTokenRequest({
    required String token,
  }) = _VerifyResetTokenRequest;

  factory VerifyResetTokenRequest.fromJson(Map<String, dynamic> json) => _$VerifyResetTokenRequestFromJson(json);
}

@freezed
class VerifyResetTokenResponse with _$VerifyResetTokenResponse {
  const factory VerifyResetTokenResponse({
    required String email,
    @Default('Verification code confirmed! You can now reset your password.') String message,
  }) = _VerifyResetTokenResponse;

  factory VerifyResetTokenResponse.fromJson(Map<String, dynamic> json) => _$VerifyResetTokenResponseFromJson(json);
}

@freezed
class VerifyEmailRequest with _$VerifyEmailRequest {
  const factory VerifyEmailRequest({
    required String token,
  }) = _VerifyEmailRequest;

  factory VerifyEmailRequest.fromJson(Map<String, dynamic> json) => _$VerifyEmailRequestFromJson(json);
}

@Freezed(toJson: true)
class VerifyEmailResponse with _$VerifyEmailResponse {
  const factory VerifyEmailResponse({
    @JsonKey(name: 'coach_name') @Default("") String coachName,
    @JsonKey(name: 'has_coach') @Default(false) bool hasCoach,
    @Default("") String email,
    @JsonKey(name: 'first_name') @Default("") String firstName,
    @JsonKey(name: 'is_approved_by_admin') @Default("") String isApprovedByAdmin,
    @JsonKey(name: 'last_name') @Default("") String lastName,
    @Default("") String token,
    @JsonKey(name: 'user_id') @Default("") String userId,
    @JsonKey(name: 'user_type') @Default("") String userType,
  }) = _VerifyEmailResponse;

  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) => _$VerifyEmailResponseFromJson(json);
}

@Freezed(toJson: true)
class AuthResponse with _$AuthResponse {
  const AuthResponse._();

  const factory AuthResponse({
    @Default('') String bio,
    @JsonKey(name: 'certification_type') @Default([]) List<String> certificationType,
    @JsonKey(name: 'certification_uploaded') @Default(false) bool certificationUploaded,
    @JsonKey(name: 'contact_number') String? contactNumber,
    String? country,
    required String email,
    @Default(0) int experience,
    @JsonKey(name: 'first_name') @Default('') String firstName,
    @JsonKey(name: 'is_approved_by_admin') @Default('false') String isApprovedByAdmin,
    @JsonKey(name: 'is_verified_by_coach') @Default(false) bool isVerifiedByCoach,
    @JsonKey(name: 'last_name') @Default('') String lastName,
    @JsonKey(name: 'redirect_url') @Default('') String redirectUrl,
    @Default('') String specialization,
    @Default([]) List<String> specialties,
    required String token,
    @JsonKey(name: 'training_philosophy') String? trainingPhilosophy,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'user_type') @Default('user') String userType,
    @Default('') String username,
    String? website,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

  // Convert to User entity for domain layer
  User get user {
    return User(
      uid: userId,
      email: email,
      firstName: firstName,
      location: country,
      createdAt: DateTime.now(), // Not provided by API
      role: 0,
    );
  }
}

@freezed
class RefreshTokenRequest with _$RefreshTokenRequest {
  const factory RefreshTokenRequest({
    required String refreshToken,
  }) = _RefreshTokenRequest;

  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) => _$RefreshTokenRequestFromJson(json);
}

@freezed
class RefreshTokenResponse with _$RefreshTokenResponse {
  const factory RefreshTokenResponse({
    required String accessToken,
    required String refreshToken,
    DateTime? expiresAt,
  }) = _RefreshTokenResponse;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) => _$RefreshTokenResponseFromJson(json);
}

@freezed
class ResetPasswordRequest with _$ResetPasswordRequest {
  const factory ResetPasswordRequest({
    required String email,
    @JsonKey(name: 'new_password') required String newPassword,
  }) = _ResetPasswordRequest;

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) => _$ResetPasswordRequestFromJson(json);
}

// Generic API response wrapper
@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    @Default(false) bool success,
    T? data,
    String? message,
    List<String>? errors,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    return ApiResponse<T>(
      success: json['success'] as bool? ?? false,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      message: json['message'] as String?,
      errors: (json['errors'] as List<dynamic>?)?.cast<String>(),
    );
  }
}

@freezed
class ResendOtpRequest with _$ResendOtpRequest {
  const factory ResendOtpRequest({
    required String email,
  }) = _ResendOtpRequest;

  factory ResendOtpRequest.fromJson(Map<String, dynamic> json) => _$ResendOtpRequestFromJson(json);
}

@freezed
class ResendOtpResponse with _$ResendOtpResponse {
  const factory ResendOtpResponse({
    required String email,
    required String message,
  }) = _ResendOtpResponse;

  factory ResendOtpResponse.fromJson(Map<String, dynamic> json) => _$ResendOtpResponseFromJson(json);
}
