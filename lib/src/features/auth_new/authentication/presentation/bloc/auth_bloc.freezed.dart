// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )
    signup,
    required TResult Function() googleSignIn,
    required TResult Function(String token) verifyEmail,
    required TResult Function(String email) resendOtp,
    required TResult Function(String email) sendPasswordReset,
    required TResult Function(String token) verifyResetToken,
    required TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )
    resetPassword,
    required TResult Function() logout,
    required TResult Function() checkLoginStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult? Function()? googleSignIn,
    TResult? Function(String token)? verifyEmail,
    TResult? Function(String email)? resendOtp,
    TResult? Function(String email)? sendPasswordReset,
    TResult? Function(String token)? verifyResetToken,
    TResult? Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult? Function()? logout,
    TResult? Function()? checkLoginStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult Function()? googleSignIn,
    TResult Function(String token)? verifyEmail,
    TResult Function(String email)? resendOtp,
    TResult Function(String email)? sendPasswordReset,
    TResult Function(String token)? verifyResetToken,
    TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult Function()? logout,
    TResult Function()? checkLoginStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventLogin value) login,
    required TResult Function(AuthEventSignup value) signup,
    required TResult Function(AuthEventGoogleSignIn value) googleSignIn,
    required TResult Function(AuthEventVerifyEmail value) verifyEmail,
    required TResult Function(AuthEventResendOtp value) resendOtp,
    required TResult Function(AuthEventSendPasswordReset value)
    sendPasswordReset,
    required TResult Function(AuthEventVerifyResetToken value) verifyResetToken,
    required TResult Function(AuthEventResetPassword value) resetPassword,
    required TResult Function(AuthEventLogout value) logout,
    required TResult Function(AuthEventCheckLoginStatus value) checkLoginStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventLogin value)? login,
    TResult? Function(AuthEventSignup value)? signup,
    TResult? Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult? Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult? Function(AuthEventResendOtp value)? resendOtp,
    TResult? Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult? Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult? Function(AuthEventResetPassword value)? resetPassword,
    TResult? Function(AuthEventLogout value)? logout,
    TResult? Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventLogin value)? login,
    TResult Function(AuthEventSignup value)? signup,
    TResult Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult Function(AuthEventResendOtp value)? resendOtp,
    TResult Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult Function(AuthEventResetPassword value)? resetPassword,
    TResult Function(AuthEventLogout value)? logout,
    TResult Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthEventLoginImplCopyWith<$Res> {
  factory _$$AuthEventLoginImplCopyWith(
    _$AuthEventLoginImpl value,
    $Res Function(_$AuthEventLoginImpl) then,
  ) = __$$AuthEventLoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$AuthEventLoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventLoginImpl>
    implements _$$AuthEventLoginImplCopyWith<$Res> {
  __$$AuthEventLoginImplCopyWithImpl(
    _$AuthEventLoginImpl _value,
    $Res Function(_$AuthEventLoginImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$AuthEventLoginImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthEventLoginImpl implements AuthEventLogin {
  const _$AuthEventLoginImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.login(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventLoginImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEventLoginImplCopyWith<_$AuthEventLoginImpl> get copyWith =>
      __$$AuthEventLoginImplCopyWithImpl<_$AuthEventLoginImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )
    signup,
    required TResult Function() googleSignIn,
    required TResult Function(String token) verifyEmail,
    required TResult Function(String email) resendOtp,
    required TResult Function(String email) sendPasswordReset,
    required TResult Function(String token) verifyResetToken,
    required TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )
    resetPassword,
    required TResult Function() logout,
    required TResult Function() checkLoginStatus,
  }) {
    return login(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult? Function()? googleSignIn,
    TResult? Function(String token)? verifyEmail,
    TResult? Function(String email)? resendOtp,
    TResult? Function(String email)? sendPasswordReset,
    TResult? Function(String token)? verifyResetToken,
    TResult? Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult? Function()? logout,
    TResult? Function()? checkLoginStatus,
  }) {
    return login?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult Function()? googleSignIn,
    TResult Function(String token)? verifyEmail,
    TResult Function(String email)? resendOtp,
    TResult Function(String email)? sendPasswordReset,
    TResult Function(String token)? verifyResetToken,
    TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult Function()? logout,
    TResult Function()? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventLogin value) login,
    required TResult Function(AuthEventSignup value) signup,
    required TResult Function(AuthEventGoogleSignIn value) googleSignIn,
    required TResult Function(AuthEventVerifyEmail value) verifyEmail,
    required TResult Function(AuthEventResendOtp value) resendOtp,
    required TResult Function(AuthEventSendPasswordReset value)
    sendPasswordReset,
    required TResult Function(AuthEventVerifyResetToken value) verifyResetToken,
    required TResult Function(AuthEventResetPassword value) resetPassword,
    required TResult Function(AuthEventLogout value) logout,
    required TResult Function(AuthEventCheckLoginStatus value) checkLoginStatus,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventLogin value)? login,
    TResult? Function(AuthEventSignup value)? signup,
    TResult? Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult? Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult? Function(AuthEventResendOtp value)? resendOtp,
    TResult? Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult? Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult? Function(AuthEventResetPassword value)? resetPassword,
    TResult? Function(AuthEventLogout value)? logout,
    TResult? Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventLogin value)? login,
    TResult Function(AuthEventSignup value)? signup,
    TResult Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult Function(AuthEventResendOtp value)? resendOtp,
    TResult Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult Function(AuthEventResetPassword value)? resetPassword,
    TResult Function(AuthEventLogout value)? logout,
    TResult Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class AuthEventLogin implements AuthEvent {
  const factory AuthEventLogin({
    required final String email,
    required final String password,
  }) = _$AuthEventLoginImpl;

  String get email;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthEventLoginImplCopyWith<_$AuthEventLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthEventSignupImplCopyWith<$Res> {
  factory _$$AuthEventSignupImplCopyWith(
    _$AuthEventSignupImpl value,
    $Res Function(_$AuthEventSignupImpl) then,
  ) = __$$AuthEventSignupImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username, String email, String password, String? location});
}

/// @nodoc
class __$$AuthEventSignupImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventSignupImpl>
    implements _$$AuthEventSignupImplCopyWith<$Res> {
  __$$AuthEventSignupImplCopyWithImpl(
    _$AuthEventSignupImpl _value,
    $Res Function(_$AuthEventSignupImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? location = freezed,
  }) {
    return _then(
      _$AuthEventSignupImpl(
        username:
            null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
        location:
            freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$AuthEventSignupImpl implements AuthEventSignup {
  const _$AuthEventSignupImpl({
    required this.username,
    required this.email,
    required this.password,
    this.location,
  });

  @override
  final String username;
  @override
  final String email;
  @override
  final String password;
  @override
  final String? location;

  @override
  String toString() {
    return 'AuthEvent.signup(username: $username, email: $email, password: $password, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventSignupImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, username, email, password, location);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEventSignupImplCopyWith<_$AuthEventSignupImpl> get copyWith =>
      __$$AuthEventSignupImplCopyWithImpl<_$AuthEventSignupImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )
    signup,
    required TResult Function() googleSignIn,
    required TResult Function(String token) verifyEmail,
    required TResult Function(String email) resendOtp,
    required TResult Function(String email) sendPasswordReset,
    required TResult Function(String token) verifyResetToken,
    required TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )
    resetPassword,
    required TResult Function() logout,
    required TResult Function() checkLoginStatus,
  }) {
    return signup(username, email, password, location);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult? Function()? googleSignIn,
    TResult? Function(String token)? verifyEmail,
    TResult? Function(String email)? resendOtp,
    TResult? Function(String email)? sendPasswordReset,
    TResult? Function(String token)? verifyResetToken,
    TResult? Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult? Function()? logout,
    TResult? Function()? checkLoginStatus,
  }) {
    return signup?.call(username, email, password, location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult Function()? googleSignIn,
    TResult Function(String token)? verifyEmail,
    TResult Function(String email)? resendOtp,
    TResult Function(String email)? sendPasswordReset,
    TResult Function(String token)? verifyResetToken,
    TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult Function()? logout,
    TResult Function()? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (signup != null) {
      return signup(username, email, password, location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventLogin value) login,
    required TResult Function(AuthEventSignup value) signup,
    required TResult Function(AuthEventGoogleSignIn value) googleSignIn,
    required TResult Function(AuthEventVerifyEmail value) verifyEmail,
    required TResult Function(AuthEventResendOtp value) resendOtp,
    required TResult Function(AuthEventSendPasswordReset value)
    sendPasswordReset,
    required TResult Function(AuthEventVerifyResetToken value) verifyResetToken,
    required TResult Function(AuthEventResetPassword value) resetPassword,
    required TResult Function(AuthEventLogout value) logout,
    required TResult Function(AuthEventCheckLoginStatus value) checkLoginStatus,
  }) {
    return signup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventLogin value)? login,
    TResult? Function(AuthEventSignup value)? signup,
    TResult? Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult? Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult? Function(AuthEventResendOtp value)? resendOtp,
    TResult? Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult? Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult? Function(AuthEventResetPassword value)? resetPassword,
    TResult? Function(AuthEventLogout value)? logout,
    TResult? Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
  }) {
    return signup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventLogin value)? login,
    TResult Function(AuthEventSignup value)? signup,
    TResult Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult Function(AuthEventResendOtp value)? resendOtp,
    TResult Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult Function(AuthEventResetPassword value)? resetPassword,
    TResult Function(AuthEventLogout value)? logout,
    TResult Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (signup != null) {
      return signup(this);
    }
    return orElse();
  }
}

