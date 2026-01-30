// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sho_qdata_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ShoQdataEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connect,
    required TResult Function(Map<String, dynamic> sessionData) sendData,
    required TResult Function() clearData,
    required TResult Function(String data) wsFrame,
    required TResult Function() wsClosed,
    required TResult Function(String error) wsError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connect,
    TResult? Function(Map<String, dynamic> sessionData)? sendData,
    TResult? Function()? clearData,
    TResult? Function(String data)? wsFrame,
    TResult? Function()? wsClosed,
    TResult? Function(String error)? wsError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connect,
    TResult Function(Map<String, dynamic> sessionData)? sendData,
    TResult Function()? clearData,
    TResult Function(String data)? wsFrame,
    TResult Function()? wsClosed,
    TResult Function(String error)? wsError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Connect value) connect,
    required TResult Function(SendData value) sendData,
    required TResult Function(ClearData value) clearData,
    required TResult Function(_WsFrame value) wsFrame,
    required TResult Function(_WsClosed value) wsClosed,
    required TResult Function(_WsError value) wsError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Connect value)? connect,
    TResult? Function(SendData value)? sendData,
    TResult? Function(ClearData value)? clearData,
    TResult? Function(_WsFrame value)? wsFrame,
    TResult? Function(_WsClosed value)? wsClosed,
    TResult? Function(_WsError value)? wsError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Connect value)? connect,
    TResult Function(SendData value)? sendData,
    TResult Function(ClearData value)? clearData,
    TResult Function(_WsFrame value)? wsFrame,
    TResult Function(_WsClosed value)? wsClosed,
    TResult Function(_WsError value)? wsError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoQdataEventCopyWith<$Res> {
  factory $ShoQdataEventCopyWith(
    ShoQdataEvent value,
    $Res Function(ShoQdataEvent) then,
  ) = _$ShoQdataEventCopyWithImpl<$Res, ShoQdataEvent>;
}

/// @nodoc
class _$ShoQdataEventCopyWithImpl<$Res, $Val extends ShoQdataEvent>
    implements $ShoQdataEventCopyWith<$Res> {
  _$ShoQdataEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoQdataEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConnectImplCopyWith<$Res> {
  factory _$$ConnectImplCopyWith(
    _$ConnectImpl value,
    $Res Function(_$ConnectImpl) then,
  ) = __$$ConnectImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectImplCopyWithImpl<$Res>
    extends _$ShoQdataEventCopyWithImpl<$Res, _$ConnectImpl>
    implements _$$ConnectImplCopyWith<$Res> {
  __$$ConnectImplCopyWithImpl(
    _$ConnectImpl _value,
    $Res Function(_$ConnectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShoQdataEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectImpl implements Connect {
  const _$ConnectImpl();

  @override
  String toString() {
    return 'ShoQdataEvent.connect()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connect,
    required TResult Function(Map<String, dynamic> sessionData) sendData,
    required TResult Function() clearData,
    required TResult Function(String data) wsFrame,
    required TResult Function() wsClosed,
    required TResult Function(String error) wsError,
  }) {
    return connect();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connect,
    TResult? Function(Map<String, dynamic> sessionData)? sendData,
    TResult? Function()? clearData,
    TResult? Function(String data)? wsFrame,
    TResult? Function()? wsClosed,
    TResult? Function(String error)? wsError,
  }) {
    return connect?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connect,
    TResult Function(Map<String, dynamic> sessionData)? sendData,
    TResult Function()? clearData,
    TResult Function(String data)? wsFrame,
    TResult Function()? wsClosed,
    TResult Function(String error)? wsError,
    required TResult orElse(),
  }) {
    if (connect != null) {
      return connect();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Connect value) connect,
    required TResult Function(SendData value) sendData,
    required TResult Function(ClearData value) clearData,
    required TResult Function(_WsFrame value) wsFrame,
    required TResult Function(_WsClosed value) wsClosed,
    required TResult Function(_WsError value) wsError,
  }) {
    return connect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Connect value)? connect,
    TResult? Function(SendData value)? sendData,
    TResult? Function(ClearData value)? clearData,
    TResult? Function(_WsFrame value)? wsFrame,
    TResult? Function(_WsClosed value)? wsClosed,
    TResult? Function(_WsError value)? wsError,
  }) {
    return connect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Connect value)? connect,
    TResult Function(SendData value)? sendData,
    TResult Function(ClearData value)? clearData,
    TResult Function(_WsFrame value)? wsFrame,
    TResult Function(_WsClosed value)? wsClosed,
    TResult Function(_WsError value)? wsError,
    required TResult orElse(),
  }) {
    if (connect != null) {
      return connect(this);
    }
    return orElse();
  }
}

