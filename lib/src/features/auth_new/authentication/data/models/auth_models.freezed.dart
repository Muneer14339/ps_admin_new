// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'first_name') String firstName,
    String email,
    String? location,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  });
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? email = null,
    Object? location = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            firstName:
                null == firstName
                    ? _value.firstName
                    : firstName // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            location:
                freezed == location
                    ? _value.location
                    : location // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'first_name') String firstName,
    String email,
    String? location,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  });
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? email = null,
    Object? location = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$UserModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        firstName:
            null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        location:
            freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl({
    required this.id,
    @JsonKey(name: 'first_name') required this.firstName,
    required this.email,
    this.location,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  }) : super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  final String email;
  @override
  final String? location;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, email: $email, location: $location, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    firstName,
    email,
    location,
    createdAt,
    updatedAt,
  );

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel({
    required final String id,
    @JsonKey(name: 'first_name') required final String firstName,
    required final String email,
    final String? location,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
  }) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  String get email;
  @override
  String? get location;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) {
  return _SignupRequest.fromJson(json);
}

/// @nodoc
mixin _$SignupRequest {
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_default_coach')
  bool get hasDefaultCoach => throw _privateConstructorUsedError;

  /// Serializes this SignupRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignupRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignupRequestCopyWith<SignupRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupRequestCopyWith<$Res> {
  factory $SignupRequestCopyWith(
    SignupRequest value,
    $Res Function(SignupRequest) then,
  ) = _$SignupRequestCopyWithImpl<$Res, SignupRequest>;
  @useResult
  $Res call({
    String email,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String password,
    @JsonKey(name: 'has_default_coach') bool hasDefaultCoach,
  });
}

/// @nodoc
class _$SignupRequestCopyWithImpl<$Res, $Val extends SignupRequest>
    implements $SignupRequestCopyWith<$Res> {
  _$SignupRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignupRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? password = null,
    Object? hasDefaultCoach = null,
  }) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            firstName:
                null == firstName
                    ? _value.firstName
                    : firstName // ignore: cast_nullable_to_non_nullable
                        as String,
            lastName:
                null == lastName
                    ? _value.lastName
                    : lastName // ignore: cast_nullable_to_non_nullable
                        as String,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
            hasDefaultCoach:
                null == hasDefaultCoach
                    ? _value.hasDefaultCoach
                    : hasDefaultCoach // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SignupRequestImplCopyWith<$Res>
    implements $SignupRequestCopyWith<$Res> {
  factory _$$SignupRequestImplCopyWith(
    _$SignupRequestImpl value,
    $Res Function(_$SignupRequestImpl) then,
  ) = __$$SignupRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String password,
    @JsonKey(name: 'has_default_coach') bool hasDefaultCoach,
  });
}

/// @nodoc
class __$$SignupRequestImplCopyWithImpl<$Res>
    extends _$SignupRequestCopyWithImpl<$Res, _$SignupRequestImpl>
    implements _$$SignupRequestImplCopyWith<$Res> {
  __$$SignupRequestImplCopyWithImpl(
    _$SignupRequestImpl _value,
    $Res Function(_$SignupRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignupRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? password = null,
    Object? hasDefaultCoach = null,
  }) {
    return _then(
      _$SignupRequestImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        firstName:
            null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                    as String,
        lastName:
            null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                    as String,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
        hasDefaultCoach:
            null == hasDefaultCoach
                ? _value.hasDefaultCoach
                : hasDefaultCoach // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupRequestImpl extends _SignupRequest {
  const _$SignupRequestImpl({
    required this.email,
    @JsonKey(name: 'first_name') required this.firstName,
    @JsonKey(name: 'last_name') required this.lastName,
    required this.password,
    @JsonKey(name: 'has_default_coach') this.hasDefaultCoach = true,
  }) : super._();

  factory _$SignupRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupRequestImplFromJson(json);

  @override
  final String email;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String password;
  @override
  @JsonKey(name: 'has_default_coach')
  final bool hasDefaultCoach;

  @override
  String toString() {
    return 'SignupRequest(email: $email, firstName: $firstName, lastName: $lastName, password: $password, hasDefaultCoach: $hasDefaultCoach)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.hasDefaultCoach, hasDefaultCoach) ||
                other.hasDefaultCoach == hasDefaultCoach));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    email,
    firstName,
    lastName,
    password,
    hasDefaultCoach,
  );

  /// Create a copy of SignupRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupRequestImplCopyWith<_$SignupRequestImpl> get copyWith =>
      __$$SignupRequestImplCopyWithImpl<_$SignupRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupRequestImplToJson(this);
  }
}

abstract class _SignupRequest extends SignupRequest {
  const factory _SignupRequest({
    required final String email,
    @JsonKey(name: 'first_name') required final String firstName,
    @JsonKey(name: 'last_name') required final String lastName,
    required final String password,
    @JsonKey(name: 'has_default_coach') final bool hasDefaultCoach,
  }) = _$SignupRequestImpl;
  const _SignupRequest._() : super._();

  factory _SignupRequest.fromJson(Map<String, dynamic> json) =
      _$SignupRequestImpl.fromJson;

  @override
  String get email;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get password;
  @override
  @JsonKey(name: 'has_default_coach')
  bool get hasDefaultCoach;