abstract class AuthEventSignup implements AuthEvent {
  const factory AuthEventSignup({
    required final String username,
    required final String email,
    required final String password,
    final String? location,
  }) = _$AuthEventSignupImpl;

  String get username;
  String get email;
  String get password;
  String? get location;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthEventSignupImplCopyWith<_$AuthEventSignupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthEventGoogleSignInImplCopyWith<$Res> {
  factory _$$AuthEventGoogleSignInImplCopyWith(
    _$AuthEventGoogleSignInImpl value,
    $Res Function(_$AuthEventGoogleSignInImpl) then,
  ) = __$$AuthEventGoogleSignInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventGoogleSignInImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventGoogleSignInImpl>
    implements _$$AuthEventGoogleSignInImplCopyWith<$Res> {
  __$$AuthEventGoogleSignInImplCopyWithImpl(
    _$AuthEventGoogleSignInImpl _value,
    $Res Function(_$AuthEventGoogleSignInImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthEventGoogleSignInImpl implements AuthEventGoogleSignIn {
  const _$AuthEventGoogleSignInImpl();

  @override
  String toString() {
    return 'AuthEvent.googleSignIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventGoogleSignInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )
    signup,
    required TResult Function() googleSignIn,
    required TResult Function(String token) verifyEmail,
    required TResult Function(String email) resendOtp,
    required TResult Function(String email) sendPasswordReset,
    required TResult Function(String token) verifyResetToken,
    required TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )
    resetPassword,
    required TResult Function() logout,
    required TResult Function() checkLoginStatus,
  }) {
    return googleSignIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult? Function()? googleSignIn,
    TResult? Function(String token)? verifyEmail,
    TResult? Function(String email)? resendOtp,
    TResult? Function(String email)? sendPasswordReset,
    TResult? Function(String token)? verifyResetToken,
    TResult? Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult? Function()? logout,
    TResult? Function()? checkLoginStatus,
  }) {
    return googleSignIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult Function()? googleSignIn,
    TResult Function(String token)? verifyEmail,
    TResult Function(String email)? resendOtp,
    TResult Function(String email)? sendPasswordReset,
    TResult Function(String token)? verifyResetToken,
    TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult Function()? logout,
    TResult Function()? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (googleSignIn != null) {
      return googleSignIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventLogin value) login,
    required TResult Function(AuthEventSignup value) signup,
    required TResult Function(AuthEventGoogleSignIn value) googleSignIn,
    required TResult Function(AuthEventVerifyEmail value) verifyEmail,
    required TResult Function(AuthEventResendOtp value) resendOtp,
    required TResult Function(AuthEventSendPasswordReset value)
    sendPasswordReset,
    required TResult Function(AuthEventVerifyResetToken value) verifyResetToken,
    required TResult Function(AuthEventResetPassword value) resetPassword,
    required TResult Function(AuthEventLogout value) logout,
    required TResult Function(AuthEventCheckLoginStatus value) checkLoginStatus,
  }) {
    return googleSignIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventLogin value)? login,
    TResult? Function(AuthEventSignup value)? signup,
    TResult? Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult? Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult? Function(AuthEventResendOtp value)? resendOtp,
    TResult? Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult? Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult? Function(AuthEventResetPassword value)? resetPassword,
    TResult? Function(AuthEventLogout value)? logout,
    TResult? Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
  }) {
    return googleSignIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventLogin value)? login,
    TResult Function(AuthEventSignup value)? signup,
    TResult Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult Function(AuthEventResendOtp value)? resendOtp,
    TResult Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult Function(AuthEventResetPassword value)? resetPassword,
    TResult Function(AuthEventLogout value)? logout,
    TResult Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (googleSignIn != null) {
      return googleSignIn(this);
    }
    return orElse();
  }
}

abstract class AuthEventGoogleSignIn implements AuthEvent {
  const factory AuthEventGoogleSignIn() = _$AuthEventGoogleSignInImpl;
}

/// @nodoc
abstract class _$$AuthEventVerifyEmailImplCopyWith<$Res> {
  factory _$$AuthEventVerifyEmailImplCopyWith(
    _$AuthEventVerifyEmailImpl value,
    $Res Function(_$AuthEventVerifyEmailImpl) then,
  ) = __$$AuthEventVerifyEmailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$AuthEventVerifyEmailImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventVerifyEmailImpl>
    implements _$$AuthEventVerifyEmailImplCopyWith<$Res> {
  __$$AuthEventVerifyEmailImplCopyWithImpl(
    _$AuthEventVerifyEmailImpl _value,
    $Res Function(_$AuthEventVerifyEmailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null}) {
    return _then(
      _$AuthEventVerifyEmailImpl(
        token:
            null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthEventVerifyEmailImpl implements AuthEventVerifyEmail {
  const _$AuthEventVerifyEmailImpl({required this.token});

  @override
  final String token;

  @override
  String toString() {
    return 'AuthEvent.verifyEmail(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventVerifyEmailImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEventVerifyEmailImplCopyWith<_$AuthEventVerifyEmailImpl>
  get copyWith =>
      __$$AuthEventVerifyEmailImplCopyWithImpl<_$AuthEventVerifyEmailImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )
    signup,
    required TResult Function() googleSignIn,
    required TResult Function(String token) verifyEmail,
    required TResult Function(String email) resendOtp,
    required TResult Function(String email) sendPasswordReset,
    required TResult Function(String token) verifyResetToken,
    required TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )
    resetPassword,
    required TResult Function() logout,
    required TResult Function() checkLoginStatus,
  }) {
    return verifyEmail(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult? Function()? googleSignIn,
    TResult? Function(String token)? verifyEmail,
    TResult? Function(String email)? resendOtp,
    TResult? Function(String email)? sendPasswordReset,
    TResult? Function(String token)? verifyResetToken,
    TResult? Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult? Function()? logout,
    TResult? Function()? checkLoginStatus,
  }) {
    return verifyEmail?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult Function()? googleSignIn,
    TResult Function(String token)? verifyEmail,
    TResult Function(String email)? resendOtp,
    TResult Function(String email)? sendPasswordReset,
    TResult Function(String token)? verifyResetToken,
    TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult Function()? logout,
    TResult Function()? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (verifyEmail != null) {
      return verifyEmail(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventLogin value) login,
    required TResult Function(AuthEventSignup value) signup,
    required TResult Function(AuthEventGoogleSignIn value) googleSignIn,
    required TResult Function(AuthEventVerifyEmail value) verifyEmail,
    required TResult Function(AuthEventResendOtp value) resendOtp,
    required TResult Function(AuthEventSendPasswordReset value)
    sendPasswordReset,
    required TResult Function(AuthEventVerifyResetToken value) verifyResetToken,
    required TResult Function(AuthEventResetPassword value) resetPassword,
    required TResult Function(AuthEventLogout value) logout,
    required TResult Function(AuthEventCheckLoginStatus value) checkLoginStatus,
  }) {
    return verifyEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventLogin value)? login,
    TResult? Function(AuthEventSignup value)? signup,
    TResult? Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult? Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult? Function(AuthEventResendOtp value)? resendOtp,
    TResult? Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult? Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult? Function(AuthEventResetPassword value)? resetPassword,
    TResult? Function(AuthEventLogout value)? logout,
    TResult? Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
  }) {
    return verifyEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventLogin value)? login,
    TResult Function(AuthEventSignup value)? signup,
    TResult Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult Function(AuthEventResendOtp value)? resendOtp,
    TResult Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult Function(AuthEventResetPassword value)? resetPassword,
    TResult Function(AuthEventLogout value)? logout,
    TResult Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (verifyEmail != null) {
      return verifyEmail(this);
    }
    return orElse();
  }
}

abstract class AuthEventVerifyEmail implements AuthEvent {
  const factory AuthEventVerifyEmail({required final String token}) =
      _$AuthEventVerifyEmailImpl;