abstract class Connect implements ShoQdataEvent {
  const factory Connect() = _$ConnectImpl;
}

/// @nodoc
abstract class _$$SendDataImplCopyWith<$Res> {
  factory _$$SendDataImplCopyWith(
    _$SendDataImpl value,
    $Res Function(_$SendDataImpl) then,
  ) = __$$SendDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> sessionData});
}

/// @nodoc
class __$$SendDataImplCopyWithImpl<$Res>
    extends _$ShoQdataEventCopyWithImpl<$Res, _$SendDataImpl>
    implements _$$SendDataImplCopyWith<$Res> {
  __$$SendDataImplCopyWithImpl(
    _$SendDataImpl _value,
    $Res Function(_$SendDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShoQdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sessionData = null}) {
    return _then(
      _$SendDataImpl(
        null == sessionData
            ? _value._sessionData
            : sessionData // ignore: cast_nullable_to_non_nullable
                as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$SendDataImpl implements SendData {
  const _$SendDataImpl(final Map<String, dynamic> sessionData)
    : _sessionData = sessionData;

  final Map<String, dynamic> _sessionData;
  @override
  Map<String, dynamic> get sessionData {
    if (_sessionData is EqualUnmodifiableMapView) return _sessionData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sessionData);
  }

  @override
  String toString() {
    return 'ShoQdataEvent.sendData(sessionData: $sessionData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendDataImpl &&
            const DeepCollectionEquality().equals(
              other._sessionData,
              _sessionData,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_sessionData),
  );

  /// Create a copy of ShoQdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendDataImplCopyWith<_$SendDataImpl> get copyWith =>
      __$$SendDataImplCopyWithImpl<_$SendDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connect,
    required TResult Function(Map<String, dynamic> sessionData) sendData,
    required TResult Function() clearData,
    required TResult Function(String data) wsFrame,
    required TResult Function() wsClosed,
    required TResult Function(String error) wsError,
  }) {
    return sendData(sessionData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connect,
    TResult? Function(Map<String, dynamic> sessionData)? sendData,
    TResult? Function()? clearData,
    TResult? Function(String data)? wsFrame,
    TResult? Function()? wsClosed,
    TResult? Function(String error)? wsError,
  }) {
    return sendData?.call(sessionData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connect,
    TResult Function(Map<String, dynamic> sessionData)? sendData,
    TResult Function()? clearData,
    TResult Function(String data)? wsFrame,
    TResult Function()? wsClosed,
    TResult Function(String error)? wsError,
    required TResult orElse(),
  }) {
    if (sendData != null) {
      return sendData(sessionData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Connect value) connect,
    required TResult Function(SendData value) sendData,
    required TResult Function(ClearData value) clearData,
    required TResult Function(_WsFrame value) wsFrame,
    required TResult Function(_WsClosed value) wsClosed,
    required TResult Function(_WsError value) wsError,
  }) {
    return sendData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Connect value)? connect,
    TResult? Function(SendData value)? sendData,
    TResult? Function(ClearData value)? clearData,
    TResult? Function(_WsFrame value)? wsFrame,
    TResult? Function(_WsClosed value)? wsClosed,
    TResult? Function(_WsError value)? wsError,
  }) {
    return sendData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Connect value)? connect,
    TResult Function(SendData value)? sendData,
    TResult Function(ClearData value)? clearData,
    TResult Function(_WsFrame value)? wsFrame,
    TResult Function(_WsClosed value)? wsClosed,
    TResult Function(_WsError value)? wsError,
    required TResult orElse(),
  }) {
    if (sendData != null) {
      return sendData(this);
    }
    return orElse();
  }
}