  /// Create a copy of SignupRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupRequestImplCopyWith<_$SignupRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return _LoginRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this LoginRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
    LoginRequest value,
    $Res Function(LoginRequest) then,
  ) = _$LoginRequestCopyWithImpl<$Res, LoginRequest>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginRequestCopyWithImpl<$Res, $Val extends LoginRequest>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginRequestImplCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$$LoginRequestImplCopyWith(
    _$LoginRequestImpl value,
    $Res Function(_$LoginRequestImpl) then,
  ) = __$$LoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginRequestImplCopyWithImpl<$Res>
    extends _$LoginRequestCopyWithImpl<$Res, _$LoginRequestImpl>
    implements _$$LoginRequestImplCopyWith<$Res> {
  __$$LoginRequestImplCopyWithImpl(
    _$LoginRequestImpl _value,
    $Res Function(_$LoginRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$LoginRequestImpl(
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
@JsonSerializable()
class _$LoginRequestImpl implements _LoginRequest {
  const _$LoginRequestImpl({required this.email, required this.password});

  factory _$LoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginRequest(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      __$$LoginRequestImplCopyWithImpl<_$LoginRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestImplToJson(this);
  }
}

abstract class _LoginRequest implements LoginRequest {
  const factory _LoginRequest({
    required final String email,
    required final String password,
  }) = _$LoginRequestImpl;

  factory _LoginRequest.fromJson(Map<String, dynamic> json) =
      _$LoginRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GoogleSignInRequest _$GoogleSignInRequestFromJson(Map<String, dynamic> json) {
  return _GoogleSignInRequest.fromJson(json);
}

/// @nodoc
mixin _$GoogleSignInRequest {
  String get idToken => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;

  /// Serializes this GoogleSignInRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoogleSignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoogleSignInRequestCopyWith<GoogleSignInRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleSignInRequestCopyWith<$Res> {
  factory $GoogleSignInRequestCopyWith(
    GoogleSignInRequest value,
    $Res Function(GoogleSignInRequest) then,
  ) = _$GoogleSignInRequestCopyWithImpl<$Res, GoogleSignInRequest>;
  @useResult
  $Res call({String idToken, String? accessToken});
}

/// @nodoc
class _$GoogleSignInRequestCopyWithImpl<$Res, $Val extends GoogleSignInRequest>
    implements $GoogleSignInRequestCopyWith<$Res> {
  _$GoogleSignInRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoogleSignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? idToken = null, Object? accessToken = freezed}) {
    return _then(
      _value.copyWith(
            idToken:
                null == idToken
                    ? _value.idToken
                    : idToken // ignore: cast_nullable_to_non_nullable
                        as String,
            accessToken:
                freezed == accessToken
                    ? _value.accessToken
                    : accessToken // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GoogleSignInRequestImplCopyWith<$Res>
    implements $GoogleSignInRequestCopyWith<$Res> {
  factory _$$GoogleSignInRequestImplCopyWith(
    _$GoogleSignInRequestImpl value,
    $Res Function(_$GoogleSignInRequestImpl) then,
  ) = __$$GoogleSignInRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idToken, String? accessToken});
}

/// @nodoc
class __$$GoogleSignInRequestImplCopyWithImpl<$Res>
    extends _$GoogleSignInRequestCopyWithImpl<$Res, _$GoogleSignInRequestImpl>
    implements _$$GoogleSignInRequestImplCopyWith<$Res> {
  __$$GoogleSignInRequestImplCopyWithImpl(
    _$GoogleSignInRequestImpl _value,
    $Res Function(_$GoogleSignInRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GoogleSignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? idToken = null, Object? accessToken = freezed}) {
    return _then(
      _$GoogleSignInRequestImpl(
        idToken:
            null == idToken
                ? _value.idToken
                : idToken // ignore: cast_nullable_to_non_nullable
                    as String,
        accessToken:
            freezed == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GoogleSignInRequestImpl implements _GoogleSignInRequest {
  const _$GoogleSignInRequestImpl({required this.idToken, this.accessToken});

  factory _$GoogleSignInRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoogleSignInRequestImplFromJson(json);

  @override
  final String idToken;
  @override
  final String? accessToken;

  @override
  String toString() {
    return 'GoogleSignInRequest(idToken: $idToken, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleSignInRequestImpl &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idToken, accessToken);

  /// Create a copy of GoogleSignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleSignInRequestImplCopyWith<_$GoogleSignInRequestImpl> get copyWith =>
      __$$GoogleSignInRequestImplCopyWithImpl<_$GoogleSignInRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GoogleSignInRequestImplToJson(this);
  }
}

abstract class _GoogleSignInRequest implements GoogleSignInRequest {
  const factory _GoogleSignInRequest({
    required final String idToken,
    final String? accessToken,
  }) = _$GoogleSignInRequestImpl;

  factory _GoogleSignInRequest.fromJson(Map<String, dynamic> json) =
      _$GoogleSignInRequestImpl.fromJson;

  @override
  String get idToken;
  @override
  String? get accessToken;

  /// Create a copy of GoogleSignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoogleSignInRequestImplCopyWith<_$GoogleSignInRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) {
  return _SignupResponse.fromJson(json);
}

/// @nodoc
mixin _$SignupResponse {
  String get email => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;

  /// Serializes this SignupResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignupResponseCopyWith<SignupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupResponseCopyWith<$Res> {
  factory $SignupResponseCopyWith(
    SignupResponse value,
    $Res Function(SignupResponse) then,
  ) = _$SignupResponseCopyWithImpl<$Res, SignupResponse>;
  @useResult
  $Res call({
    String email,
    String message,
    @JsonKey(name: 'user_id') String userId,
  });
}

/// @nodoc
class _$SignupResponseCopyWithImpl<$Res, $Val extends SignupResponse>
    implements $SignupResponseCopyWith<$Res> {
  _$SignupResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? message = null,
    Object? userId = null,
  }) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SignupResponseImplCopyWith<$Res>
    implements $SignupResponseCopyWith<$Res> {
  factory _$$SignupResponseImplCopyWith(
    _$SignupResponseImpl value,
    $Res Function(_$SignupResponseImpl) then,
  ) = __$$SignupResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    String message,
    @JsonKey(name: 'user_id') String userId,
  });
}

/// @nodoc
class __$$SignupResponseImplCopyWithImpl<$Res>
    extends _$SignupResponseCopyWithImpl<$Res, _$SignupResponseImpl>
    implements _$$SignupResponseImplCopyWith<$Res> {
  __$$SignupResponseImplCopyWithImpl(
    _$SignupResponseImpl _value,
    $Res Function(_$SignupResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? message = null,
    Object? userId = null,
  }) {
    return _then(
      _$SignupResponseImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupResponseImpl implements _SignupResponse {
  const _$SignupResponseImpl({
    required this.email,
    required this.message,
    @JsonKey(name: 'user_id') required this.userId,
  });

  factory _$SignupResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupResponseImplFromJson(json);

  @override
  final String email;
  @override
  final String message;
  @override
  @JsonKey(name: 'user_id')
  final String userId;

  @override
  String toString() {
    return 'SignupResponse(email: $email, message: $message, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupResponseImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, message, userId);

  /// Create a copy of SignupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupResponseImplCopyWith<_$SignupResponseImpl> get copyWith =>
      __$$SignupResponseImplCopyWithImpl<_$SignupResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupResponseImplToJson(this);
  }
}

abstract class _SignupResponse implements SignupResponse {
  const factory _SignupResponse({
    required final String email,
    required final String message,
    @JsonKey(name: 'user_id') required final String userId,
  }) = _$SignupResponseImpl;

  factory _SignupResponse.fromJson(Map<String, dynamic> json) =
      _$SignupResponseImpl.fromJson;

  @override
  String get email;
  @override
  String get message;
  @override
  @JsonKey(name: 'user_id')
  String get userId;

  /// Create a copy of SignupResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupResponseImplCopyWith<_$SignupResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ForgotPasswordRequest _$ForgotPasswordRequestFromJson(
  Map<String, dynamic> json,
) {
  return _ForgotPasswordRequest.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordRequest {
  String get email => throw _privateConstructorUsedError;

  /// Serializes this ForgotPasswordRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPasswordRequestCopyWith<ForgotPasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordRequestCopyWith<$Res> {
  factory $ForgotPasswordRequestCopyWith(
    ForgotPasswordRequest value,
    $Res Function(ForgotPasswordRequest) then,
  ) = _$ForgotPasswordRequestCopyWithImpl<$Res, ForgotPasswordRequest>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPasswordRequestCopyWithImpl<
  $Res,
  $Val extends ForgotPasswordRequest
>
    implements $ForgotPasswordRequestCopyWith<$Res> {
  _$ForgotPasswordRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForgotPasswordRequestImplCopyWith<$Res>
    implements $ForgotPasswordRequestCopyWith<$Res> {
  factory _$$ForgotPasswordRequestImplCopyWith(
    _$ForgotPasswordRequestImpl value,
    $Res Function(_$ForgotPasswordRequestImpl) then,
  ) = __$$ForgotPasswordRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPasswordRequestImplCopyWithImpl<$Res>
    extends
        _$ForgotPasswordRequestCopyWithImpl<$Res, _$ForgotPasswordRequestImpl>
    implements _$$ForgotPasswordRequestImplCopyWith<$Res> {
  __$$ForgotPasswordRequestImplCopyWithImpl(
    _$ForgotPasswordRequestImpl _value,
    $Res Function(_$ForgotPasswordRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$ForgotPasswordRequestImpl(
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
@JsonSerializable()
class _$ForgotPasswordRequestImpl implements _ForgotPasswordRequest {
  const _$ForgotPasswordRequestImpl({required this.email});

  factory _$ForgotPasswordRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgotPasswordRequestImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordRequest(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordRequestImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ForgotPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordRequestImplCopyWith<_$ForgotPasswordRequestImpl>
  get copyWith =>
      __$$ForgotPasswordRequestImplCopyWithImpl<_$ForgotPasswordRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPasswordRequestImplToJson(this);
  }
}

abstract class _ForgotPasswordRequest implements ForgotPasswordRequest {
  const factory _ForgotPasswordRequest({required final String email}) =
      _$ForgotPasswordRequestImpl;

  factory _ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =
      _$ForgotPasswordRequestImpl.fromJson;

  @override
  String get email;

  /// Create a copy of ForgotPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordRequestImplCopyWith<_$ForgotPasswordRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ForgotPasswordResponse.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordResponse {
  String get email => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this ForgotPasswordResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPasswordResponseCopyWith<ForgotPasswordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordResponseCopyWith<$Res> {
  factory $ForgotPasswordResponseCopyWith(
    ForgotPasswordResponse value,
    $Res Function(ForgotPasswordResponse) then,
  ) = _$ForgotPasswordResponseCopyWithImpl<$Res, ForgotPasswordResponse>;
  @useResult
  $Res call({String email, String message});
}

/// @nodoc
class _$ForgotPasswordResponseCopyWithImpl<
  $Res,
  $Val extends ForgotPasswordResponse
>
    implements $ForgotPasswordResponseCopyWith<$Res> {
  _$ForgotPasswordResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? message = null}) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForgotPasswordResponseImplCopyWith<$Res>
    implements $ForgotPasswordResponseCopyWith<$Res> {
  factory _$$ForgotPasswordResponseImplCopyWith(
    _$ForgotPasswordResponseImpl value,
    $Res Function(_$ForgotPasswordResponseImpl) then,
  ) = __$$ForgotPasswordResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String message});
}

/// @nodoc
class __$$ForgotPasswordResponseImplCopyWithImpl<$Res>
    extends
        _$ForgotPasswordResponseCopyWithImpl<$Res, _$ForgotPasswordResponseImpl>
    implements _$$ForgotPasswordResponseImplCopyWith<$Res> {
  __$$ForgotPasswordResponseImplCopyWithImpl(
    _$ForgotPasswordResponseImpl _value,
    $Res Function(_$ForgotPasswordResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? message = null}) {
    return _then(
      _$ForgotPasswordResponseImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgotPasswordResponseImpl implements _ForgotPasswordResponse {
  const _$ForgotPasswordResponseImpl({
    required this.email,
    this.message = 'Password reset code has been sent to your email',
  });

  factory _$ForgotPasswordResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgotPasswordResponseImplFromJson(json);

  @override
  final String email;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'ForgotPasswordResponse(email: $email, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordResponseImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, message);

  /// Create a copy of ForgotPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordResponseImplCopyWith<_$ForgotPasswordResponseImpl>
  get copyWith =>
      __$$ForgotPasswordResponseImplCopyWithImpl<_$ForgotPasswordResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPasswordResponseImplToJson(this);
  }
}

abstract class _ForgotPasswordResponse implements ForgotPasswordResponse {
  const factory _ForgotPasswordResponse({
    required final String email,
    final String message,
  }) = _$ForgotPasswordResponseImpl;

  factory _ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =
      _$ForgotPasswordResponseImpl.fromJson;

  @override
  String get email;
  @override
  String get message;

  /// Create a copy of ForgotPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordResponseImplCopyWith<_$ForgotPasswordResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ResetPasswordResponse _$ResetPasswordResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ResetPasswordResponse.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordResponse {
  String get message => throw _privateConstructorUsedError;

  /// Serializes this ResetPasswordResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResetPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPasswordResponseCopyWith<ResetPasswordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordResponseCopyWith<$Res> {
  factory $ResetPasswordResponseCopyWith(
    ResetPasswordResponse value,
    $Res Function(ResetPasswordResponse) then,
  ) = _$ResetPasswordResponseCopyWithImpl<$Res, ResetPasswordResponse>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ResetPasswordResponseCopyWithImpl<
  $Res,
  $Val extends ResetPasswordResponse
>
    implements $ResetPasswordResponseCopyWith<$Res> {
  _$ResetPasswordResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _value.copyWith(
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResetPasswordResponseImplCopyWith<$Res>
    implements $ResetPasswordResponseCopyWith<$Res> {
  factory _$$ResetPasswordResponseImplCopyWith(
    _$ResetPasswordResponseImpl value,
    $Res Function(_$ResetPasswordResponseImpl) then,
  ) = __$$ResetPasswordResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ResetPasswordResponseImplCopyWithImpl<$Res>
    extends
        _$ResetPasswordResponseCopyWithImpl<$Res, _$ResetPasswordResponseImpl>
    implements _$$ResetPasswordResponseImplCopyWith<$Res> {
  __$$ResetPasswordResponseImplCopyWithImpl(
    _$ResetPasswordResponseImpl _value,
    $Res Function(_$ResetPasswordResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResetPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ResetPasswordResponseImpl(
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPasswordResponseImpl implements _ResetPasswordResponse {
  const _$ResetPasswordResponseImpl({
    this.message = 'Password reset successfully!',
  });

  factory _$ResetPasswordResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPasswordResponseImplFromJson(json);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'ResetPasswordResponse(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordResponseImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ResetPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordResponseImplCopyWith<_$ResetPasswordResponseImpl>
  get copyWith =>
      __$$ResetPasswordResponseImplCopyWithImpl<_$ResetPasswordResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPasswordResponseImplToJson(this);
  }
}

abstract class _ResetPasswordResponse implements ResetPasswordResponse {
  const factory _ResetPasswordResponse({final String message}) =
      _$ResetPasswordResponseImpl;

  factory _ResetPasswordResponse.fromJson(Map<String, dynamic> json) =
      _$ResetPasswordResponseImpl.fromJson;

  @override
  String get message;

  /// Create a copy of ResetPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordResponseImplCopyWith<_$ResetPasswordResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

VerifyResetTokenRequest _$VerifyResetTokenRequestFromJson(
  Map<String, dynamic> json,
) {
  return _VerifyResetTokenRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyResetTokenRequest {
  String get token => throw _privateConstructorUsedError;

  /// Serializes this VerifyResetTokenRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyResetTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyResetTokenRequestCopyWith<VerifyResetTokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyResetTokenRequestCopyWith<$Res> {
  factory $VerifyResetTokenRequestCopyWith(
    VerifyResetTokenRequest value,
    $Res Function(VerifyResetTokenRequest) then,
  ) = _$VerifyResetTokenRequestCopyWithImpl<$Res, VerifyResetTokenRequest>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$VerifyResetTokenRequestCopyWithImpl<
  $Res,
  $Val extends VerifyResetTokenRequest
>
    implements $VerifyResetTokenRequestCopyWith<$Res> {
  _$VerifyResetTokenRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyResetTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null}) {
    return _then(
      _value.copyWith(
            token:
                null == token
                    ? _value.token
                    : token // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VerifyResetTokenRequestImplCopyWith<$Res>
    implements $VerifyResetTokenRequestCopyWith<$Res> {
  factory _$$VerifyResetTokenRequestImplCopyWith(
    _$VerifyResetTokenRequestImpl value,
    $Res Function(_$VerifyResetTokenRequestImpl) then,
  ) = __$$VerifyResetTokenRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$VerifyResetTokenRequestImplCopyWithImpl<$Res>
    extends
        _$VerifyResetTokenRequestCopyWithImpl<
          $Res,
          _$VerifyResetTokenRequestImpl
        >
    implements _$$VerifyResetTokenRequestImplCopyWith<$Res> {
  __$$VerifyResetTokenRequestImplCopyWithImpl(
    _$VerifyResetTokenRequestImpl _value,
    $Res Function(_$VerifyResetTokenRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VerifyResetTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null}) {
    return _then(
      _$VerifyResetTokenRequestImpl(
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
@JsonSerializable()
class _$VerifyResetTokenRequestImpl implements _VerifyResetTokenRequest {
  const _$VerifyResetTokenRequestImpl({required this.token});

  factory _$VerifyResetTokenRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyResetTokenRequestImplFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'VerifyResetTokenRequest(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyResetTokenRequestImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of VerifyResetTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyResetTokenRequestImplCopyWith<_$VerifyResetTokenRequestImpl>
  get copyWith => __$$VerifyResetTokenRequestImplCopyWithImpl<
    _$VerifyResetTokenRequestImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyResetTokenRequestImplToJson(this);
  }
}

abstract class _VerifyResetTokenRequest implements VerifyResetTokenRequest {
  const factory _VerifyResetTokenRequest({required final String token}) =
      _$VerifyResetTokenRequestImpl;

  factory _VerifyResetTokenRequest.fromJson(Map<String, dynamic> json) =
      _$VerifyResetTokenRequestImpl.fromJson;

  @override
  String get token;

  /// Create a copy of VerifyResetTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyResetTokenRequestImplCopyWith<_$VerifyResetTokenRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

VerifyResetTokenResponse _$VerifyResetTokenResponseFromJson(
  Map<String, dynamic> json,
) {
  return _VerifyResetTokenResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyResetTokenResponse {
  String get email => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this VerifyResetTokenResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyResetTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyResetTokenResponseCopyWith<VerifyResetTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyResetTokenResponseCopyWith<$Res> {
  factory $VerifyResetTokenResponseCopyWith(
    VerifyResetTokenResponse value,
    $Res Function(VerifyResetTokenResponse) then,
  ) = _$VerifyResetTokenResponseCopyWithImpl<$Res, VerifyResetTokenResponse>;
  @useResult
  $Res call({String email, String message});
}

/// @nodoc
class _$VerifyResetTokenResponseCopyWithImpl<
  $Res,
  $Val extends VerifyResetTokenResponse
>
    implements $VerifyResetTokenResponseCopyWith<$Res> {
  _$VerifyResetTokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyResetTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? message = null}) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VerifyResetTokenResponseImplCopyWith<$Res>
    implements $VerifyResetTokenResponseCopyWith<$Res> {
  factory _$$VerifyResetTokenResponseImplCopyWith(
    _$VerifyResetTokenResponseImpl value,
    $Res Function(_$VerifyResetTokenResponseImpl) then,
  ) = __$$VerifyResetTokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String message});
}

/// @nodoc
class __$$VerifyResetTokenResponseImplCopyWithImpl<$Res>
    extends
        _$VerifyResetTokenResponseCopyWithImpl<
          $Res,
          _$VerifyResetTokenResponseImpl
        >
    implements _$$VerifyResetTokenResponseImplCopyWith<$Res> {
  __$$VerifyResetTokenResponseImplCopyWithImpl(
    _$VerifyResetTokenResponseImpl _value,
    $Res Function(_$VerifyResetTokenResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VerifyResetTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? message = null}) {
    return _then(
      _$VerifyResetTokenResponseImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyResetTokenResponseImpl implements _VerifyResetTokenResponse {
  const _$VerifyResetTokenResponseImpl({
    required this.email,
    this.message =
        'Verification code confirmed! You can now reset your password.',
  });

  factory _$VerifyResetTokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyResetTokenResponseImplFromJson(json);

  @override
  final String email;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'VerifyResetTokenResponse(email: $email, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyResetTokenResponseImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, message);

  /// Create a copy of VerifyResetTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyResetTokenResponseImplCopyWith<_$VerifyResetTokenResponseImpl>
  get copyWith => __$$VerifyResetTokenResponseImplCopyWithImpl<
    _$VerifyResetTokenResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyResetTokenResponseImplToJson(this);
  }
}

abstract class _VerifyResetTokenResponse implements VerifyResetTokenResponse {
  const factory _VerifyResetTokenResponse({
    required final String email,
    final String message,
  }) = _$VerifyResetTokenResponseImpl;

  factory _VerifyResetTokenResponse.fromJson(Map<String, dynamic> json) =
      _$VerifyResetTokenResponseImpl.fromJson;

  @override
  String get email;
  @override
  String get message;

  /// Create a copy of VerifyResetTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyResetTokenResponseImplCopyWith<_$VerifyResetTokenResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

VerifyEmailRequest _$VerifyEmailRequestFromJson(Map<String, dynamic> json) {
  return _VerifyEmailRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyEmailRequest {
  String get token => throw _privateConstructorUsedError;

  /// Serializes this VerifyEmailRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyEmailRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyEmailRequestCopyWith<VerifyEmailRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyEmailRequestCopyWith<$Res> {
  factory $VerifyEmailRequestCopyWith(
    VerifyEmailRequest value,
    $Res Function(VerifyEmailRequest) then,
  ) = _$VerifyEmailRequestCopyWithImpl<$Res, VerifyEmailRequest>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$VerifyEmailRequestCopyWithImpl<$Res, $Val extends VerifyEmailRequest>
    implements $VerifyEmailRequestCopyWith<$Res> {
  _$VerifyEmailRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyEmailRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null}) {
    return _then(
      _value.copyWith(
            token:
                null == token
                    ? _value.token
                    : token // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VerifyEmailRequestImplCopyWith<$Res>
    implements $VerifyEmailRequestCopyWith<$Res> {
  factory _$$VerifyEmailRequestImplCopyWith(
    _$VerifyEmailRequestImpl value,
    $Res Function(_$VerifyEmailRequestImpl) then,
  ) = __$$VerifyEmailRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$VerifyEmailRequestImplCopyWithImpl<$Res>
    extends _$VerifyEmailRequestCopyWithImpl<$Res, _$VerifyEmailRequestImpl>
    implements _$$VerifyEmailRequestImplCopyWith<$Res> {
  __$$VerifyEmailRequestImplCopyWithImpl(
    _$VerifyEmailRequestImpl _value,
    $Res Function(_$VerifyEmailRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VerifyEmailRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null}) {
    return _then(
      _$VerifyEmailRequestImpl(
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
@JsonSerializable()
class _$VerifyEmailRequestImpl implements _VerifyEmailRequest {
  const _$VerifyEmailRequestImpl({required this.token});

  factory _$VerifyEmailRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyEmailRequestImplFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'VerifyEmailRequest(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyEmailRequestImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of VerifyEmailRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyEmailRequestImplCopyWith<_$VerifyEmailRequestImpl> get copyWith =>
      __$$VerifyEmailRequestImplCopyWithImpl<_$VerifyEmailRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyEmailRequestImplToJson(this);
  }
}

abstract class _VerifyEmailRequest implements VerifyEmailRequest {
  const factory _VerifyEmailRequest({required final String token}) =
      _$VerifyEmailRequestImpl;

  factory _VerifyEmailRequest.fromJson(Map<String, dynamic> json) =
      _$VerifyEmailRequestImpl.fromJson;

  @override
  String get token;

  /// Create a copy of VerifyEmailRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyEmailRequestImplCopyWith<_$VerifyEmailRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerifyEmailResponse _$VerifyEmailResponseFromJson(Map<String, dynamic> json) {
  return _VerifyEmailResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyEmailResponse {
  @JsonKey(name: 'coach_name')
  String get coachName => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_coach')
  bool get hasCoach => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_approved_by_admin')
  String get isApprovedByAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_type')
  String get userType => throw _privateConstructorUsedError;

  /// Serializes this VerifyEmailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyEmailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyEmailResponseCopyWith<VerifyEmailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyEmailResponseCopyWith<$Res> {
  factory $VerifyEmailResponseCopyWith(
    VerifyEmailResponse value,
    $Res Function(VerifyEmailResponse) then,
  ) = _$VerifyEmailResponseCopyWithImpl<$Res, VerifyEmailResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'coach_name') String coachName,
    @JsonKey(name: 'has_coach') bool hasCoach,
    String email,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'is_approved_by_admin') String isApprovedByAdmin,
    @JsonKey(name: 'last_name') String lastName,
    String token,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'user_type') String userType,
  });
}

/// @nodoc
class _$VerifyEmailResponseCopyWithImpl<$Res, $Val extends VerifyEmailResponse>
    implements $VerifyEmailResponseCopyWith<$Res> {
  _$VerifyEmailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyEmailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coachName = null,
    Object? hasCoach = null,
    Object? email = null,
    Object? firstName = null,
    Object? isApprovedByAdmin = null,
    Object? lastName = null,
    Object? token = null,
    Object? userId = null,
    Object? userType = null,
  }) {
    return _then(
      _value.copyWith(
            coachName:
                null == coachName
                    ? _value.coachName
                    : coachName // ignore: cast_nullable_to_non_nullable
                        as String,
            hasCoach:
                null == hasCoach
                    ? _value.hasCoach
                    : hasCoach // ignore: cast_nullable_to_non_nullable
                        as bool,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            firstName:
                null == firstName
                    ? _value.firstName
                    : firstName // ignore: cast_nullable_to_non_nullable
                        as String,
            isApprovedByAdmin:
                null == isApprovedByAdmin
                    ? _value.isApprovedByAdmin
                    : isApprovedByAdmin // ignore: cast_nullable_to_non_nullable
                        as String,
            lastName:
                null == lastName
                    ? _value.lastName
                    : lastName // ignore: cast_nullable_to_non_nullable
                        as String,
            token:
                null == token
                    ? _value.token
                    : token // ignore: cast_nullable_to_non_nullable
                        as String,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            userType:
                null == userType
                    ? _value.userType
                    : userType // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VerifyEmailResponseImplCopyWith<$Res>
    implements $VerifyEmailResponseCopyWith<$Res> {
  factory _$$VerifyEmailResponseImplCopyWith(
    _$VerifyEmailResponseImpl value,
    $Res Function(_$VerifyEmailResponseImpl) then,
  ) = __$$VerifyEmailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'coach_name') String coachName,
    @JsonKey(name: 'has_coach') bool hasCoach,
    String email,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'is_approved_by_admin') String isApprovedByAdmin,
    @JsonKey(name: 'last_name') String lastName,
    String token,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'user_type') String userType,
  });
}

/// @nodoc
class __$$VerifyEmailResponseImplCopyWithImpl<$Res>
    extends _$VerifyEmailResponseCopyWithImpl<$Res, _$VerifyEmailResponseImpl>
    implements _$$VerifyEmailResponseImplCopyWith<$Res> {
  __$$VerifyEmailResponseImplCopyWithImpl(
    _$VerifyEmailResponseImpl _value,
    $Res Function(_$VerifyEmailResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VerifyEmailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coachName = null,
    Object? hasCoach = null,
    Object? email = null,
    Object? firstName = null,
    Object? isApprovedByAdmin = null,
    Object? lastName = null,
    Object? token = null,
    Object? userId = null,
    Object? userType = null,
  }) {
    return _then(
      _$VerifyEmailResponseImpl(
        coachName:
            null == coachName
                ? _value.coachName
                : coachName // ignore: cast_nullable_to_non_nullable
                    as String,
        hasCoach:
            null == hasCoach
                ? _value.hasCoach
                : hasCoach // ignore: cast_nullable_to_non_nullable
                    as bool,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        firstName:
            null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                    as String,
        isApprovedByAdmin:
            null == isApprovedByAdmin
                ? _value.isApprovedByAdmin
                : isApprovedByAdmin // ignore: cast_nullable_to_non_nullable
                    as String,
        lastName:
            null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                    as String,
        token:
            null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        userType:
            null == userType
                ? _value.userType
                : userType // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyEmailResponseImpl implements _VerifyEmailResponse {
  const _$VerifyEmailResponseImpl({
    @JsonKey(name: 'coach_name') this.coachName = "",
    @JsonKey(name: 'has_coach') this.hasCoach = false,
    this.email = "",
    @JsonKey(name: 'first_name') this.firstName = "",
    @JsonKey(name: 'is_approved_by_admin') this.isApprovedByAdmin = "",
    @JsonKey(name: 'last_name') this.lastName = "",
    this.token = "",
    @JsonKey(name: 'user_id') this.userId = "",
    @JsonKey(name: 'user_type') this.userType = "",
  });

  factory _$VerifyEmailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyEmailResponseImplFromJson(json);

  @override
  @JsonKey(name: 'coach_name')
  final String coachName;
  @override
  @JsonKey(name: 'has_coach')
  final bool hasCoach;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'is_approved_by_admin')
  final String isApprovedByAdmin;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey()
  final String token;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'user_type')
  final String userType;

  @override
  String toString() {
    return 'VerifyEmailResponse(coachName: $coachName, hasCoach: $hasCoach, email: $email, firstName: $firstName, isApprovedByAdmin: $isApprovedByAdmin, lastName: $lastName, token: $token, userId: $userId, userType: $userType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyEmailResponseImpl &&
            (identical(other.coachName, coachName) ||
                other.coachName == coachName) &&
            (identical(other.hasCoach, hasCoach) ||
                other.hasCoach == hasCoach) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.isApprovedByAdmin, isApprovedByAdmin) ||
                other.isApprovedByAdmin == isApprovedByAdmin) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userType, userType) ||
                other.userType == userType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    coachName,
    hasCoach,
    email,
    firstName,
    isApprovedByAdmin,
    lastName,
    token,
    userId,
    userType,
  );

  /// Create a copy of VerifyEmailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyEmailResponseImplCopyWith<_$VerifyEmailResponseImpl> get copyWith =>
      __$$VerifyEmailResponseImplCopyWithImpl<_$VerifyEmailResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyEmailResponseImplToJson(this);
  }
}

abstract class _VerifyEmailResponse implements VerifyEmailResponse {
  const factory _VerifyEmailResponse({
    @JsonKey(name: 'coach_name') final String coachName,
    @JsonKey(name: 'has_coach') final bool hasCoach,
    final String email,
    @JsonKey(name: 'first_name') final String firstName,
    @JsonKey(name: 'is_approved_by_admin') final String isApprovedByAdmin,
    @JsonKey(name: 'last_name') final String lastName,
    final String token,
    @JsonKey(name: 'user_id') final String userId,
    @JsonKey(name: 'user_type') final String userType,
  }) = _$VerifyEmailResponseImpl;

  factory _VerifyEmailResponse.fromJson(Map<String, dynamic> json) =
      _$VerifyEmailResponseImpl.fromJson;

  @override
  @JsonKey(name: 'coach_name')
  String get coachName;
  @override
  @JsonKey(name: 'has_coach')
  bool get hasCoach;
  @override
  String get email;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'is_approved_by_admin')
  String get isApprovedByAdmin;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get token;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'user_type')
  String get userType;

  /// Create a copy of VerifyEmailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyEmailResponseImplCopyWith<_$VerifyEmailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return _AuthResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthResponse {
  String get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'certification_type')
  List<String> get certificationType => throw _privateConstructorUsedError;
  @JsonKey(name: 'certification_uploaded')
  bool get certificationUploaded => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_number')
  String? get contactNumber => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get experience => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_approved_by_admin')
  String get isApprovedByAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified_by_coach')
  bool get isVerifiedByCoach => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'redirect_url')
  String get redirectUrl => throw _privateConstructorUsedError;
  String get specialization => throw _privateConstructorUsedError;
  List<String> get specialties => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'training_philosophy')
  String? get trainingPhilosophy => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_type')
  String get userType => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResponseCopyWith<AuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
    AuthResponse value,
    $Res Function(AuthResponse) then,
  ) = _$AuthResponseCopyWithImpl<$Res, AuthResponse>;
  @useResult
  $Res call({
    String bio,
    @JsonKey(name: 'certification_type') List<String> certificationType,
    @JsonKey(name: 'certification_uploaded') bool certificationUploaded,
    @JsonKey(name: 'contact_number') String? contactNumber,
    String? country,
    String email,
    int experience,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'is_approved_by_admin') String isApprovedByAdmin,
    @JsonKey(name: 'is_verified_by_coach') bool isVerifiedByCoach,
    @JsonKey(name: 'last_name') String lastName,
    @JsonKey(name: 'redirect_url') String redirectUrl,
    String specialization,
    List<String> specialties,
    String token,
    @JsonKey(name: 'training_philosophy') String? trainingPhilosophy,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'user_type') String userType,
    String username,
    String? website,
  });
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res, $Val extends AuthResponse>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bio = null,
    Object? certificationType = null,
    Object? certificationUploaded = null,
    Object? contactNumber = freezed,
    Object? country = freezed,
    Object? email = null,
    Object? experience = null,
    Object? firstName = null,
    Object? isApprovedByAdmin = null,
    Object? isVerifiedByCoach = null,
    Object? lastName = null,
    Object? redirectUrl = null,
    Object? specialization = null,
    Object? specialties = null,
    Object? token = null,
    Object? trainingPhilosophy = freezed,
    Object? userId = null,
    Object? userType = null,
    Object? username = null,
    Object? website = freezed,
  }) {
    return _then(
      _value.copyWith(
            bio:
                null == bio
                    ? _value.bio
                    : bio // ignore: cast_nullable_to_non_nullable
                        as String,
            certificationType:
                null == certificationType
                    ? _value.certificationType
                    : certificationType // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            certificationUploaded:
                null == certificationUploaded
                    ? _value.certificationUploaded
                    : certificationUploaded // ignore: cast_nullable_to_non_nullable
                        as bool,
            contactNumber:
                freezed == contactNumber
                    ? _value.contactNumber
                    : contactNumber // ignore: cast_nullable_to_non_nullable
                        as String?,
            country:
                freezed == country
                    ? _value.country
                    : country // ignore: cast_nullable_to_non_nullable
                        as String?,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            experience:
                null == experience
                    ? _value.experience
                    : experience // ignore: cast_nullable_to_non_nullable
                        as int,
            firstName:
                null == firstName
                    ? _value.firstName
                    : firstName // ignore: cast_nullable_to_non_nullable
                        as String,
            isApprovedByAdmin:
                null == isApprovedByAdmin
                    ? _value.isApprovedByAdmin
                    : isApprovedByAdmin // ignore: cast_nullable_to_non_nullable
                        as String,
            isVerifiedByCoach:
                null == isVerifiedByCoach
                    ? _value.isVerifiedByCoach
                    : isVerifiedByCoach // ignore: cast_nullable_to_non_nullable
                        as bool,
            lastName:
                null == lastName
                    ? _value.lastName
                    : lastName // ignore: cast_nullable_to_non_nullable
                        as String,
            redirectUrl:
                null == redirectUrl
                    ? _value.redirectUrl
                    : redirectUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            specialization:
                null == specialization
                    ? _value.specialization
                    : specialization // ignore: cast_nullable_to_non_nullable
                        as String,
            specialties:
                null == specialties
                    ? _value.specialties
                    : specialties // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            token:
                null == token
                    ? _value.token
                    : token // ignore: cast_nullable_to_non_nullable
                        as String,
            trainingPhilosophy:
                freezed == trainingPhilosophy
                    ? _value.trainingPhilosophy
                    : trainingPhilosophy // ignore: cast_nullable_to_non_nullable
                        as String?,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            userType:
                null == userType
                    ? _value.userType
                    : userType // ignore: cast_nullable_to_non_nullable
                        as String,
            username:
                null == username
                    ? _value.username
                    : username // ignore: cast_nullable_to_non_nullable
                        as String,
            website:
                freezed == website
                    ? _value.website
                    : website // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthResponseImplCopyWith<$Res>
    implements $AuthResponseCopyWith<$Res> {
  factory _$$AuthResponseImplCopyWith(
    _$AuthResponseImpl value,
    $Res Function(_$AuthResponseImpl) then,
  ) = __$$AuthResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String bio,
    @JsonKey(name: 'certification_type') List<String> certificationType,
    @JsonKey(name: 'certification_uploaded') bool certificationUploaded,
    @JsonKey(name: 'contact_number') String? contactNumber,
    String? country,
    String email,
    int experience,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'is_approved_by_admin') String isApprovedByAdmin,
    @JsonKey(name: 'is_verified_by_coach') bool isVerifiedByCoach,
    @JsonKey(name: 'last_name') String lastName,
    @JsonKey(name: 'redirect_url') String redirectUrl,
    String specialization,
    List<String> specialties,
    String token,
    @JsonKey(name: 'training_philosophy') String? trainingPhilosophy,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'user_type') String userType,
    String username,
    String? website,
  });
}

/// @nodoc
class __$$AuthResponseImplCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$AuthResponseImpl>
    implements _$$AuthResponseImplCopyWith<$Res> {
  __$$AuthResponseImplCopyWithImpl(
    _$AuthResponseImpl _value,
    $Res Function(_$AuthResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bio = null,
    Object? certificationType = null,
    Object? certificationUploaded = null,
    Object? contactNumber = freezed,
    Object? country = freezed,
    Object? email = null,
    Object? experience = null,
    Object? firstName = null,
    Object? isApprovedByAdmin = null,
    Object? isVerifiedByCoach = null,
    Object? lastName = null,
    Object? redirectUrl = null,
    Object? specialization = null,
    Object? specialties = null,
    Object? token = null,
    Object? trainingPhilosophy = freezed,
    Object? userId = null,
    Object? userType = null,
    Object? username = null,
    Object? website = freezed,
  }) {
    return _then(
      _$AuthResponseImpl(
        bio:
            null == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                    as String,
        certificationType:
            null == certificationType
                ? _value._certificationType
                : certificationType // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        certificationUploaded:
            null == certificationUploaded
                ? _value.certificationUploaded
                : certificationUploaded // ignore: cast_nullable_to_non_nullable
                    as bool,
        contactNumber:
            freezed == contactNumber
                ? _value.contactNumber
                : contactNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
        country:
            freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                    as String?,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        experience:
            null == experience
                ? _value.experience
                : experience // ignore: cast_nullable_to_non_nullable
                    as int,
        firstName:
            null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                    as String,
        isApprovedByAdmin:
            null == isApprovedByAdmin
                ? _value.isApprovedByAdmin
                : isApprovedByAdmin // ignore: cast_nullable_to_non_nullable
                    as String,
        isVerifiedByCoach:
            null == isVerifiedByCoach
                ? _value.isVerifiedByCoach
                : isVerifiedByCoach // ignore: cast_nullable_to_non_nullable
                    as bool,
        lastName:
            null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                    as String,
        redirectUrl:
            null == redirectUrl
                ? _value.redirectUrl
                : redirectUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        specialization:
            null == specialization
                ? _value.specialization
                : specialization // ignore: cast_nullable_to_non_nullable
                    as String,
        specialties:
            null == specialties
                ? _value._specialties
                : specialties // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        token:
            null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String,
        trainingPhilosophy:
            freezed == trainingPhilosophy
                ? _value.trainingPhilosophy
                : trainingPhilosophy // ignore: cast_nullable_to_non_nullable
                    as String?,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        userType:
            null == userType
                ? _value.userType
                : userType // ignore: cast_nullable_to_non_nullable
                    as String,
        username:
            null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                    as String,
        website:
            freezed == website
                ? _value.website
                : website // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseImpl extends _AuthResponse {
  const _$AuthResponseImpl({
    this.bio = '',
    @JsonKey(name: 'certification_type')
    final List<String> certificationType = const [],
    @JsonKey(name: 'certification_uploaded') this.certificationUploaded = false,
    @JsonKey(name: 'contact_number') this.contactNumber,
    this.country,
    required this.email,
    this.experience = 0,
    @JsonKey(name: 'first_name') this.firstName = '',
    @JsonKey(name: 'is_approved_by_admin') this.isApprovedByAdmin = 'false',
    @JsonKey(name: 'is_verified_by_coach') this.isVerifiedByCoach = false,
    @JsonKey(name: 'last_name') this.lastName = '',
    @JsonKey(name: 'redirect_url') this.redirectUrl = '',
    this.specialization = '',
    final List<String> specialties = const [],
    required this.token,
    @JsonKey(name: 'training_philosophy') this.trainingPhilosophy,
    @JsonKey(name: 'user_id') required this.userId,
    @JsonKey(name: 'user_type') this.userType = 'user',
    this.username = '',
    this.website,
  }) : _certificationType = certificationType,
       _specialties = specialties,
       super._();

  factory _$AuthResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseImplFromJson(json);

  @override
  @JsonKey()
  final String bio;
  final List<String> _certificationType;
  @override
  @JsonKey(name: 'certification_type')
  List<String> get certificationType {
    if (_certificationType is EqualUnmodifiableListView)
      return _certificationType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_certificationType);
  }

  @override
  @JsonKey(name: 'certification_uploaded')
  final bool certificationUploaded;
  @override
  @JsonKey(name: 'contact_number')
  final String? contactNumber;
  @override
  final String? country;
  @override
  final String email;
  @override
  @JsonKey()
  final int experience;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'is_approved_by_admin')
  final String isApprovedByAdmin;
  @override
  @JsonKey(name: 'is_verified_by_coach')
  final bool isVerifiedByCoach;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'redirect_url')
  final String redirectUrl;
  @override
  @JsonKey()
  final String specialization;
  final List<String> _specialties;
  @override
  @JsonKey()
  List<String> get specialties {
    if (_specialties is EqualUnmodifiableListView) return _specialties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialties);
  }

  @override
  final String token;
  @override
  @JsonKey(name: 'training_philosophy')
  final String? trainingPhilosophy;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'user_type')
  final String userType;
  @override
  @JsonKey()
  final String username;
  @override
  final String? website;

  @override
  String toString() {
    return 'AuthResponse(bio: $bio, certificationType: $certificationType, certificationUploaded: $certificationUploaded, contactNumber: $contactNumber, country: $country, email: $email, experience: $experience, firstName: $firstName, isApprovedByAdmin: $isApprovedByAdmin, isVerifiedByCoach: $isVerifiedByCoach, lastName: $lastName, redirectUrl: $redirectUrl, specialization: $specialization, specialties: $specialties, token: $token, trainingPhilosophy: $trainingPhilosophy, userId: $userId, userType: $userType, username: $username, website: $website)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResponseImpl &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality().equals(
              other._certificationType,
              _certificationType,
            ) &&
            (identical(other.certificationUploaded, certificationUploaded) ||
                other.certificationUploaded == certificationUploaded) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.isApprovedByAdmin, isApprovedByAdmin) ||
                other.isApprovedByAdmin == isApprovedByAdmin) &&
            (identical(other.isVerifiedByCoach, isVerifiedByCoach) ||
                other.isVerifiedByCoach == isVerifiedByCoach) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.redirectUrl, redirectUrl) ||
                other.redirectUrl == redirectUrl) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            const DeepCollectionEquality().equals(
              other._specialties,
              _specialties,
            ) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.trainingPhilosophy, trainingPhilosophy) ||
                other.trainingPhilosophy == trainingPhilosophy) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.website, website) || other.website == website));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    bio,
    const DeepCollectionEquality().hash(_certificationType),
    certificationUploaded,
    contactNumber,
    country,
    email,
    experience,
    firstName,
    isApprovedByAdmin,
    isVerifiedByCoach,
    lastName,
    redirectUrl,
    specialization,
    const DeepCollectionEquality().hash(_specialties),
    token,
    trainingPhilosophy,
    userId,
    userType,
    username,
    website,
  ]);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      __$$AuthResponseImplCopyWithImpl<_$AuthResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseImplToJson(this);
  }
}

abstract class _AuthResponse extends AuthResponse {
  const factory _AuthResponse({
    final String bio,
    @JsonKey(name: 'certification_type') final List<String> certificationType,
    @JsonKey(name: 'certification_uploaded') final bool certificationUploaded,
    @JsonKey(name: 'contact_number') final String? contactNumber,
    final String? country,
    required final String email,
    final int experience,
    @JsonKey(name: 'first_name') final String firstName,
    @JsonKey(name: 'is_approved_by_admin') final String isApprovedByAdmin,
    @JsonKey(name: 'is_verified_by_coach') final bool isVerifiedByCoach,
    @JsonKey(name: 'last_name') final String lastName,
    @JsonKey(name: 'redirect_url') final String redirectUrl,
    final String specialization,
    final List<String> specialties,
    required final String token,
    @JsonKey(name: 'training_philosophy') final String? trainingPhilosophy,
    @JsonKey(name: 'user_id') required final String userId,
    @JsonKey(name: 'user_type') final String userType,
    final String username,
    final String? website,
  }) = _$AuthResponseImpl;
  const _AuthResponse._() : super._();

  factory _AuthResponse.fromJson(Map<String, dynamic> json) =
      _$AuthResponseImpl.fromJson;

  @override
  String get bio;
  @override
  @JsonKey(name: 'certification_type')
  List<String> get certificationType;
  @override
  @JsonKey(name: 'certification_uploaded')
  bool get certificationUploaded;
  @override
  @JsonKey(name: 'contact_number')
  String? get contactNumber;
  @override
  String? get country;
  @override
  String get email;
  @override
  int get experience;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'is_approved_by_admin')
  String get isApprovedByAdmin;
  @override
  @JsonKey(name: 'is_verified_by_coach')
  bool get isVerifiedByCoach;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(name: 'redirect_url')
  String get redirectUrl;
  @override
  String get specialization;
  @override
  List<String> get specialties;
  @override
  String get token;
  @override
  @JsonKey(name: 'training_philosophy')
  String? get trainingPhilosophy;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'user_type')
  String get userType;
  @override
  String get username;
  @override
  String? get website;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshTokenRequest _$RefreshTokenRequestFromJson(Map<String, dynamic> json) {
  return _RefreshTokenRequest.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenRequest {
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this RefreshTokenRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenRequestCopyWith<RefreshTokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenRequestCopyWith<$Res> {
  factory $RefreshTokenRequestCopyWith(
    RefreshTokenRequest value,
    $Res Function(RefreshTokenRequest) then,
  ) = _$RefreshTokenRequestCopyWithImpl<$Res, RefreshTokenRequest>;
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class _$RefreshTokenRequestCopyWithImpl<$Res, $Val extends RefreshTokenRequest>
    implements $RefreshTokenRequestCopyWith<$Res> {
  _$RefreshTokenRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? refreshToken = null}) {
    return _then(
      _value.copyWith(
            refreshToken:
                null == refreshToken
                    ? _value.refreshToken
                    : refreshToken // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RefreshTokenRequestImplCopyWith<$Res>
    implements $RefreshTokenRequestCopyWith<$Res> {
  factory _$$RefreshTokenRequestImplCopyWith(
    _$RefreshTokenRequestImpl value,
    $Res Function(_$RefreshTokenRequestImpl) then,
  ) = __$$RefreshTokenRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class __$$RefreshTokenRequestImplCopyWithImpl<$Res>
    extends _$RefreshTokenRequestCopyWithImpl<$Res, _$RefreshTokenRequestImpl>
    implements _$$RefreshTokenRequestImplCopyWith<$Res> {
  __$$RefreshTokenRequestImplCopyWithImpl(
    _$RefreshTokenRequestImpl _value,
    $Res Function(_$RefreshTokenRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RefreshTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? refreshToken = null}) {
    return _then(
      _$RefreshTokenRequestImpl(
        refreshToken:
            null == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenRequestImpl implements _RefreshTokenRequest {
  const _$RefreshTokenRequestImpl({required this.refreshToken});

  factory _$RefreshTokenRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenRequestImplFromJson(json);

  @override
  final String refreshToken;

  @override
  String toString() {
    return 'RefreshTokenRequest(refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenRequestImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken);

  /// Create a copy of RefreshTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenRequestImplCopyWith<_$RefreshTokenRequestImpl> get copyWith =>
      __$$RefreshTokenRequestImplCopyWithImpl<_$RefreshTokenRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenRequestImplToJson(this);
  }
}

abstract class _RefreshTokenRequest implements RefreshTokenRequest {
  const factory _RefreshTokenRequest({required final String refreshToken}) =
      _$RefreshTokenRequestImpl;

  factory _RefreshTokenRequest.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenRequestImpl.fromJson;

  @override
  String get refreshToken;

  /// Create a copy of RefreshTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenRequestImplCopyWith<_$RefreshTokenRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshTokenResponse _$RefreshTokenResponseFromJson(Map<String, dynamic> json) {
  return _RefreshTokenResponse.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenResponse {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this RefreshTokenResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenResponseCopyWith<RefreshTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenResponseCopyWith<$Res> {
  factory $RefreshTokenResponseCopyWith(
    RefreshTokenResponse value,
    $Res Function(RefreshTokenResponse) then,
  ) = _$RefreshTokenResponseCopyWithImpl<$Res, RefreshTokenResponse>;
  @useResult
  $Res call({String accessToken, String refreshToken, DateTime? expiresAt});
}

/// @nodoc
class _$RefreshTokenResponseCopyWithImpl<
  $Res,
  $Val extends RefreshTokenResponse
>
    implements $RefreshTokenResponseCopyWith<$Res> {
  _$RefreshTokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            accessToken:
                null == accessToken
                    ? _value.accessToken
                    : accessToken // ignore: cast_nullable_to_non_nullable
                        as String,
            refreshToken:
                null == refreshToken
                    ? _value.refreshToken
                    : refreshToken // ignore: cast_nullable_to_non_nullable
                        as String,
            expiresAt:
                freezed == expiresAt
                    ? _value.expiresAt
                    : expiresAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RefreshTokenResponseImplCopyWith<$Res>
    implements $RefreshTokenResponseCopyWith<$Res> {
  factory _$$RefreshTokenResponseImplCopyWith(
    _$RefreshTokenResponseImpl value,
    $Res Function(_$RefreshTokenResponseImpl) then,
  ) = __$$RefreshTokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken, DateTime? expiresAt});
}

/// @nodoc
class __$$RefreshTokenResponseImplCopyWithImpl<$Res>
    extends _$RefreshTokenResponseCopyWithImpl<$Res, _$RefreshTokenResponseImpl>
    implements _$$RefreshTokenResponseImplCopyWith<$Res> {
  __$$RefreshTokenResponseImplCopyWithImpl(
    _$RefreshTokenResponseImpl _value,
    $Res Function(_$RefreshTokenResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RefreshTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _$RefreshTokenResponseImpl(
        accessToken:
            null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                    as String,
        refreshToken:
            null == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                    as String,
        expiresAt:
            freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenResponseImpl implements _RefreshTokenResponse {
  const _$RefreshTokenResponseImpl({
    required this.accessToken,
    required this.refreshToken,
    this.expiresAt,
  });

  factory _$RefreshTokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenResponseImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final DateTime? expiresAt;

  @override
  String toString() {
    return 'RefreshTokenResponse(accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, expiresAt);

  /// Create a copy of RefreshTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenResponseImplCopyWith<_$RefreshTokenResponseImpl>
  get copyWith =>
      __$$RefreshTokenResponseImplCopyWithImpl<_$RefreshTokenResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenResponseImplToJson(this);
  }
}

abstract class _RefreshTokenResponse implements RefreshTokenResponse {
  const factory _RefreshTokenResponse({
    required final String accessToken,
    required final String refreshToken,
    final DateTime? expiresAt,
  }) = _$RefreshTokenResponseImpl;

  factory _RefreshTokenResponse.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenResponseImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  DateTime? get expiresAt;

  /// Create a copy of RefreshTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenResponseImplCopyWith<_$RefreshTokenResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ResetPasswordRequest _$ResetPasswordRequestFromJson(Map<String, dynamic> json) {
  return _ResetPasswordRequest.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordRequest {
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_password')
  String get newPassword => throw _privateConstructorUsedError;

  /// Serializes this ResetPasswordRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResetPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPasswordRequestCopyWith<ResetPasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordRequestCopyWith<$Res> {
  factory $ResetPasswordRequestCopyWith(
    ResetPasswordRequest value,
    $Res Function(ResetPasswordRequest) then,
  ) = _$ResetPasswordRequestCopyWithImpl<$Res, ResetPasswordRequest>;
  @useResult
  $Res call({String email, @JsonKey(name: 'new_password') String newPassword});
}

/// @nodoc
class _$ResetPasswordRequestCopyWithImpl<
  $Res,
  $Val extends ResetPasswordRequest
>
    implements $ResetPasswordRequestCopyWith<$Res> {
  _$ResetPasswordRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? newPassword = null}) {
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResetPasswordRequestImplCopyWith<$Res>
    implements $ResetPasswordRequestCopyWith<$Res> {
  factory _$$ResetPasswordRequestImplCopyWith(
    _$ResetPasswordRequestImpl value,
    $Res Function(_$ResetPasswordRequestImpl) then,
  ) = __$$ResetPasswordRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, @JsonKey(name: 'new_password') String newPassword});
}

/// @nodoc
class __$$ResetPasswordRequestImplCopyWithImpl<$Res>
    extends _$ResetPasswordRequestCopyWithImpl<$Res, _$ResetPasswordRequestImpl>
    implements _$$ResetPasswordRequestImplCopyWith<$Res> {
  __$$ResetPasswordRequestImplCopyWithImpl(
    _$ResetPasswordRequestImpl _value,
    $Res Function(_$ResetPasswordRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResetPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? newPassword = null}) {
    return _then(
      _$ResetPasswordRequestImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPasswordRequestImpl implements _ResetPasswordRequest {
  const _$ResetPasswordRequestImpl({
    required this.email,
    @JsonKey(name: 'new_password') required this.newPassword,
  });

  factory _$ResetPasswordRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPasswordRequestImplFromJson(json);

  @override
  final String email;
  @override
  @JsonKey(name: 'new_password')
  final String newPassword;

  @override
  String toString() {
    return 'ResetPasswordRequest(email: $email, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, newPassword);

  /// Create a copy of ResetPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordRequestImplCopyWith<_$ResetPasswordRequestImpl>
  get copyWith =>
      __$$ResetPasswordRequestImplCopyWithImpl<_$ResetPasswordRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPasswordRequestImplToJson(this);
  }
}

abstract class _ResetPasswordRequest implements ResetPasswordRequest {
  const factory _ResetPasswordRequest({
    required final String email,
    @JsonKey(name: 'new_password') required final String newPassword,
  }) = _$ResetPasswordRequestImpl;

  factory _ResetPasswordRequest.fromJson(Map<String, dynamic> json) =
      _$ResetPasswordRequestImpl.fromJson;

  @override
  String get email;
  @override
  @JsonKey(name: 'new_password')
  String get newPassword;

  /// Create a copy of ResetPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordRequestImplCopyWith<_$ResetPasswordRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ApiResponse<T> {
  bool get success => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<String>? get errors => throw _privateConstructorUsedError;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiResponseCopyWith<T, ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
    ApiResponse<T> value,
    $Res Function(ApiResponse<T>) then,
  ) = _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
  @useResult
  $Res call({bool success, T? data, String? message, List<String>? errors});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? message = freezed,
    Object? errors = freezed,
  }) {
    return _then(
      _value.copyWith(
            success:
                null == success
                    ? _value.success
                    : success // ignore: cast_nullable_to_non_nullable
                        as bool,
            data:
                freezed == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as T?,
            message:
                freezed == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String?,
            errors:
                freezed == errors
                    ? _value.errors
                    : errors // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$ApiResponseImplCopyWith(
    _$ApiResponseImpl<T> value,
    $Res Function(_$ApiResponseImpl<T>) then,
  ) = __$$ApiResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({bool success, T? data, String? message, List<String>? errors});
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ApiResponseImpl<T>>
    implements _$$ApiResponseImplCopyWith<T, $Res> {
  __$$ApiResponseImplCopyWithImpl(
    _$ApiResponseImpl<T> _value,
    $Res Function(_$ApiResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? message = freezed,
    Object? errors = freezed,
  }) {
    return _then(
      _$ApiResponseImpl<T>(
        success:
            null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool,
        data:
            freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as T?,
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String?,
        errors:
            freezed == errors
                ? _value._errors
                : errors // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
      ),
    );
  }
}

/// @nodoc

class _$ApiResponseImpl<T> implements _ApiResponse<T> {
  const _$ApiResponseImpl({
    this.success = false,
    this.data,
    this.message,
    final List<String>? errors,
  }) : _errors = errors;

  @override
  @JsonKey()
  final bool success;
  @override
  final T? data;
  @override
  final String? message;
  final List<String>? _errors;
  @override
  List<String>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ApiResponse<$T>(success: $success, data: $data, message: $message, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl<T> &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    const DeepCollectionEquality().hash(data),
    message,
    const DeepCollectionEquality().hash(_errors),
  );

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<T, _$ApiResponseImpl<T>>(
        this,
        _$identity,
      );
}

abstract class _ApiResponse<T> implements ApiResponse<T> {
  const factory _ApiResponse({
    final bool success,
    final T? data,
    final String? message,
    final List<String>? errors,
  }) = _$ApiResponseImpl<T>;

  @override
  bool get success;
  @override
  T? get data;
  @override
  String? get message;
  @override
  List<String>? get errors;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

ResendOtpRequest _$ResendOtpRequestFromJson(Map<String, dynamic> json) {
  return _ResendOtpRequest.fromJson(json);
}

/// @nodoc
mixin _$ResendOtpRequest {
  String get email => throw _privateConstructorUsedError;

  /// Serializes this ResendOtpRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResendOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResendOtpRequestCopyWith<ResendOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResendOtpRequestCopyWith<$Res> {
  factory $ResendOtpRequestCopyWith(
    ResendOtpRequest value,
    $Res Function(ResendOtpRequest) then,
  ) = _$ResendOtpRequestCopyWithImpl<$Res, ResendOtpRequest>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ResendOtpRequestCopyWithImpl<$Res, $Val extends ResendOtpRequest>
    implements $ResendOtpRequestCopyWith<$Res> {
  _$ResendOtpRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResendOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResendOtpRequestImplCopyWith<$Res>
    implements $ResendOtpRequestCopyWith<$Res> {
  factory _$$ResendOtpRequestImplCopyWith(
    _$ResendOtpRequestImpl value,
    $Res Function(_$ResendOtpRequestImpl) then,
  ) = __$$ResendOtpRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ResendOtpRequestImplCopyWithImpl<$Res>
    extends _$ResendOtpRequestCopyWithImpl<$Res, _$ResendOtpRequestImpl>
    implements _$$ResendOtpRequestImplCopyWith<$Res> {
  __$$ResendOtpRequestImplCopyWithImpl(
    _$ResendOtpRequestImpl _value,
    $Res Function(_$ResendOtpRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResendOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$ResendOtpRequestImpl(
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
@JsonSerializable()
class _$ResendOtpRequestImpl implements _ResendOtpRequest {
  const _$ResendOtpRequestImpl({required this.email});

  factory _$ResendOtpRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResendOtpRequestImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'ResendOtpRequest(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendOtpRequestImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ResendOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResendOtpRequestImplCopyWith<_$ResendOtpRequestImpl> get copyWith =>
      __$$ResendOtpRequestImplCopyWithImpl<_$ResendOtpRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResendOtpRequestImplToJson(this);
  }
}

abstract class _ResendOtpRequest implements ResendOtpRequest {
  const factory _ResendOtpRequest({required final String email}) =
      _$ResendOtpRequestImpl;

  factory _ResendOtpRequest.fromJson(Map<String, dynamic> json) =
      _$ResendOtpRequestImpl.fromJson;

  @override
  String get email;

  /// Create a copy of ResendOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResendOtpRequestImplCopyWith<_$ResendOtpRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResendOtpResponse _$ResendOtpResponseFromJson(Map<String, dynamic> json) {
  return _ResendOtpResponse.fromJson(json);
}

/// @nodoc
mixin _$ResendOtpResponse {
  String get email => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this ResendOtpResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResendOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResendOtpResponseCopyWith<ResendOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResendOtpResponseCopyWith<$Res> {
  factory $ResendOtpResponseCopyWith(
    ResendOtpResponse value,
    $Res Function(ResendOtpResponse) then,
  ) = _$ResendOtpResponseCopyWithImpl<$Res, ResendOtpResponse>;
  @useResult
  $Res call({String email, String message});
}

/// @nodoc
class _$ResendOtpResponseCopyWithImpl<$Res, $Val extends ResendOtpResponse>
    implements $ResendOtpResponseCopyWith<$Res> {
  _$ResendOtpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResendOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? message = null}) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResendOtpResponseImplCopyWith<$Res>
    implements $ResendOtpResponseCopyWith<$Res> {
  factory _$$ResendOtpResponseImplCopyWith(
    _$ResendOtpResponseImpl value,
    $Res Function(_$ResendOtpResponseImpl) then,
  ) = __$$ResendOtpResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String message});
}

/// @nodoc
class __$$ResendOtpResponseImplCopyWithImpl<$Res>
    extends _$ResendOtpResponseCopyWithImpl<$Res, _$ResendOtpResponseImpl>
    implements _$$ResendOtpResponseImplCopyWith<$Res> {
  __$$ResendOtpResponseImplCopyWithImpl(
    _$ResendOtpResponseImpl _value,
    $Res Function(_$ResendOtpResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResendOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? message = null}) {
    return _then(
      _$ResendOtpResponseImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResendOtpResponseImpl implements _ResendOtpResponse {
  const _$ResendOtpResponseImpl({required this.email, required this.message});

  factory _$ResendOtpResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResendOtpResponseImplFromJson(json);

  @override
  final String email;
  @override
  final String message;

  @override
  String toString() {
    return 'ResendOtpResponse(email: $email, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendOtpResponseImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, message);

  /// Create a copy of ResendOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResendOtpResponseImplCopyWith<_$ResendOtpResponseImpl> get copyWith =>
      __$$ResendOtpResponseImplCopyWithImpl<_$ResendOtpResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResendOtpResponseImplToJson(this);
  }
}

abstract class _ResendOtpResponse implements ResendOtpResponse {
  const factory _ResendOtpResponse({
    required final String email,
    required final String message,
  }) = _$ResendOtpResponseImpl;

  factory _ResendOtpResponse.fromJson(Map<String, dynamic> json) =
      _$ResendOtpResponseImpl.fromJson;

  @override
  String get email;
  @override
  String get message;

  /// Create a copy of ResendOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResendOtpResponseImplCopyWith<_$ResendOtpResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