  String get token;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthEventVerifyEmailImplCopyWith<_$AuthEventVerifyEmailImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthEventResendOtpImplCopyWith<$Res> {
  factory _$$AuthEventResendOtpImplCopyWith(
    _$AuthEventResendOtpImpl value,
    $Res Function(_$AuthEventResendOtpImpl) then,
  ) = __$$AuthEventResendOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$AuthEventResendOtpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventResendOtpImpl>
    implements _$$AuthEventResendOtpImplCopyWith<$Res> {
  __$$AuthEventResendOtpImplCopyWithImpl(
    _$AuthEventResendOtpImpl _value,
    $Res Function(_$AuthEventResendOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$AuthEventResendOtpImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthEventResendOtpImpl implements AuthEventResendOtp {
  const _$AuthEventResendOtpImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'AuthEvent.resendOtp(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventResendOtpImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEventResendOtpImplCopyWith<_$AuthEventResendOtpImpl> get copyWith =>
      __$$AuthEventResendOtpImplCopyWithImpl<_$AuthEventResendOtpImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )
    signup,
    required TResult Function() googleSignIn,
    required TResult Function(String token) verifyEmail,
    required TResult Function(String email) resendOtp,
    required TResult Function(String email) sendPasswordReset,
    required TResult Function(String token) verifyResetToken,
    required TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )
    resetPassword,
    required TResult Function() logout,
    required TResult Function() checkLoginStatus,
  }) {
    return resendOtp(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult? Function()? googleSignIn,
    TResult? Function(String token)? verifyEmail,
    TResult? Function(String email)? resendOtp,
    TResult? Function(String email)? sendPasswordReset,
    TResult? Function(String token)? verifyResetToken,
    TResult? Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult? Function()? logout,
    TResult? Function()? checkLoginStatus,
  }) {
    return resendOtp?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult Function()? googleSignIn,
    TResult Function(String token)? verifyEmail,
    TResult Function(String email)? resendOtp,
    TResult Function(String email)? sendPasswordReset,
    TResult Function(String token)? verifyResetToken,
    TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult Function()? logout,
    TResult Function()? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (resendOtp != null) {
      return resendOtp(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventLogin value) login,
    required TResult Function(AuthEventSignup value) signup,
    required TResult Function(AuthEventGoogleSignIn value) googleSignIn,
    required TResult Function(AuthEventVerifyEmail value) verifyEmail,
    required TResult Function(AuthEventResendOtp value) resendOtp,
    required TResult Function(AuthEventSendPasswordReset value)
    sendPasswordReset,
    required TResult Function(AuthEventVerifyResetToken value) verifyResetToken,
    required TResult Function(AuthEventResetPassword value) resetPassword,
    required TResult Function(AuthEventLogout value) logout,
    required TResult Function(AuthEventCheckLoginStatus value) checkLoginStatus,
  }) {
    return resendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventLogin value)? login,
    TResult? Function(AuthEventSignup value)? signup,
    TResult? Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult? Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult? Function(AuthEventResendOtp value)? resendOtp,
    TResult? Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult? Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult? Function(AuthEventResetPassword value)? resetPassword,
    TResult? Function(AuthEventLogout value)? logout,
    TResult? Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
  }) {
    return resendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventLogin value)? login,
    TResult Function(AuthEventSignup value)? signup,
    TResult Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult Function(AuthEventResendOtp value)? resendOtp,
    TResult Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult Function(AuthEventResetPassword value)? resetPassword,
    TResult Function(AuthEventLogout value)? logout,
    TResult Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (resendOtp != null) {
      return resendOtp(this);
    }
    return orElse();
  }
}

abstract class AuthEventResendOtp implements AuthEvent {
  const factory AuthEventResendOtp({required final String email}) =
      _$AuthEventResendOtpImpl;

  String get email;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthEventResendOtpImplCopyWith<_$AuthEventResendOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthEventSendPasswordResetImplCopyWith<$Res> {
  factory _$$AuthEventSendPasswordResetImplCopyWith(
    _$AuthEventSendPasswordResetImpl value,
    $Res Function(_$AuthEventSendPasswordResetImpl) then,
  ) = __$$AuthEventSendPasswordResetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$AuthEventSendPasswordResetImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventSendPasswordResetImpl>
    implements _$$AuthEventSendPasswordResetImplCopyWith<$Res> {
  __$$AuthEventSendPasswordResetImplCopyWithImpl(
    _$AuthEventSendPasswordResetImpl _value,
    $Res Function(_$AuthEventSendPasswordResetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$AuthEventSendPasswordResetImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthEventSendPasswordResetImpl implements AuthEventSendPasswordReset {
  const _$AuthEventSendPasswordResetImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'AuthEvent.sendPasswordReset(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventSendPasswordResetImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEventSendPasswordResetImplCopyWith<_$AuthEventSendPasswordResetImpl>
  get copyWith => __$$AuthEventSendPasswordResetImplCopyWithImpl<
    _$AuthEventSendPasswordResetImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )
    signup,
    required TResult Function() googleSignIn,
    required TResult Function(String token) verifyEmail,
    required TResult Function(String email) resendOtp,
    required TResult Function(String email) sendPasswordReset,
    required TResult Function(String token) verifyResetToken,
    required TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )
    resetPassword,
    required TResult Function() logout,
    required TResult Function() checkLoginStatus,
  }) {
    return sendPasswordReset(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult? Function()? googleSignIn,
    TResult? Function(String token)? verifyEmail,
    TResult? Function(String email)? resendOtp,
    TResult? Function(String email)? sendPasswordReset,
    TResult? Function(String token)? verifyResetToken,
    TResult? Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult? Function()? logout,
    TResult? Function()? checkLoginStatus,
  }) {
    return sendPasswordReset?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult Function()? googleSignIn,
    TResult Function(String token)? verifyEmail,
    TResult Function(String email)? resendOtp,
    TResult Function(String email)? sendPasswordReset,
    TResult Function(String token)? verifyResetToken,
    TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult Function()? logout,
    TResult Function()? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (sendPasswordReset != null) {
      return sendPasswordReset(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventLogin value) login,
    required TResult Function(AuthEventSignup value) signup,
    required TResult Function(AuthEventGoogleSignIn value) googleSignIn,
    required TResult Function(AuthEventVerifyEmail value) verifyEmail,
    required TResult Function(AuthEventResendOtp value) resendOtp,
    required TResult Function(AuthEventSendPasswordReset value)
    sendPasswordReset,
    required TResult Function(AuthEventVerifyResetToken value) verifyResetToken,
    required TResult Function(AuthEventResetPassword value) resetPassword,
    required TResult Function(AuthEventLogout value) logout,
    required TResult Function(AuthEventCheckLoginStatus value) checkLoginStatus,
  }) {
    return sendPasswordReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventLogin value)? login,
    TResult? Function(AuthEventSignup value)? signup,
    TResult? Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult? Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult? Function(AuthEventResendOtp value)? resendOtp,
    TResult? Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult? Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult? Function(AuthEventResetPassword value)? resetPassword,
    TResult? Function(AuthEventLogout value)? logout,
    TResult? Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
  }) {
    return sendPasswordReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventLogin value)? login,
    TResult Function(AuthEventSignup value)? signup,
    TResult Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult Function(AuthEventResendOtp value)? resendOtp,
    TResult Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult Function(AuthEventResetPassword value)? resetPassword,
    TResult Function(AuthEventLogout value)? logout,
    TResult Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (sendPasswordReset != null) {
      return sendPasswordReset(this);
    }
    return orElse();
  }
}

abstract class AuthEventSendPasswordReset implements AuthEvent {
  const factory AuthEventSendPasswordReset({required final String email}) =
      _$AuthEventSendPasswordResetImpl;