abstract class SendData implements ShoQdataEvent {
  const factory SendData(final Map<String, dynamic> sessionData) =
      _$SendDataImpl;

  Map<String, dynamic> get sessionData;

  /// Create a copy of ShoQdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendDataImplCopyWith<_$SendDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearDataImplCopyWith<$Res> {
  factory _$$ClearDataImplCopyWith(
    _$ClearDataImpl value,
    $Res Function(_$ClearDataImpl) then,
  ) = __$$ClearDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearDataImplCopyWithImpl<$Res>
    extends _$ShoQdataEventCopyWithImpl<$Res, _$ClearDataImpl>
    implements _$$ClearDataImplCopyWith<$Res> {
  __$$ClearDataImplCopyWithImpl(
    _$ClearDataImpl _value,
    $Res Function(_$ClearDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShoQdataEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearDataImpl implements ClearData {
  const _$ClearDataImpl();

  @override
  String toString() {
    return 'ShoQdataEvent.clearData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connect,
    required TResult Function(Map<String, dynamic> sessionData) sendData,
    required TResult Function() clearData,
    required TResult Function(String data) wsFrame,
    required TResult Function() wsClosed,
    required TResult Function(String error) wsError,
  }) {
    return clearData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connect,
    TResult? Function(Map<String, dynamic> sessionData)? sendData,
    TResult? Function()? clearData,
    TResult? Function(String data)? wsFrame,
    TResult? Function()? wsClosed,
    TResult? Function(String error)? wsError,
  }) {
    return clearData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connect,
    TResult Function(Map<String, dynamic> sessionData)? sendData,
    TResult Function()? clearData,
    TResult Function(String data)? wsFrame,
    TResult Function()? wsClosed,
    TResult Function(String error)? wsError,
    required TResult orElse(),
  }) {
    if (clearData != null) {
      return clearData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Connect value) connect,
    required TResult Function(SendData value) sendData,
    required TResult Function(ClearData value) clearData,
    required TResult Function(_WsFrame value) wsFrame,
    required TResult Function(_WsClosed value) wsClosed,
    required TResult Function(_WsError value) wsError,
  }) {
    return clearData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Connect value)? connect,
    TResult? Function(SendData value)? sendData,
    TResult? Function(ClearData value)? clearData,
    TResult? Function(_WsFrame value)? wsFrame,
    TResult? Function(_WsClosed value)? wsClosed,
    TResult? Function(_WsError value)? wsError,
  }) {
    return clearData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Connect value)? connect,
    TResult Function(SendData value)? sendData,
    TResult Function(ClearData value)? clearData,
    TResult Function(_WsFrame value)? wsFrame,
    TResult Function(_WsClosed value)? wsClosed,
    TResult Function(_WsError value)? wsError,
    required TResult orElse(),
  }) {
    if (clearData != null) {
      return clearData(this);
    }
    return orElse();
  }
}

abstract class ClearData implements ShoQdataEvent {
  const factory ClearData() = _$ClearDataImpl;
}

/// @nodoc
abstract class _$$WsFrameImplCopyWith<$Res> {
  factory _$$WsFrameImplCopyWith(
    _$WsFrameImpl value,
    $Res Function(_$WsFrameImpl) then,
  ) = __$$WsFrameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String data});
}

