// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      email: json['email'] as String,
      location: json['location'] as String?,
      createdAt:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
      updatedAt:
          json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'email': instance.email,
      'location': instance.location,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$SignupRequestImpl _$$SignupRequestImplFromJson(Map<String, dynamic> json) =>
    _$SignupRequestImpl(
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      password: json['password'] as String,
      hasDefaultCoach: json['has_default_coach'] as bool? ?? true,
    );

Map<String, dynamic> _$$SignupRequestImplToJson(_$SignupRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'password': instance.password,
      'has_default_coach': instance.hasDefaultCoach,
    };

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

_$GoogleSignInRequestImpl _$$GoogleSignInRequestImplFromJson(
  Map<String, dynamic> json,
) => _$GoogleSignInRequestImpl(
  idToken: json['idToken'] as String,
  accessToken: json['accessToken'] as String?,
);

Map<String, dynamic> _$$GoogleSignInRequestImplToJson(
  _$GoogleSignInRequestImpl instance,
) => <String, dynamic>{
  'idToken': instance.idToken,
  'accessToken': instance.accessToken,
};

_$SignupResponseImpl _$$SignupResponseImplFromJson(Map<String, dynamic> json) =>
    _$SignupResponseImpl(
      email: json['email'] as String,
      message: json['message'] as String,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$$SignupResponseImplToJson(
  _$SignupResponseImpl instance,
) => <String, dynamic>{
  'email': instance.email,
  'message': instance.message,
  'user_id': instance.userId,
};

_$ForgotPasswordRequestImpl _$$ForgotPasswordRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ForgotPasswordRequestImpl(email: json['email'] as String);

Map<String, dynamic> _$$ForgotPasswordRequestImplToJson(
  _$ForgotPasswordRequestImpl instance,
) => <String, dynamic>{'email': instance.email};

_$ForgotPasswordResponseImpl _$$ForgotPasswordResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ForgotPasswordResponseImpl(
  email: json['email'] as String,
  message:
      json['message'] as String? ??
      'Password reset code has been sent to your email',
);

Map<String, dynamic> _$$ForgotPasswordResponseImplToJson(
  _$ForgotPasswordResponseImpl instance,
) => <String, dynamic>{'email': instance.email, 'message': instance.message};

_$ResetPasswordResponseImpl _$$ResetPasswordResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ResetPasswordResponseImpl(
  message: json['message'] as String? ?? 'Password reset successfully!',
);

Map<String, dynamic> _$$ResetPasswordResponseImplToJson(
  _$ResetPasswordResponseImpl instance,
) => <String, dynamic>{'message': instance.message};

_$VerifyResetTokenRequestImpl _$$VerifyResetTokenRequestImplFromJson(
  Map<String, dynamic> json,
) => _$VerifyResetTokenRequestImpl(token: json['token'] as String);

Map<String, dynamic> _$$VerifyResetTokenRequestImplToJson(
  _$VerifyResetTokenRequestImpl instance,
) => <String, dynamic>{'token': instance.token};

_$VerifyResetTokenResponseImpl _$$VerifyResetTokenResponseImplFromJson(
  Map<String, dynamic> json,
) => _$VerifyResetTokenResponseImpl(
  email: json['email'] as String,
  message:
      json['message'] as String? ??
      'Verification code confirmed! You can now reset your password.',
);

Map<String, dynamic> _$$VerifyResetTokenResponseImplToJson(
  _$VerifyResetTokenResponseImpl instance,
) => <String, dynamic>{'email': instance.email, 'message': instance.message};

_$VerifyEmailRequestImpl _$$VerifyEmailRequestImplFromJson(
  Map<String, dynamic> json,
) => _$VerifyEmailRequestImpl(token: json['token'] as String);

Map<String, dynamic> _$$VerifyEmailRequestImplToJson(
  _$VerifyEmailRequestImpl instance,
) => <String, dynamic>{'token': instance.token};

_$VerifyEmailResponseImpl _$$VerifyEmailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$VerifyEmailResponseImpl(
  coachName: json['coach_name'] as String? ?? "",
  hasCoach: json['has_coach'] as bool? ?? false,
  email: json['email'] as String? ?? "",
  firstName: json['first_name'] as String? ?? "",
  isApprovedByAdmin: json['is_approved_by_admin'] as String? ?? "",
  lastName: json['last_name'] as String? ?? "",
  token: json['token'] as String? ?? "",
  userId: json['user_id'] as String? ?? "",
  userType: json['user_type'] as String? ?? "",
);

Map<String, dynamic> _$$VerifyEmailResponseImplToJson(
  _$VerifyEmailResponseImpl instance,
) => <String, dynamic>{
  'coach_name': instance.coachName,
  'has_coach': instance.hasCoach,
  'email': instance.email,
  'first_name': instance.firstName,
  'is_approved_by_admin': instance.isApprovedByAdmin,
  'last_name': instance.lastName,
  'token': instance.token,
  'user_id': instance.userId,
  'user_type': instance.userType,
};

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      bio: json['bio'] as String? ?? '',
      certificationType:
          (json['certification_type'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      certificationUploaded: json['certification_uploaded'] as bool? ?? false,
      contactNumber: json['contact_number'] as String?,
      country: json['country'] as String?,
      email: json['email'] as String,
      experience: (json['experience'] as num?)?.toInt() ?? 0,
      firstName: json['first_name'] as String? ?? '',
      isApprovedByAdmin: json['is_approved_by_admin'] as String? ?? 'false',
      isVerifiedByCoach: json['is_verified_by_coach'] as bool? ?? false,
      lastName: json['last_name'] as String? ?? '',
      redirectUrl: json['redirect_url'] as String? ?? '',
      specialization: json['specialization'] as String? ?? '',
      specialties:
          (json['specialties'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      token: json['token'] as String,
      trainingPhilosophy: json['training_philosophy'] as String?,
      userId: json['user_id'] as String,
      userType: json['user_type'] as String? ?? 'user',
      username: json['username'] as String? ?? '',
      website: json['website'] as String?,
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'certification_type': instance.certificationType,
      'certification_uploaded': instance.certificationUploaded,
      'contact_number': instance.contactNumber,
      'country': instance.country,
      'email': instance.email,
      'experience': instance.experience,
      'first_name': instance.firstName,
      'is_approved_by_admin': instance.isApprovedByAdmin,
      'is_verified_by_coach': instance.isVerifiedByCoach,
      'last_name': instance.lastName,
      'redirect_url': instance.redirectUrl,
      'specialization': instance.specialization,
      'specialties': instance.specialties,
      'token': instance.token,
      'training_philosophy': instance.trainingPhilosophy,
      'user_id': instance.userId,
      'user_type': instance.userType,
      'username': instance.username,
      'website': instance.website,
    };

_$RefreshTokenRequestImpl _$$RefreshTokenRequestImplFromJson(
  Map<String, dynamic> json,
) => _$RefreshTokenRequestImpl(refreshToken: json['refreshToken'] as String);

Map<String, dynamic> _$$RefreshTokenRequestImplToJson(
  _$RefreshTokenRequestImpl instance,
) => <String, dynamic>{'refreshToken': instance.refreshToken};

_$RefreshTokenResponseImpl _$$RefreshTokenResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RefreshTokenResponseImpl(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  expiresAt:
      json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
);

Map<String, dynamic> _$$RefreshTokenResponseImplToJson(
  _$RefreshTokenResponseImpl instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'expiresAt': instance.expiresAt?.toIso8601String(),
};

_$ResetPasswordRequestImpl _$$ResetPasswordRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ResetPasswordRequestImpl(
  email: json['email'] as String,
  newPassword: json['new_password'] as String,
);

Map<String, dynamic> _$$ResetPasswordRequestImplToJson(
  _$ResetPasswordRequestImpl instance,
) => <String, dynamic>{
  'email': instance.email,
  'new_password': instance.newPassword,
};

_$ResendOtpRequestImpl _$$ResendOtpRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ResendOtpRequestImpl(email: json['email'] as String);

Map<String, dynamic> _$$ResendOtpRequestImplToJson(
  _$ResendOtpRequestImpl instance,
) => <String, dynamic>{'email': instance.email};

_$ResendOtpResponseImpl _$$ResendOtpResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ResendOtpResponseImpl(
  email: json['email'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$$ResendOtpResponseImplToJson(
  _$ResendOtpResponseImpl instance,
) => <String, dynamic>{'email': instance.email, 'message': instance.message};