  String get email;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthEventSendPasswordResetImplCopyWith<_$AuthEventSendPasswordResetImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthEventVerifyResetTokenImplCopyWith<$Res> {
  factory _$$AuthEventVerifyResetTokenImplCopyWith(
    _$AuthEventVerifyResetTokenImpl value,
    $Res Function(_$AuthEventVerifyResetTokenImpl) then,
  ) = __$$AuthEventVerifyResetTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$AuthEventVerifyResetTokenImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventVerifyResetTokenImpl>
    implements _$$AuthEventVerifyResetTokenImplCopyWith<$Res> {
  __$$AuthEventVerifyResetTokenImplCopyWithImpl(
    _$AuthEventVerifyResetTokenImpl _value,
    $Res Function(_$AuthEventVerifyResetTokenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null}) {
    return _then(
      _$AuthEventVerifyResetTokenImpl(
        token:
            null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthEventVerifyResetTokenImpl implements AuthEventVerifyResetToken {
  const _$AuthEventVerifyResetTokenImpl({required this.token});

  @override
  final String token;

  @override
  String toString() {
    return 'AuthEvent.verifyResetToken(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventVerifyResetTokenImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEventVerifyResetTokenImplCopyWith<_$AuthEventVerifyResetTokenImpl>
  get copyWith => __$$AuthEventVerifyResetTokenImplCopyWithImpl<
    _$AuthEventVerifyResetTokenImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )
    signup,
    required TResult Function() googleSignIn,
    required TResult Function(String token) verifyEmail,
    required TResult Function(String email) resendOtp,
    required TResult Function(String email) sendPasswordReset,
    required TResult Function(String token) verifyResetToken,
    required TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )
    resetPassword,
    required TResult Function() logout,
    required TResult Function() checkLoginStatus,
  }) {
    return verifyResetToken(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult? Function()? googleSignIn,
    TResult? Function(String token)? verifyEmail,
    TResult? Function(String email)? resendOtp,
    TResult? Function(String email)? sendPasswordReset,
    TResult? Function(String token)? verifyResetToken,
    TResult? Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult? Function()? logout,
    TResult? Function()? checkLoginStatus,
  }) {
    return verifyResetToken?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult Function()? googleSignIn,
    TResult Function(String token)? verifyEmail,
    TResult Function(String email)? resendOtp,
    TResult Function(String email)? sendPasswordReset,
    TResult Function(String token)? verifyResetToken,
    TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult Function()? logout,
    TResult Function()? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (verifyResetToken != null) {
      return verifyResetToken(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventLogin value) login,
    required TResult Function(AuthEventSignup value) signup,
    required TResult Function(AuthEventGoogleSignIn value) googleSignIn,
    required TResult Function(AuthEventVerifyEmail value) verifyEmail,
    required TResult Function(AuthEventResendOtp value) resendOtp,
    required TResult Function(AuthEventSendPasswordReset value)
    sendPasswordReset,
    required TResult Function(AuthEventVerifyResetToken value) verifyResetToken,
    required TResult Function(AuthEventResetPassword value) resetPassword,
    required TResult Function(AuthEventLogout value) logout,
    required TResult Function(AuthEventCheckLoginStatus value) checkLoginStatus,
  }) {
    return verifyResetToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventLogin value)? login,
    TResult? Function(AuthEventSignup value)? signup,
    TResult? Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult? Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult? Function(AuthEventResendOtp value)? resendOtp,
    TResult? Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult? Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult? Function(AuthEventResetPassword value)? resetPassword,
    TResult? Function(AuthEventLogout value)? logout,
    TResult? Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
  }) {
    return verifyResetToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventLogin value)? login,
    TResult Function(AuthEventSignup value)? signup,
    TResult Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult Function(AuthEventResendOtp value)? resendOtp,
    TResult Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult Function(AuthEventResetPassword value)? resetPassword,
    TResult Function(AuthEventLogout value)? logout,
    TResult Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (verifyResetToken != null) {
      return verifyResetToken(this);
    }
    return orElse();
  }
}

abstract class AuthEventVerifyResetToken implements AuthEvent {
  const factory AuthEventVerifyResetToken({required final String token}) =
      _$AuthEventVerifyResetTokenImpl;

  String get token;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthEventVerifyResetTokenImplCopyWith<_$AuthEventVerifyResetTokenImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthEventResetPasswordImplCopyWith<$Res> {
  factory _$$AuthEventResetPasswordImplCopyWith(
    _$AuthEventResetPasswordImpl value,
    $Res Function(_$AuthEventResetPasswordImpl) then,
  ) = __$$AuthEventResetPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String newPassword, String passwordConfirmation});
}

/// @nodoc
class __$$AuthEventResetPasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventResetPasswordImpl>
    implements _$$AuthEventResetPasswordImplCopyWith<$Res> {
  __$$AuthEventResetPasswordImplCopyWithImpl(
    _$AuthEventResetPasswordImpl _value,
    $Res Function(_$AuthEventResetPasswordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? newPassword = null,
    Object? passwordConfirmation = null,
  }) {
    return _then(
      _$AuthEventResetPasswordImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        newPassword:
            null == newPassword
                ? _value.newPassword
                : newPassword // ignore: cast_nullable_to_non_nullable
                    as String,
        passwordConfirmation:
            null == passwordConfirmation
                ? _value.passwordConfirmation
                : passwordConfirmation // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthEventResetPasswordImpl implements AuthEventResetPassword {
  const _$AuthEventResetPasswordImpl({
    required this.email,
    required this.newPassword,
    required this.passwordConfirmation,
  });

  @override
  final String email;
  @override
  final String newPassword;
  @override
  final String passwordConfirmation;

  @override
  String toString() {
    return 'AuthEvent.resetPassword(email: $email, newPassword: $newPassword, passwordConfirmation: $passwordConfirmation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventResetPasswordImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, newPassword, passwordConfirmation);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEventResetPasswordImplCopyWith<_$AuthEventResetPasswordImpl>
  get copyWith =>
      __$$AuthEventResetPasswordImplCopyWithImpl<_$AuthEventResetPasswordImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )
    signup,
    required TResult Function() googleSignIn,
    required TResult Function(String token) verifyEmail,
    required TResult Function(String email) resendOtp,
    required TResult Function(String email) sendPasswordReset,
    required TResult Function(String token) verifyResetToken,
    required TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )
    resetPassword,
    required TResult Function() logout,
    required TResult Function() checkLoginStatus,
  }) {
    return resetPassword(email, newPassword, passwordConfirmation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult? Function()? googleSignIn,
    TResult? Function(String token)? verifyEmail,
    TResult? Function(String email)? resendOtp,
    TResult? Function(String email)? sendPasswordReset,
    TResult? Function(String token)? verifyResetToken,
    TResult? Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult? Function()? logout,
    TResult? Function()? checkLoginStatus,
  }) {
    return resetPassword?.call(email, newPassword, passwordConfirmation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult Function()? googleSignIn,
    TResult Function(String token)? verifyEmail,
    TResult Function(String email)? resendOtp,
    TResult Function(String email)? sendPasswordReset,
    TResult Function(String token)? verifyResetToken,
    TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult Function()? logout,
    TResult Function()? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(email, newPassword, passwordConfirmation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventLogin value) login,
    required TResult Function(AuthEventSignup value) signup,
    required TResult Function(AuthEventGoogleSignIn value) googleSignIn,
    required TResult Function(AuthEventVerifyEmail value) verifyEmail,
    required TResult Function(AuthEventResendOtp value) resendOtp,
    required TResult Function(AuthEventSendPasswordReset value)
    sendPasswordReset,
    required TResult Function(AuthEventVerifyResetToken value) verifyResetToken,
    required TResult Function(AuthEventResetPassword value) resetPassword,
    required TResult Function(AuthEventLogout value) logout,
    required TResult Function(AuthEventCheckLoginStatus value) checkLoginStatus,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventLogin value)? login,
    TResult? Function(AuthEventSignup value)? signup,
    TResult? Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult? Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult? Function(AuthEventResendOtp value)? resendOtp,
    TResult? Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult? Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult? Function(AuthEventResetPassword value)? resetPassword,
    TResult? Function(AuthEventLogout value)? logout,
    TResult? Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventLogin value)? login,
    TResult Function(AuthEventSignup value)? signup,
    TResult Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult Function(AuthEventResendOtp value)? resendOtp,
    TResult Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult Function(AuthEventResetPassword value)? resetPassword,
    TResult Function(AuthEventLogout value)? logout,
    TResult Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class AuthEventResetPassword implements AuthEvent {
  const factory AuthEventResetPassword({
    required final String email,
    required final String newPassword,
    required final String passwordConfirmation,
  }) = _$AuthEventResetPasswordImpl;

  String get email;
  String get newPassword;
  String get passwordConfirmation;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthEventResetPasswordImplCopyWith<_$AuthEventResetPasswordImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthEventLogoutImplCopyWith<$Res> {
  factory _$$AuthEventLogoutImplCopyWith(
    _$AuthEventLogoutImpl value,
    $Res Function(_$AuthEventLogoutImpl) then,
  ) = __$$AuthEventLogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventLogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventLogoutImpl>
    implements _$$AuthEventLogoutImplCopyWith<$Res> {
  __$$AuthEventLogoutImplCopyWithImpl(
    _$AuthEventLogoutImpl _value,
    $Res Function(_$AuthEventLogoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthEventLogoutImpl implements AuthEventLogout {
  const _$AuthEventLogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthEventLogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )
    signup,
    required TResult Function() googleSignIn,
    required TResult Function(String token) verifyEmail,
    required TResult Function(String email) resendOtp,
    required TResult Function(String email) sendPasswordReset,
    required TResult Function(String token) verifyResetToken,
    required TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )
    resetPassword,
    required TResult Function() logout,
    required TResult Function() checkLoginStatus,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult? Function()? googleSignIn,
    TResult? Function(String token)? verifyEmail,
    TResult? Function(String email)? resendOtp,
    TResult? Function(String email)? sendPasswordReset,
    TResult? Function(String token)? verifyResetToken,
    TResult? Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult? Function()? logout,
    TResult? Function()? checkLoginStatus,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult Function()? googleSignIn,
    TResult Function(String token)? verifyEmail,
    TResult Function(String email)? resendOtp,
    TResult Function(String email)? sendPasswordReset,
    TResult Function(String token)? verifyResetToken,
    TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult Function()? logout,
    TResult Function()? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventLogin value) login,
    required TResult Function(AuthEventSignup value) signup,
    required TResult Function(AuthEventGoogleSignIn value) googleSignIn,
    required TResult Function(AuthEventVerifyEmail value) verifyEmail,
    required TResult Function(AuthEventResendOtp value) resendOtp,
    required TResult Function(AuthEventSendPasswordReset value)
    sendPasswordReset,
    required TResult Function(AuthEventVerifyResetToken value) verifyResetToken,
    required TResult Function(AuthEventResetPassword value) resetPassword,
    required TResult Function(AuthEventLogout value) logout,
    required TResult Function(AuthEventCheckLoginStatus value) checkLoginStatus,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventLogin value)? login,
    TResult? Function(AuthEventSignup value)? signup,
    TResult? Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult? Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult? Function(AuthEventResendOtp value)? resendOtp,
    TResult? Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult? Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult? Function(AuthEventResetPassword value)? resetPassword,
    TResult? Function(AuthEventLogout value)? logout,
    TResult? Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventLogin value)? login,
    TResult Function(AuthEventSignup value)? signup,
    TResult Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult Function(AuthEventResendOtp value)? resendOtp,
    TResult Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult Function(AuthEventResetPassword value)? resetPassword,
    TResult Function(AuthEventLogout value)? logout,
    TResult Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class AuthEventLogout implements AuthEvent {
  const factory AuthEventLogout() = _$AuthEventLogoutImpl;
}

/// @nodoc
abstract class _$$AuthEventCheckLoginStatusImplCopyWith<$Res> {
  factory _$$AuthEventCheckLoginStatusImplCopyWith(
    _$AuthEventCheckLoginStatusImpl value,
    $Res Function(_$AuthEventCheckLoginStatusImpl) then,
  ) = __$$AuthEventCheckLoginStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventCheckLoginStatusImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventCheckLoginStatusImpl>
    implements _$$AuthEventCheckLoginStatusImplCopyWith<$Res> {
  __$$AuthEventCheckLoginStatusImplCopyWithImpl(
    _$AuthEventCheckLoginStatusImpl _value,
    $Res Function(_$AuthEventCheckLoginStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthEventCheckLoginStatusImpl implements AuthEventCheckLoginStatus {
  const _$AuthEventCheckLoginStatusImpl();

  @override
  String toString() {
    return 'AuthEvent.checkLoginStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventCheckLoginStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )
    signup,
    required TResult Function() googleSignIn,
    required TResult Function(String token) verifyEmail,
    required TResult Function(String email) resendOtp,
    required TResult Function(String email) sendPasswordReset,
    required TResult Function(String token) verifyResetToken,
    required TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )
    resetPassword,
    required TResult Function() logout,
    required TResult Function() checkLoginStatus,
  }) {
    return checkLoginStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult? Function()? googleSignIn,
    TResult? Function(String token)? verifyEmail,
    TResult? Function(String email)? resendOtp,
    TResult? Function(String email)? sendPasswordReset,
    TResult? Function(String token)? verifyResetToken,
    TResult? Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult? Function()? logout,
    TResult? Function()? checkLoginStatus,
  }) {
    return checkLoginStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(
      String username,
      String email,
      String password,
      String? location,
    )?
    signup,
    TResult Function()? googleSignIn,
    TResult Function(String token)? verifyEmail,
    TResult Function(String email)? resendOtp,
    TResult Function(String email)? sendPasswordReset,
    TResult Function(String token)? verifyResetToken,
    TResult Function(
      String email,
      String newPassword,
      String passwordConfirmation,
    )?
    resetPassword,
    TResult Function()? logout,
    TResult Function()? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (checkLoginStatus != null) {
      return checkLoginStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventLogin value) login,
    required TResult Function(AuthEventSignup value) signup,
    required TResult Function(AuthEventGoogleSignIn value) googleSignIn,
    required TResult Function(AuthEventVerifyEmail value) verifyEmail,
    required TResult Function(AuthEventResendOtp value) resendOtp,
    required TResult Function(AuthEventSendPasswordReset value)
    sendPasswordReset,
    required TResult Function(AuthEventVerifyResetToken value) verifyResetToken,
    required TResult Function(AuthEventResetPassword value) resetPassword,
    required TResult Function(AuthEventLogout value) logout,
    required TResult Function(AuthEventCheckLoginStatus value) checkLoginStatus,
  }) {
    return checkLoginStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventLogin value)? login,
    TResult? Function(AuthEventSignup value)? signup,
    TResult? Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult? Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult? Function(AuthEventResendOtp value)? resendOtp,
    TResult? Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult? Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult? Function(AuthEventResetPassword value)? resetPassword,
    TResult? Function(AuthEventLogout value)? logout,
    TResult? Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
  }) {
    return checkLoginStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventLogin value)? login,
    TResult Function(AuthEventSignup value)? signup,
    TResult Function(AuthEventGoogleSignIn value)? googleSignIn,
    TResult Function(AuthEventVerifyEmail value)? verifyEmail,
    TResult Function(AuthEventResendOtp value)? resendOtp,
    TResult Function(AuthEventSendPasswordReset value)? sendPasswordReset,
    TResult Function(AuthEventVerifyResetToken value)? verifyResetToken,
    TResult Function(AuthEventResetPassword value)? resetPassword,
    TResult Function(AuthEventLogout value)? logout,
    TResult Function(AuthEventCheckLoginStatus value)? checkLoginStatus,
    required TResult orElse(),
  }) {
    if (checkLoginStatus != null) {
      return checkLoginStatus(this);
    }
    return orElse();
  }
}