/// @nodoc
class __$$WsFrameImplCopyWithImpl<$Res>
    extends _$ShoQdataEventCopyWithImpl<$Res, _$WsFrameImpl>
    implements _$$WsFrameImplCopyWith<$Res> {
  __$$WsFrameImplCopyWithImpl(
    _$WsFrameImpl _value,
    $Res Function(_$WsFrameImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShoQdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$WsFrameImpl(
        null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$WsFrameImpl implements _WsFrame {
  const _$WsFrameImpl(this.data);

  @override
  final String data;

  @override
  String toString() {
    return 'ShoQdataEvent.wsFrame(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WsFrameImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of ShoQdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WsFrameImplCopyWith<_$WsFrameImpl> get copyWith =>
      __$$WsFrameImplCopyWithImpl<_$WsFrameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connect,
    required TResult Function(Map<String, dynamic> sessionData) sendData,
    required TResult Function() clearData,
    required TResult Function(String data) wsFrame,
    required TResult Function() wsClosed,
    required TResult Function(String error) wsError,
  }) {
    return wsFrame(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connect,
    TResult? Function(Map<String, dynamic> sessionData)? sendData,
    TResult? Function()? clearData,
    TResult? Function(String data)? wsFrame,
    TResult? Function()? wsClosed,
    TResult? Function(String error)? wsError,
  }) {
    return wsFrame?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connect,
    TResult Function(Map<String, dynamic> sessionData)? sendData,
    TResult Function()? clearData,
    TResult Function(String data)? wsFrame,
    TResult Function()? wsClosed,
    TResult Function(String error)? wsError,
    required TResult orElse(),
  }) {
    if (wsFrame != null) {
      return wsFrame(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Connect value) connect,
    required TResult Function(SendData value) sendData,
    required TResult Function(ClearData value) clearData,
    required TResult Function(_WsFrame value) wsFrame,
    required TResult Function(_WsClosed value) wsClosed,
    required TResult Function(_WsError value) wsError,
  }) {
    return wsFrame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Connect value)? connect,
    TResult? Function(SendData value)? sendData,
    TResult? Function(ClearData value)? clearData,
    TResult? Function(_WsFrame value)? wsFrame,
    TResult? Function(_WsClosed value)? wsClosed,
    TResult? Function(_WsError value)? wsError,
  }) {
    return wsFrame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Connect value)? connect,
    TResult Function(SendData value)? sendData,
    TResult Function(ClearData value)? clearData,
    TResult Function(_WsFrame value)? wsFrame,
    TResult Function(_WsClosed value)? wsClosed,
    TResult Function(_WsError value)? wsError,
    required TResult orElse(),
  }) {
    if (wsFrame != null) {
      return wsFrame(this);
    }
    return orElse();
  }
}

abstract class _WsFrame implements ShoQdataEvent {
  const factory _WsFrame(final String data) = _$WsFrameImpl;

  String get data;

  /// Create a copy of ShoQdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WsFrameImplCopyWith<_$WsFrameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WsClosedImplCopyWith<$Res> {
  factory _$$WsClosedImplCopyWith(
    _$WsClosedImpl value,
    $Res Function(_$WsClosedImpl) then,
  ) = __$$WsClosedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WsClosedImplCopyWithImpl<$Res>
    extends _$ShoQdataEventCopyWithImpl<$Res, _$WsClosedImpl>
    implements _$$WsClosedImplCopyWith<$Res> {
  __$$WsClosedImplCopyWithImpl(
    _$WsClosedImpl _value,
    $Res Function(_$WsClosedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShoQdataEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WsClosedImpl implements _WsClosed {
  const _$WsClosedImpl();

  @override
  String toString() {
    return 'ShoQdataEvent.wsClosed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WsClosedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connect,
    required TResult Function(Map<String, dynamic> sessionData) sendData,
    required TResult Function() clearData,
    required TResult Function(String data) wsFrame,
    required TResult Function() wsClosed,
    required TResult Function(String error) wsError,
  }) {
    return wsClosed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connect,
    TResult? Function(Map<String, dynamic> sessionData)? sendData,
    TResult? Function()? clearData,
    TResult? Function(String data)? wsFrame,
    TResult? Function()? wsClosed,
    TResult? Function(String error)? wsError,
  }) {
    return wsClosed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connect,
    TResult Function(Map<String, dynamic> sessionData)? sendData,
    TResult Function()? clearData,
    TResult Function(String data)? wsFrame,
    TResult Function()? wsClosed,
    TResult Function(String error)? wsError,
    required TResult orElse(),
  }) {
    if (wsClosed != null) {
      return wsClosed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Connect value) connect,
    required TResult Function(SendData value) sendData,
    required TResult Function(ClearData value) clearData,
    required TResult Function(_WsFrame value) wsFrame,
    required TResult Function(_WsClosed value) wsClosed,
    required TResult Function(_WsError value) wsError,
  }) {
    return wsClosed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Connect value)? connect,
    TResult? Function(SendData value)? sendData,
    TResult? Function(ClearData value)? clearData,
    TResult? Function(_WsFrame value)? wsFrame,
    TResult? Function(_WsClosed value)? wsClosed,
    TResult? Function(_WsError value)? wsError,
  }) {
    return wsClosed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Connect value)? connect,
    TResult Function(SendData value)? sendData,
    TResult Function(ClearData value)? clearData,
    TResult Function(_WsFrame value)? wsFrame,
    TResult Function(_WsClosed value)? wsClosed,
    TResult Function(_WsError value)? wsError,
    required TResult orElse(),
  }) {
    if (wsClosed != null) {
      return wsClosed(this);
    }
    return orElse();
  }
}