abstract class AuthEventCheckLoginStatus implements AuthEvent {
  const factory AuthEventCheckLoginStatus() = _$AuthEventCheckLoginStatusImpl;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoadingType type) loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(User user) signupSuccess,
    required TResult Function(String message) emailVerified,
    required TResult Function(String message) otpResent,
    required TResult Function(String message) passwordResetSent,
    required TResult Function(String message) resetTokenVerified,
    required TResult Function(String message) passwordReset,
    required TResult Function(String message, bool isNetworkError) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoadingType type)? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(User user)? signupSuccess,
    TResult? Function(String message)? emailVerified,
    TResult? Function(String message)? otpResent,
    TResult? Function(String message)? passwordResetSent,
    TResult? Function(String message)? resetTokenVerified,
    TResult? Function(String message)? passwordReset,
    TResult? Function(String message, bool isNetworkError)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoadingType type)? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(User user)? signupSuccess,
    TResult Function(String message)? emailVerified,
    TResult Function(String message)? otpResent,
    TResult Function(String message)? passwordResetSent,
    TResult Function(String message)? resetTokenVerified,
    TResult Function(String message)? passwordReset,
    TResult Function(String message, bool isNetworkError)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_SignupSuccess value) signupSuccess,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_PasswordResetSent value) passwordResetSent,
    required TResult Function(_ResetTokenVerified value) resetTokenVerified,
    required TResult Function(_PasswordReset value) passwordReset,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_SignupSuccess value)? signupSuccess,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_PasswordResetSent value)? passwordResetSent,
    TResult? Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult? Function(_PasswordReset value)? passwordReset,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_SignupSuccess value)? signupSuccess,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_PasswordResetSent value)? passwordResetSent,
    TResult Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult Function(_PasswordReset value)? passwordReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoadingType type) loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(User user) signupSuccess,
    required TResult Function(String message) emailVerified,
    required TResult Function(String message) otpResent,
    required TResult Function(String message) passwordResetSent,
    required TResult Function(String message) resetTokenVerified,
    required TResult Function(String message) passwordReset,
    required TResult Function(String message, bool isNetworkError) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoadingType type)? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(User user)? signupSuccess,
    TResult? Function(String message)? emailVerified,
    TResult? Function(String message)? otpResent,
    TResult? Function(String message)? passwordResetSent,
    TResult? Function(String message)? resetTokenVerified,
    TResult? Function(String message)? passwordReset,
    TResult? Function(String message, bool isNetworkError)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoadingType type)? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(User user)? signupSuccess,
    TResult Function(String message)? emailVerified,
    TResult Function(String message)? otpResent,
    TResult Function(String message)? passwordResetSent,
    TResult Function(String message)? resetTokenVerified,
    TResult Function(String message)? passwordReset,
    TResult Function(String message, bool isNetworkError)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_SignupSuccess value) signupSuccess,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_PasswordResetSent value) passwordResetSent,
    required TResult Function(_ResetTokenVerified value) resetTokenVerified,
    required TResult Function(_PasswordReset value) passwordReset,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_SignupSuccess value)? signupSuccess,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_PasswordResetSent value)? passwordResetSent,
    TResult? Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult? Function(_PasswordReset value)? passwordReset,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_SignupSuccess value)? signupSuccess,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_PasswordResetSent value)? passwordResetSent,
    TResult Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult Function(_PasswordReset value)? passwordReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoadingType type});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null}) {
    return _then(
      _$LoadingImpl(
        null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                as LoadingType,
      ),
    );
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(this.type);

  @override
  final LoadingType type;

  @override
  String toString() {
    return 'AuthState.loading(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoadingType type) loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(User user) signupSuccess,
    required TResult Function(String message) emailVerified,
    required TResult Function(String message) otpResent,
    required TResult Function(String message) passwordResetSent,
    required TResult Function(String message) resetTokenVerified,
    required TResult Function(String message) passwordReset,
    required TResult Function(String message, bool isNetworkError) error,
  }) {
    return loading(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoadingType type)? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(User user)? signupSuccess,
    TResult? Function(String message)? emailVerified,
    TResult? Function(String message)? otpResent,
    TResult? Function(String message)? passwordResetSent,
    TResult? Function(String message)? resetTokenVerified,
    TResult? Function(String message)? passwordReset,
    TResult? Function(String message, bool isNetworkError)? error,
  }) {
    return loading?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoadingType type)? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(User user)? signupSuccess,
    TResult Function(String message)? emailVerified,
    TResult Function(String message)? otpResent,
    TResult Function(String message)? passwordResetSent,
    TResult Function(String message)? resetTokenVerified,
    TResult Function(String message)? passwordReset,
    TResult Function(String message, bool isNetworkError)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_SignupSuccess value) signupSuccess,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_PasswordResetSent value) passwordResetSent,
    required TResult Function(_ResetTokenVerified value) resetTokenVerified,
    required TResult Function(_PasswordReset value) passwordReset,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_SignupSuccess value)? signupSuccess,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_PasswordResetSent value)? passwordResetSent,
    TResult? Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult? Function(_PasswordReset value)? passwordReset,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_SignupSuccess value)? signupSuccess,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_PasswordResetSent value)? passwordResetSent,
    TResult Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult Function(_PasswordReset value)? passwordReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading(final LoadingType type) = _$LoadingImpl;

  LoadingType get type;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
    _$AuthenticatedImpl value,
    $Res Function(_$AuthenticatedImpl) then,
  ) = __$$AuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
    _$AuthenticatedImpl _value,
    $Res Function(_$AuthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null}) {
    return _then(
      _$AuthenticatedImpl(
        null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                as User,
      ),
    );
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthenticatedImpl implements _Authenticated {
  const _$AuthenticatedImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      __$$AuthenticatedImplCopyWithImpl<_$AuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoadingType type) loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(User user) signupSuccess,
    required TResult Function(String message) emailVerified,
    required TResult Function(String message) otpResent,
    required TResult Function(String message) passwordResetSent,
    required TResult Function(String message) resetTokenVerified,
    required TResult Function(String message) passwordReset,
    required TResult Function(String message, bool isNetworkError) error,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoadingType type)? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(User user)? signupSuccess,
    TResult? Function(String message)? emailVerified,
    TResult? Function(String message)? otpResent,
    TResult? Function(String message)? passwordResetSent,
    TResult? Function(String message)? resetTokenVerified,
    TResult? Function(String message)? passwordReset,
    TResult? Function(String message, bool isNetworkError)? error,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoadingType type)? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(User user)? signupSuccess,
    TResult Function(String message)? emailVerified,
    TResult Function(String message)? otpResent,
    TResult Function(String message)? passwordResetSent,
    TResult Function(String message)? resetTokenVerified,
    TResult Function(String message)? passwordReset,
    TResult Function(String message, bool isNetworkError)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_SignupSuccess value) signupSuccess,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_PasswordResetSent value) passwordResetSent,
    required TResult Function(_ResetTokenVerified value) resetTokenVerified,
    required TResult Function(_PasswordReset value) passwordReset,
    required TResult Function(_Error value) error,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_SignupSuccess value)? signupSuccess,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_PasswordResetSent value)? passwordResetSent,
    TResult? Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult? Function(_PasswordReset value)? passwordReset,
    TResult? Function(_Error value)? error,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_SignupSuccess value)? signupSuccess,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_PasswordResetSent value)? passwordResetSent,
    TResult Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult Function(_PasswordReset value)? passwordReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AuthState {
  const factory _Authenticated(final User user) = _$AuthenticatedImpl;

  User get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(
    _$UnauthenticatedImpl value,
    $Res Function(_$UnauthenticatedImpl) then,
  ) = __$$UnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
    _$UnauthenticatedImpl _value,
    $Res Function(_$UnauthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnauthenticatedImpl implements _Unauthenticated {
  const _$UnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoadingType type) loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(User user) signupSuccess,
    required TResult Function(String message) emailVerified,
    required TResult Function(String message) otpResent,
    required TResult Function(String message) passwordResetSent,
    required TResult Function(String message) resetTokenVerified,
    required TResult Function(String message) passwordReset,
    required TResult Function(String message, bool isNetworkError) error,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoadingType type)? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(User user)? signupSuccess,
    TResult? Function(String message)? emailVerified,
    TResult? Function(String message)? otpResent,
    TResult? Function(String message)? passwordResetSent,
    TResult? Function(String message)? resetTokenVerified,
    TResult? Function(String message)? passwordReset,
    TResult? Function(String message, bool isNetworkError)? error,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoadingType type)? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(User user)? signupSuccess,
    TResult Function(String message)? emailVerified,
    TResult Function(String message)? otpResent,
    TResult Function(String message)? passwordResetSent,
    TResult Function(String message)? resetTokenVerified,
    TResult Function(String message)? passwordReset,
    TResult Function(String message, bool isNetworkError)? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_SignupSuccess value) signupSuccess,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_PasswordResetSent value) passwordResetSent,
    required TResult Function(_ResetTokenVerified value) resetTokenVerified,
    required TResult Function(_PasswordReset value) passwordReset,
    required TResult Function(_Error value) error,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_SignupSuccess value)? signupSuccess,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_PasswordResetSent value)? passwordResetSent,
    TResult? Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult? Function(_PasswordReset value)? passwordReset,
    TResult? Function(_Error value)? error,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_SignupSuccess value)? signupSuccess,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_PasswordResetSent value)? passwordResetSent,
    TResult Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult Function(_PasswordReset value)? passwordReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements AuthState {
  const factory _Unauthenticated() = _$UnauthenticatedImpl;
}

/// @nodoc
abstract class _$$SignupSuccessImplCopyWith<$Res> {
  factory _$$SignupSuccessImplCopyWith(
    _$SignupSuccessImpl value,
    $Res Function(_$SignupSuccessImpl) then,
  ) = __$$SignupSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$SignupSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SignupSuccessImpl>
    implements _$$SignupSuccessImplCopyWith<$Res> {
  __$$SignupSuccessImplCopyWithImpl(
    _$SignupSuccessImpl _value,
    $Res Function(_$SignupSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null}) {
    return _then(
      _$SignupSuccessImpl(
        null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                as User,
      ),
    );
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$SignupSuccessImpl implements _SignupSuccess {
  const _$SignupSuccessImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.signupSuccess(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupSuccessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupSuccessImplCopyWith<_$SignupSuccessImpl> get copyWith =>
      __$$SignupSuccessImplCopyWithImpl<_$SignupSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoadingType type) loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(User user) signupSuccess,
    required TResult Function(String message) emailVerified,
    required TResult Function(String message) otpResent,
    required TResult Function(String message) passwordResetSent,
    required TResult Function(String message) resetTokenVerified,
    required TResult Function(String message) passwordReset,
    required TResult Function(String message, bool isNetworkError) error,
  }) {
    return signupSuccess(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoadingType type)? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(User user)? signupSuccess,
    TResult? Function(String message)? emailVerified,
    TResult? Function(String message)? otpResent,
    TResult? Function(String message)? passwordResetSent,
    TResult? Function(String message)? resetTokenVerified,
    TResult? Function(String message)? passwordReset,
    TResult? Function(String message, bool isNetworkError)? error,
  }) {
    return signupSuccess?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoadingType type)? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(User user)? signupSuccess,
    TResult Function(String message)? emailVerified,
    TResult Function(String message)? otpResent,
    TResult Function(String message)? passwordResetSent,
    TResult Function(String message)? resetTokenVerified,
    TResult Function(String message)? passwordReset,
    TResult Function(String message, bool isNetworkError)? error,
    required TResult orElse(),
  }) {
    if (signupSuccess != null) {
      return signupSuccess(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_SignupSuccess value) signupSuccess,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_PasswordResetSent value) passwordResetSent,
    required TResult Function(_ResetTokenVerified value) resetTokenVerified,
    required TResult Function(_PasswordReset value) passwordReset,
    required TResult Function(_Error value) error,
  }) {
    return signupSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_SignupSuccess value)? signupSuccess,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_PasswordResetSent value)? passwordResetSent,
    TResult? Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult? Function(_PasswordReset value)? passwordReset,
    TResult? Function(_Error value)? error,
  }) {
    return signupSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_SignupSuccess value)? signupSuccess,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_PasswordResetSent value)? passwordResetSent,
    TResult Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult Function(_PasswordReset value)? passwordReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (signupSuccess != null) {
      return signupSuccess(this);
    }
    return orElse();
  }
}