abstract class _WsClosed implements ShoQdataEvent {
  const factory _WsClosed() = _$WsClosedImpl;
}

/// @nodoc
abstract class _$$WsErrorImplCopyWith<$Res> {
  factory _$$WsErrorImplCopyWith(
    _$WsErrorImpl value,
    $Res Function(_$WsErrorImpl) then,
  ) = __$$WsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$WsErrorImplCopyWithImpl<$Res>
    extends _$ShoQdataEventCopyWithImpl<$Res, _$WsErrorImpl>
    implements _$$WsErrorImplCopyWith<$Res> {
  __$$WsErrorImplCopyWithImpl(
    _$WsErrorImpl _value,
    $Res Function(_$WsErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShoQdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$WsErrorImpl(
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$WsErrorImpl implements _WsError {
  const _$WsErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'ShoQdataEvent.wsError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WsErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ShoQdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WsErrorImplCopyWith<_$WsErrorImpl> get copyWith =>
      __$$WsErrorImplCopyWithImpl<_$WsErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connect,
    required TResult Function(Map<String, dynamic> sessionData) sendData,
    required TResult Function() clearData,
    required TResult Function(String data) wsFrame,
    required TResult Function() wsClosed,
    required TResult Function(String error) wsError,
  }) {
    return wsError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connect,
    TResult? Function(Map<String, dynamic> sessionData)? sendData,
    TResult? Function()? clearData,
    TResult? Function(String data)? wsFrame,
    TResult? Function()? wsClosed,
    TResult? Function(String error)? wsError,
  }) {
    return wsError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connect,
    TResult Function(Map<String, dynamic> sessionData)? sendData,
    TResult Function()? clearData,
    TResult Function(String data)? wsFrame,
    TResult Function()? wsClosed,
    TResult Function(String error)? wsError,
    required TResult orElse(),
  }) {
    if (wsError != null) {
      return wsError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Connect value) connect,
    required TResult Function(SendData value) sendData,
    required TResult Function(ClearData value) clearData,
    required TResult Function(_WsFrame value) wsFrame,
    required TResult Function(_WsClosed value) wsClosed,
    required TResult Function(_WsError value) wsError,
  }) {
    return wsError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Connect value)? connect,
    TResult? Function(SendData value)? sendData,
    TResult? Function(ClearData value)? clearData,
    TResult? Function(_WsFrame value)? wsFrame,
    TResult? Function(_WsClosed value)? wsClosed,
    TResult? Function(_WsError value)? wsError,
  }) {
    return wsError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Connect value)? connect,
    TResult Function(SendData value)? sendData,
    TResult Function(ClearData value)? clearData,
    TResult Function(_WsFrame value)? wsFrame,
    TResult Function(_WsClosed value)? wsClosed,
    TResult Function(_WsError value)? wsError,
    required TResult orElse(),
  }) {
    if (wsError != null) {
      return wsError(this);
    }
    return orElse();
  }
}

abstract class _WsError implements ShoQdataEvent {
  const factory _WsError(final String error) = _$WsErrorImpl;

  String get error;