abstract class _SignupSuccess implements AuthState {
  const factory _SignupSuccess(final User user) = _$SignupSuccessImpl;

  User get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupSuccessImplCopyWith<_$SignupSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailVerifiedImplCopyWith<$Res> {
  factory _$$EmailVerifiedImplCopyWith(
    _$EmailVerifiedImpl value,
    $Res Function(_$EmailVerifiedImpl) then,
  ) = __$$EmailVerifiedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$EmailVerifiedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$EmailVerifiedImpl>
    implements _$$EmailVerifiedImplCopyWith<$Res> {
  __$$EmailVerifiedImplCopyWithImpl(
    _$EmailVerifiedImpl _value,
    $Res Function(_$EmailVerifiedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$EmailVerifiedImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$EmailVerifiedImpl implements _EmailVerified {
  const _$EmailVerifiedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.emailVerified(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerifiedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailVerifiedImplCopyWith<_$EmailVerifiedImpl> get copyWith =>
      __$$EmailVerifiedImplCopyWithImpl<_$EmailVerifiedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoadingType type) loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(User user) signupSuccess,
    required TResult Function(String message) emailVerified,
    required TResult Function(String message) otpResent,
    required TResult Function(String message) passwordResetSent,
    required TResult Function(String message) resetTokenVerified,
    required TResult Function(String message) passwordReset,
    required TResult Function(String message, bool isNetworkError) error,
  }) {
    return emailVerified(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoadingType type)? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(User user)? signupSuccess,
    TResult? Function(String message)? emailVerified,
    TResult? Function(String message)? otpResent,
    TResult? Function(String message)? passwordResetSent,
    TResult? Function(String message)? resetTokenVerified,
    TResult? Function(String message)? passwordReset,
    TResult? Function(String message, bool isNetworkError)? error,
  }) {
    return emailVerified?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoadingType type)? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(User user)? signupSuccess,
    TResult Function(String message)? emailVerified,
    TResult Function(String message)? otpResent,
    TResult Function(String message)? passwordResetSent,
    TResult Function(String message)? resetTokenVerified,
    TResult Function(String message)? passwordReset,
    TResult Function(String message, bool isNetworkError)? error,
    required TResult orElse(),
  }) {
    if (emailVerified != null) {
      return emailVerified(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_SignupSuccess value) signupSuccess,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_PasswordResetSent value) passwordResetSent,
    required TResult Function(_ResetTokenVerified value) resetTokenVerified,
    required TResult Function(_PasswordReset value) passwordReset,
    required TResult Function(_Error value) error,
  }) {
    return emailVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_SignupSuccess value)? signupSuccess,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_PasswordResetSent value)? passwordResetSent,
    TResult? Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult? Function(_PasswordReset value)? passwordReset,
    TResult? Function(_Error value)? error,
  }) {
    return emailVerified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_SignupSuccess value)? signupSuccess,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_PasswordResetSent value)? passwordResetSent,
    TResult Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult Function(_PasswordReset value)? passwordReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (emailVerified != null) {
      return emailVerified(this);
    }
    return orElse();
  }
}

abstract class _EmailVerified implements AuthState {
  const factory _EmailVerified(final String message) = _$EmailVerifiedImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailVerifiedImplCopyWith<_$EmailVerifiedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtpResentImplCopyWith<$Res> {
  factory _$$OtpResentImplCopyWith(
    _$OtpResentImpl value,
    $Res Function(_$OtpResentImpl) then,
  ) = __$$OtpResentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OtpResentImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$OtpResentImpl>
    implements _$$OtpResentImplCopyWith<$Res> {
  __$$OtpResentImplCopyWithImpl(
    _$OtpResentImpl _value,
    $Res Function(_$OtpResentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$OtpResentImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$OtpResentImpl implements _OtpResent {
  const _$OtpResentImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.otpResent(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpResentImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpResentImplCopyWith<_$OtpResentImpl> get copyWith =>
      __$$OtpResentImplCopyWithImpl<_$OtpResentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoadingType type) loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(User user) signupSuccess,
    required TResult Function(String message) emailVerified,
    required TResult Function(String message) otpResent,
    required TResult Function(String message) passwordResetSent,
    required TResult Function(String message) resetTokenVerified,
    required TResult Function(String message) passwordReset,
    required TResult Function(String message, bool isNetworkError) error,
  }) {
    return otpResent(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoadingType type)? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(User user)? signupSuccess,
    TResult? Function(String message)? emailVerified,
    TResult? Function(String message)? otpResent,
    TResult? Function(String message)? passwordResetSent,
    TResult? Function(String message)? resetTokenVerified,
    TResult? Function(String message)? passwordReset,
    TResult? Function(String message, bool isNetworkError)? error,
  }) {
    return otpResent?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoadingType type)? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(User user)? signupSuccess,
    TResult Function(String message)? emailVerified,
    TResult Function(String message)? otpResent,
    TResult Function(String message)? passwordResetSent,
    TResult Function(String message)? resetTokenVerified,
    TResult Function(String message)? passwordReset,
    TResult Function(String message, bool isNetworkError)? error,
    required TResult orElse(),
  }) {
    if (otpResent != null) {
      return otpResent(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_SignupSuccess value) signupSuccess,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_PasswordResetSent value) passwordResetSent,
    required TResult Function(_ResetTokenVerified value) resetTokenVerified,
    required TResult Function(_PasswordReset value) passwordReset,
    required TResult Function(_Error value) error,
  }) {
    return otpResent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_SignupSuccess value)? signupSuccess,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_PasswordResetSent value)? passwordResetSent,
    TResult? Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult? Function(_PasswordReset value)? passwordReset,
    TResult? Function(_Error value)? error,
  }) {
    return otpResent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_SignupSuccess value)? signupSuccess,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_PasswordResetSent value)? passwordResetSent,
    TResult Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult Function(_PasswordReset value)? passwordReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (otpResent != null) {
      return otpResent(this);
    }
    return orElse();
  }
}

abstract class _OtpResent implements AuthState {
  const factory _OtpResent(final String message) = _$OtpResentImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpResentImplCopyWith<_$OtpResentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordResetSentImplCopyWith<$Res> {
  factory _$$PasswordResetSentImplCopyWith(
    _$PasswordResetSentImpl value,
    $Res Function(_$PasswordResetSentImpl) then,
  ) = __$$PasswordResetSentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PasswordResetSentImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$PasswordResetSentImpl>
    implements _$$PasswordResetSentImplCopyWith<$Res> {
  __$$PasswordResetSentImplCopyWithImpl(
    _$PasswordResetSentImpl _value,
    $Res Function(_$PasswordResetSentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$PasswordResetSentImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$PasswordResetSentImpl implements _PasswordResetSent {
  const _$PasswordResetSentImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.passwordResetSent(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetSentImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordResetSentImplCopyWith<_$PasswordResetSentImpl> get copyWith =>
      __$$PasswordResetSentImplCopyWithImpl<_$PasswordResetSentImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoadingType type) loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(User user) signupSuccess,
    required TResult Function(String message) emailVerified,
    required TResult Function(String message) otpResent,
    required TResult Function(String message) passwordResetSent,
    required TResult Function(String message) resetTokenVerified,
    required TResult Function(String message) passwordReset,
    required TResult Function(String message, bool isNetworkError) error,
  }) {
    return passwordResetSent(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoadingType type)? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(User user)? signupSuccess,
    TResult? Function(String message)? emailVerified,
    TResult? Function(String message)? otpResent,
    TResult? Function(String message)? passwordResetSent,
    TResult? Function(String message)? resetTokenVerified,
    TResult? Function(String message)? passwordReset,
    TResult? Function(String message, bool isNetworkError)? error,
  }) {
    return passwordResetSent?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoadingType type)? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(User user)? signupSuccess,
    TResult Function(String message)? emailVerified,
    TResult Function(String message)? otpResent,
    TResult Function(String message)? passwordResetSent,
    TResult Function(String message)? resetTokenVerified,
    TResult Function(String message)? passwordReset,
    TResult Function(String message, bool isNetworkError)? error,
    required TResult orElse(),
  }) {
    if (passwordResetSent != null) {
      return passwordResetSent(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_SignupSuccess value) signupSuccess,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_PasswordResetSent value) passwordResetSent,
    required TResult Function(_ResetTokenVerified value) resetTokenVerified,
    required TResult Function(_PasswordReset value) passwordReset,
    required TResult Function(_Error value) error,
  }) {
    return passwordResetSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_SignupSuccess value)? signupSuccess,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_PasswordResetSent value)? passwordResetSent,
    TResult? Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult? Function(_PasswordReset value)? passwordReset,
    TResult? Function(_Error value)? error,
  }) {
    return passwordResetSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_SignupSuccess value)? signupSuccess,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_PasswordResetSent value)? passwordResetSent,
    TResult Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult Function(_PasswordReset value)? passwordReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (passwordResetSent != null) {
      return passwordResetSent(this);
    }
    return orElse();
  }
}

abstract class _PasswordResetSent implements AuthState {
  const factory _PasswordResetSent(final String message) =
      _$PasswordResetSentImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordResetSentImplCopyWith<_$PasswordResetSentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetTokenVerifiedImplCopyWith<$Res> {
  factory _$$ResetTokenVerifiedImplCopyWith(
    _$ResetTokenVerifiedImpl value,
    $Res Function(_$ResetTokenVerifiedImpl) then,
  ) = __$$ResetTokenVerifiedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ResetTokenVerifiedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ResetTokenVerifiedImpl>
    implements _$$ResetTokenVerifiedImplCopyWith<$Res> {
  __$$ResetTokenVerifiedImplCopyWithImpl(
    _$ResetTokenVerifiedImpl _value,
    $Res Function(_$ResetTokenVerifiedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ResetTokenVerifiedImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ResetTokenVerifiedImpl implements _ResetTokenVerified {
  const _$ResetTokenVerifiedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.resetTokenVerified(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetTokenVerifiedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetTokenVerifiedImplCopyWith<_$ResetTokenVerifiedImpl> get copyWith =>
      __$$ResetTokenVerifiedImplCopyWithImpl<_$ResetTokenVerifiedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoadingType type) loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(User user) signupSuccess,
    required TResult Function(String message) emailVerified,
    required TResult Function(String message) otpResent,
    required TResult Function(String message) passwordResetSent,
    required TResult Function(String message) resetTokenVerified,
    required TResult Function(String message) passwordReset,
    required TResult Function(String message, bool isNetworkError) error,
  }) {
    return resetTokenVerified(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoadingType type)? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(User user)? signupSuccess,
    TResult? Function(String message)? emailVerified,
    TResult? Function(String message)? otpResent,
    TResult? Function(String message)? passwordResetSent,
    TResult? Function(String message)? resetTokenVerified,
    TResult? Function(String message)? passwordReset,
    TResult? Function(String message, bool isNetworkError)? error,
  }) {
    return resetTokenVerified?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoadingType type)? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(User user)? signupSuccess,
    TResult Function(String message)? emailVerified,
    TResult Function(String message)? otpResent,
    TResult Function(String message)? passwordResetSent,
    TResult Function(String message)? resetTokenVerified,
    TResult Function(String message)? passwordReset,
    TResult Function(String message, bool isNetworkError)? error,
    required TResult orElse(),
  }) {
    if (resetTokenVerified != null) {
      return resetTokenVerified(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_SignupSuccess value) signupSuccess,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_PasswordResetSent value) passwordResetSent,
    required TResult Function(_ResetTokenVerified value) resetTokenVerified,
    required TResult Function(_PasswordReset value) passwordReset,
    required TResult Function(_Error value) error,
  }) {
    return resetTokenVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_SignupSuccess value)? signupSuccess,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_PasswordResetSent value)? passwordResetSent,
    TResult? Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult? Function(_PasswordReset value)? passwordReset,
    TResult? Function(_Error value)? error,
  }) {
    return resetTokenVerified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_SignupSuccess value)? signupSuccess,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_PasswordResetSent value)? passwordResetSent,
    TResult Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult Function(_PasswordReset value)? passwordReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (resetTokenVerified != null) {
      return resetTokenVerified(this);
    }
    return orElse();
  }
}

abstract class _ResetTokenVerified implements AuthState {
  const factory _ResetTokenVerified(final String message) =
      _$ResetTokenVerifiedImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetTokenVerifiedImplCopyWith<_$ResetTokenVerifiedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordResetImplCopyWith<$Res> {
  factory _$$PasswordResetImplCopyWith(
    _$PasswordResetImpl value,
    $Res Function(_$PasswordResetImpl) then,
  ) = __$$PasswordResetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PasswordResetImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$PasswordResetImpl>
    implements _$$PasswordResetImplCopyWith<$Res> {
  __$$PasswordResetImplCopyWithImpl(
    _$PasswordResetImpl _value,
    $Res Function(_$PasswordResetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$PasswordResetImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$PasswordResetImpl implements _PasswordReset {
  const _$PasswordResetImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.passwordReset(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordResetImplCopyWith<_$PasswordResetImpl> get copyWith =>
      __$$PasswordResetImplCopyWithImpl<_$PasswordResetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoadingType type) loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(User user) signupSuccess,
    required TResult Function(String message) emailVerified,
    required TResult Function(String message) otpResent,
    required TResult Function(String message) passwordResetSent,
    required TResult Function(String message) resetTokenVerified,
    required TResult Function(String message) passwordReset,
    required TResult Function(String message, bool isNetworkError) error,
  }) {
    return passwordReset(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoadingType type)? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(User user)? signupSuccess,
    TResult? Function(String message)? emailVerified,
    TResult? Function(String message)? otpResent,
    TResult? Function(String message)? passwordResetSent,
    TResult? Function(String message)? resetTokenVerified,
    TResult? Function(String message)? passwordReset,
    TResult? Function(String message, bool isNetworkError)? error,
  }) {
    return passwordReset?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoadingType type)? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(User user)? signupSuccess,
    TResult Function(String message)? emailVerified,
    TResult Function(String message)? otpResent,
    TResult Function(String message)? passwordResetSent,
    TResult Function(String message)? resetTokenVerified,
    TResult Function(String message)? passwordReset,
    TResult Function(String message, bool isNetworkError)? error,
    required TResult orElse(),
  }) {
    if (passwordReset != null) {
      return passwordReset(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_SignupSuccess value) signupSuccess,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_PasswordResetSent value) passwordResetSent,
    required TResult Function(_ResetTokenVerified value) resetTokenVerified,
    required TResult Function(_PasswordReset value) passwordReset,
    required TResult Function(_Error value) error,
  }) {
    return passwordReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_SignupSuccess value)? signupSuccess,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_PasswordResetSent value)? passwordResetSent,
    TResult? Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult? Function(_PasswordReset value)? passwordReset,
    TResult? Function(_Error value)? error,
  }) {
    return passwordReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_SignupSuccess value)? signupSuccess,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_PasswordResetSent value)? passwordResetSent,
    TResult Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult Function(_PasswordReset value)? passwordReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (passwordReset != null) {
      return passwordReset(this);
    }
    return orElse();
  }
}

abstract class _PasswordReset implements AuthState {
  const factory _PasswordReset(final String message) = _$PasswordResetImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordResetImplCopyWith<_$PasswordResetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, bool isNetworkError});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? isNetworkError = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
        isNetworkError:
            null == isNetworkError
                ? _value.isNetworkError
                : isNetworkError // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message, {this.isNetworkError = false});

  @override
  final String message;
  @override
  @JsonKey()
  final bool isNetworkError;

  @override
  String toString() {
    return 'AuthState.error(message: $message, isNetworkError: $isNetworkError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isNetworkError, isNetworkError) ||
                other.isNetworkError == isNetworkError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isNetworkError);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoadingType type) loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(User user) signupSuccess,
    required TResult Function(String message) emailVerified,
    required TResult Function(String message) otpResent,
    required TResult Function(String message) passwordResetSent,
    required TResult Function(String message) resetTokenVerified,
    required TResult Function(String message) passwordReset,
    required TResult Function(String message, bool isNetworkError) error,
  }) {
    return error(message, isNetworkError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoadingType type)? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(User user)? signupSuccess,
    TResult? Function(String message)? emailVerified,
    TResult? Function(String message)? otpResent,
    TResult? Function(String message)? passwordResetSent,
    TResult? Function(String message)? resetTokenVerified,
    TResult? Function(String message)? passwordReset,
    TResult? Function(String message, bool isNetworkError)? error,
  }) {
    return error?.call(message, isNetworkError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoadingType type)? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(User user)? signupSuccess,
    TResult Function(String message)? emailVerified,
    TResult Function(String message)? otpResent,
    TResult Function(String message)? passwordResetSent,
    TResult Function(String message)? resetTokenVerified,
    TResult Function(String message)? passwordReset,
    TResult Function(String message, bool isNetworkError)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, isNetworkError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_SignupSuccess value) signupSuccess,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_OtpResent value) otpResent,
    required TResult Function(_PasswordResetSent value) passwordResetSent,
    required TResult Function(_ResetTokenVerified value) resetTokenVerified,
    required TResult Function(_PasswordReset value) passwordReset,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_SignupSuccess value)? signupSuccess,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_OtpResent value)? otpResent,
    TResult? Function(_PasswordResetSent value)? passwordResetSent,
    TResult? Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult? Function(_PasswordReset value)? passwordReset,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_SignupSuccess value)? signupSuccess,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_OtpResent value)? otpResent,
    TResult Function(_PasswordResetSent value)? passwordResetSent,
    TResult Function(_ResetTokenVerified value)? resetTokenVerified,
    TResult Function(_PasswordReset value)? passwordReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error(final String message, {final bool isNetworkError}) =
      _$ErrorImpl;

  String get message;
  bool get isNetworkError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