  /// Create a copy of ShoQdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WsErrorImplCopyWith<_$WsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShoQdataState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connected,
    required TResult Function() loading,
    required TResult Function(Map<String, dynamic> analysis) success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connected,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic> analysis)? success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connected,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic> analysis)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Connected value) connected,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Connected value)? connected,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Connected value)? connected,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoQdataStateCopyWith<$Res> {
  factory $ShoQdataStateCopyWith(
    ShoQdataState value,
    $Res Function(ShoQdataState) then,
  ) = _$ShoQdataStateCopyWithImpl<$Res, ShoQdataState>;
}

/// @nodoc
class _$ShoQdataStateCopyWithImpl<$Res, $Val extends ShoQdataState>
    implements $ShoQdataStateCopyWith<$Res> {
  _$ShoQdataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoQdataState
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
    extends _$ShoQdataStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShoQdataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ShoQdataState.initial()';
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
    required TResult Function() connected,
    required TResult Function() loading,
    required TResult Function(Map<String, dynamic> analysis) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connected,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic> analysis)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connected,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic> analysis)? success,
    TResult Function(String message)? error,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Connected value) connected,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Connected value)? connected,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Connected value)? connected,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ShoQdataState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ConnectedImplCopyWith<$Res> {
  factory _$$ConnectedImplCopyWith(
    _$ConnectedImpl value,
    $Res Function(_$ConnectedImpl) then,
  ) = __$$ConnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectedImplCopyWithImpl<$Res>
    extends _$ShoQdataStateCopyWithImpl<$Res, _$ConnectedImpl>
    implements _$$ConnectedImplCopyWith<$Res> {
  __$$ConnectedImplCopyWithImpl(
    _$ConnectedImpl _value,
    $Res Function(_$ConnectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShoQdataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectedImpl implements Connected {
  const _$ConnectedImpl();

  @override
  String toString() {
    return 'ShoQdataState.connected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connected,
    required TResult Function() loading,
    required TResult Function(Map<String, dynamic> analysis) success,
    required TResult Function(String message) error,
  }) {
    return connected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connected,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic> analysis)? success,
    TResult? Function(String message)? error,
  }) {
    return connected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connected,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic> analysis)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Connected value) connected,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Connected value)? connected,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Connected value)? connected,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class Connected implements ShoQdataState {
  const factory Connected() = _$ConnectedImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ShoQdataStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShoQdataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ShoQdataState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connected,
    required TResult Function() loading,
    required TResult Function(Map<String, dynamic> analysis) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connected,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic> analysis)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connected,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic> analysis)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Connected value) connected,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Connected value)? connected,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Connected value)? connected,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ShoQdataState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> analysis});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ShoQdataStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShoQdataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? analysis = null}) {
    return _then(
      _$SuccessImpl(
        null == analysis
            ? _value._analysis
            : analysis // ignore: cast_nullable_to_non_nullable
                as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl(final Map<String, dynamic> analysis)
    : _analysis = analysis;

  final Map<String, dynamic> _analysis;
  @override
  Map<String, dynamic> get analysis {
    if (_analysis is EqualUnmodifiableMapView) return _analysis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_analysis);
  }

  @override
  String toString() {
    return 'ShoQdataState.success(analysis: $analysis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._analysis, _analysis));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_analysis));

  /// Create a copy of ShoQdataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connected,
    required TResult Function() loading,
    required TResult Function(Map<String, dynamic> analysis) success,
    required TResult Function(String message) error,
  }) {
    return success(analysis);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connected,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic> analysis)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(analysis);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connected,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic> analysis)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(analysis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Connected value) connected,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Connected value)? connected,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Connected value)? connected,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements ShoQdataState {
  const factory Success(final Map<String, dynamic> analysis) = _$SuccessImpl;

  Map<String, dynamic> get analysis;

  /// Create a copy of ShoQdataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ShoQdataStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShoQdataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ShoQdataState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ShoQdataState
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
    required TResult Function() connected,
    required TResult Function() loading,
    required TResult Function(Map<String, dynamic> analysis) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connected,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic> analysis)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connected,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic> analysis)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Connected value) connected,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Connected value)? connected,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Connected value)? connected,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ShoQdataState {
  const factory Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of ShoQdataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
