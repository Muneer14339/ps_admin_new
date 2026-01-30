// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rtsp_streaming_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RtspStreamingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streamMode, int distance, bool withCable)
    started,
    required TResult Function(String val, bool isReset) setFovOptionsEvent,
    required TResult Function(String val) setLightFreqEvent,
    required TResult Function(String val) setIsoOptionsEvent,
    required TResult Function(String val) setEvOptionsEvent,
    required TResult Function(String val) setVideoResolutionsEvent,
    required TResult Function(bool onDisposeSessions) disposeBloc,
    required TResult Function(bool withCable) startStreaming,
    required TResult Function() socketConnectEvent,
    required TResult Function() startFrameProcessing,
    required TResult Function() detectCircleProcessingEvent,
    required TResult Function() stopCircleDetection,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streamMode, int distance, bool withCable)? started,
    TResult? Function(String val, bool isReset)? setFovOptionsEvent,
    TResult? Function(String val)? setLightFreqEvent,
    TResult? Function(String val)? setIsoOptionsEvent,
    TResult? Function(String val)? setEvOptionsEvent,
    TResult? Function(String val)? setVideoResolutionsEvent,
    TResult? Function(bool onDisposeSessions)? disposeBloc,
    TResult? Function(bool withCable)? startStreaming,
    TResult? Function()? socketConnectEvent,
    TResult? Function()? startFrameProcessing,
    TResult? Function()? detectCircleProcessingEvent,
    TResult? Function()? stopCircleDetection,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streamMode, int distance, bool withCable)? started,
    TResult Function(String val, bool isReset)? setFovOptionsEvent,
    TResult Function(String val)? setLightFreqEvent,
    TResult Function(String val)? setIsoOptionsEvent,
    TResult Function(String val)? setEvOptionsEvent,
    TResult Function(String val)? setVideoResolutionsEvent,
    TResult Function(bool onDisposeSessions)? disposeBloc,
    TResult Function(bool withCable)? startStreaming,
    TResult Function()? socketConnectEvent,
    TResult Function()? startFrameProcessing,
    TResult Function()? detectCircleProcessingEvent,
    TResult Function()? stopCircleDetection,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SetFovOptionsEvent value) setFovOptionsEvent,
    required TResult Function(_SetLightFreqEvent value) setLightFreqEvent,
    required TResult Function(_SetIsoOptionsEvent value) setIsoOptionsEvent,
    required TResult Function(_SetEvOptionsEvent value) setEvOptionsEvent,
    required TResult Function(_SetVideoResolutionsEvent value)
    setVideoResolutionsEvent,
    required TResult Function(_DisposeBloc value) disposeBloc,
    required TResult Function(_StartStreaming value) startStreaming,
    required TResult Function(_SocketConnectEvent value) socketConnectEvent,
    required TResult Function(_StartFrameProcessing value) startFrameProcessing,
    required TResult Function(_DetectCircleProcessingEvent value)
    detectCircleProcessingEvent,
    required TResult Function(_StopCircleDetection value) stopCircleDetection,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult? Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult? Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult? Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult? Function(_SetVideoResolutionsEvent value)?
    setVideoResolutionsEvent,
    TResult? Function(_DisposeBloc value)? disposeBloc,
    TResult? Function(_StartStreaming value)? startStreaming,
    TResult? Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult? Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult? Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult? Function(_StopCircleDetection value)? stopCircleDetection,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult Function(_SetVideoResolutionsEvent value)? setVideoResolutionsEvent,
    TResult Function(_DisposeBloc value)? disposeBloc,
    TResult Function(_StartStreaming value)? startStreaming,
    TResult Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult Function(_StopCircleDetection value)? stopCircleDetection,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RtspStreamingEventCopyWith<$Res> {
  factory $RtspStreamingEventCopyWith(
    RtspStreamingEvent value,
    $Res Function(RtspStreamingEvent) then,
  ) = _$RtspStreamingEventCopyWithImpl<$Res, RtspStreamingEvent>;
}

/// @nodoc
class _$RtspStreamingEventCopyWithImpl<$Res, $Val extends RtspStreamingEvent>
    implements $RtspStreamingEventCopyWith<$Res> {
  _$RtspStreamingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
    _$StartedImpl value,
    $Res Function(_$StartedImpl) then,
  ) = __$$StartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int streamMode, int distance, bool withCable});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$RtspStreamingEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streamMode = null,
    Object? distance = null,
    Object? withCable = null,
  }) {
    return _then(
      _$StartedImpl(
        null == streamMode
            ? _value.streamMode
            : streamMode // ignore: cast_nullable_to_non_nullable
                as int,
        null == distance
            ? _value.distance
            : distance // ignore: cast_nullable_to_non_nullable
                as int,
        null == withCable
            ? _value.withCable
            : withCable // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl(this.streamMode, this.distance, this.withCable);

  @override
  final int streamMode;
  @override
  final int distance;
  @override
  final bool withCable;

  @override
  String toString() {
    return 'RtspStreamingEvent.started(streamMode: $streamMode, distance: $distance, withCable: $withCable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.streamMode, streamMode) ||
                other.streamMode == streamMode) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.withCable, withCable) ||
                other.withCable == withCable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, streamMode, distance, withCable);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streamMode, int distance, bool withCable)
    started,
    required TResult Function(String val, bool isReset) setFovOptionsEvent,
    required TResult Function(String val) setLightFreqEvent,
    required TResult Function(String val) setIsoOptionsEvent,
    required TResult Function(String val) setEvOptionsEvent,
    required TResult Function(String val) setVideoResolutionsEvent,
    required TResult Function(bool onDisposeSessions) disposeBloc,
    required TResult Function(bool withCable) startStreaming,
    required TResult Function() socketConnectEvent,
    required TResult Function() startFrameProcessing,
    required TResult Function() detectCircleProcessingEvent,
    required TResult Function() stopCircleDetection,
  }) {
    return started(streamMode, distance, withCable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streamMode, int distance, bool withCable)? started,
    TResult? Function(String val, bool isReset)? setFovOptionsEvent,
    TResult? Function(String val)? setLightFreqEvent,
    TResult? Function(String val)? setIsoOptionsEvent,
    TResult? Function(String val)? setEvOptionsEvent,
    TResult? Function(String val)? setVideoResolutionsEvent,
    TResult? Function(bool onDisposeSessions)? disposeBloc,
    TResult? Function(bool withCable)? startStreaming,
    TResult? Function()? socketConnectEvent,
    TResult? Function()? startFrameProcessing,
    TResult? Function()? detectCircleProcessingEvent,
    TResult? Function()? stopCircleDetection,
  }) {
    return started?.call(streamMode, distance, withCable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streamMode, int distance, bool withCable)? started,
    TResult Function(String val, bool isReset)? setFovOptionsEvent,
    TResult Function(String val)? setLightFreqEvent,
    TResult Function(String val)? setIsoOptionsEvent,
    TResult Function(String val)? setEvOptionsEvent,
    TResult Function(String val)? setVideoResolutionsEvent,
    TResult Function(bool onDisposeSessions)? disposeBloc,
    TResult Function(bool withCable)? startStreaming,
    TResult Function()? socketConnectEvent,
    TResult Function()? startFrameProcessing,
    TResult Function()? detectCircleProcessingEvent,
    TResult Function()? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(streamMode, distance, withCable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SetFovOptionsEvent value) setFovOptionsEvent,
    required TResult Function(_SetLightFreqEvent value) setLightFreqEvent,
    required TResult Function(_SetIsoOptionsEvent value) setIsoOptionsEvent,
    required TResult Function(_SetEvOptionsEvent value) setEvOptionsEvent,
    required TResult Function(_SetVideoResolutionsEvent value)
    setVideoResolutionsEvent,
    required TResult Function(_DisposeBloc value) disposeBloc,
    required TResult Function(_StartStreaming value) startStreaming,
    required TResult Function(_SocketConnectEvent value) socketConnectEvent,
    required TResult Function(_StartFrameProcessing value) startFrameProcessing,
    required TResult Function(_DetectCircleProcessingEvent value)
    detectCircleProcessingEvent,
    required TResult Function(_StopCircleDetection value) stopCircleDetection,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult? Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult? Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult? Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult? Function(_SetVideoResolutionsEvent value)?
    setVideoResolutionsEvent,
    TResult? Function(_DisposeBloc value)? disposeBloc,
    TResult? Function(_StartStreaming value)? startStreaming,
    TResult? Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult? Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult? Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult? Function(_StopCircleDetection value)? stopCircleDetection,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult Function(_SetVideoResolutionsEvent value)? setVideoResolutionsEvent,
    TResult Function(_DisposeBloc value)? disposeBloc,
    TResult Function(_StartStreaming value)? startStreaming,
    TResult Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult Function(_StopCircleDetection value)? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements RtspStreamingEvent {
  const factory _Started(
    final int streamMode,
    final int distance,
    final bool withCable,
  ) = _$StartedImpl;

  int get streamMode;
  int get distance;
  bool get withCable;

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetFovOptionsEventImplCopyWith<$Res> {
  factory _$$SetFovOptionsEventImplCopyWith(
    _$SetFovOptionsEventImpl value,
    $Res Function(_$SetFovOptionsEventImpl) then,
  ) = __$$SetFovOptionsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String val, bool isReset});
}

/// @nodoc
class __$$SetFovOptionsEventImplCopyWithImpl<$Res>
    extends _$RtspStreamingEventCopyWithImpl<$Res, _$SetFovOptionsEventImpl>
    implements _$$SetFovOptionsEventImplCopyWith<$Res> {
  __$$SetFovOptionsEventImplCopyWithImpl(
    _$SetFovOptionsEventImpl _value,
    $Res Function(_$SetFovOptionsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? val = null, Object? isReset = null}) {
    return _then(
      _$SetFovOptionsEventImpl(
        null == val
            ? _value.val
            : val // ignore: cast_nullable_to_non_nullable
                as String,
        null == isReset
            ? _value.isReset
            : isReset // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$SetFovOptionsEventImpl implements _SetFovOptionsEvent {
  const _$SetFovOptionsEventImpl(this.val, this.isReset);

  @override
  final String val;
  @override
  final bool isReset;

  @override
  String toString() {
    return 'RtspStreamingEvent.setFovOptionsEvent(val: $val, isReset: $isReset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetFovOptionsEventImpl &&
            (identical(other.val, val) || other.val == val) &&
            (identical(other.isReset, isReset) || other.isReset == isReset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, val, isReset);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetFovOptionsEventImplCopyWith<_$SetFovOptionsEventImpl> get copyWith =>
      __$$SetFovOptionsEventImplCopyWithImpl<_$SetFovOptionsEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streamMode, int distance, bool withCable)
    started,
    required TResult Function(String val, bool isReset) setFovOptionsEvent,
    required TResult Function(String val) setLightFreqEvent,
    required TResult Function(String val) setIsoOptionsEvent,
    required TResult Function(String val) setEvOptionsEvent,
    required TResult Function(String val) setVideoResolutionsEvent,
    required TResult Function(bool onDisposeSessions) disposeBloc,
    required TResult Function(bool withCable) startStreaming,
    required TResult Function() socketConnectEvent,
    required TResult Function() startFrameProcessing,
    required TResult Function() detectCircleProcessingEvent,
    required TResult Function() stopCircleDetection,
  }) {
    return setFovOptionsEvent(val, isReset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streamMode, int distance, bool withCable)? started,
    TResult? Function(String val, bool isReset)? setFovOptionsEvent,
    TResult? Function(String val)? setLightFreqEvent,
    TResult? Function(String val)? setIsoOptionsEvent,
    TResult? Function(String val)? setEvOptionsEvent,
    TResult? Function(String val)? setVideoResolutionsEvent,
    TResult? Function(bool onDisposeSessions)? disposeBloc,
    TResult? Function(bool withCable)? startStreaming,
    TResult? Function()? socketConnectEvent,
    TResult? Function()? startFrameProcessing,
    TResult? Function()? detectCircleProcessingEvent,
    TResult? Function()? stopCircleDetection,
  }) {
    return setFovOptionsEvent?.call(val, isReset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streamMode, int distance, bool withCable)? started,
    TResult Function(String val, bool isReset)? setFovOptionsEvent,
    TResult Function(String val)? setLightFreqEvent,
    TResult Function(String val)? setIsoOptionsEvent,
    TResult Function(String val)? setEvOptionsEvent,
    TResult Function(String val)? setVideoResolutionsEvent,
    TResult Function(bool onDisposeSessions)? disposeBloc,
    TResult Function(bool withCable)? startStreaming,
    TResult Function()? socketConnectEvent,
    TResult Function()? startFrameProcessing,
    TResult Function()? detectCircleProcessingEvent,
    TResult Function()? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (setFovOptionsEvent != null) {
      return setFovOptionsEvent(val, isReset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SetFovOptionsEvent value) setFovOptionsEvent,
    required TResult Function(_SetLightFreqEvent value) setLightFreqEvent,
    required TResult Function(_SetIsoOptionsEvent value) setIsoOptionsEvent,
    required TResult Function(_SetEvOptionsEvent value) setEvOptionsEvent,
    required TResult Function(_SetVideoResolutionsEvent value)
    setVideoResolutionsEvent,
    required TResult Function(_DisposeBloc value) disposeBloc,
    required TResult Function(_StartStreaming value) startStreaming,
    required TResult Function(_SocketConnectEvent value) socketConnectEvent,
    required TResult Function(_StartFrameProcessing value) startFrameProcessing,
    required TResult Function(_DetectCircleProcessingEvent value)
    detectCircleProcessingEvent,
    required TResult Function(_StopCircleDetection value) stopCircleDetection,
  }) {
    return setFovOptionsEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult? Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult? Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult? Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult? Function(_SetVideoResolutionsEvent value)?
    setVideoResolutionsEvent,
    TResult? Function(_DisposeBloc value)? disposeBloc,
    TResult? Function(_StartStreaming value)? startStreaming,
    TResult? Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult? Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult? Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult? Function(_StopCircleDetection value)? stopCircleDetection,
  }) {
    return setFovOptionsEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult Function(_SetVideoResolutionsEvent value)? setVideoResolutionsEvent,
    TResult Function(_DisposeBloc value)? disposeBloc,
    TResult Function(_StartStreaming value)? startStreaming,
    TResult Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult Function(_StopCircleDetection value)? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (setFovOptionsEvent != null) {
      return setFovOptionsEvent(this);
    }
    return orElse();
  }
}

abstract class _SetFovOptionsEvent implements RtspStreamingEvent {
  const factory _SetFovOptionsEvent(final String val, final bool isReset) =
      _$SetFovOptionsEventImpl;

  String get val;
  bool get isReset;

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetFovOptionsEventImplCopyWith<_$SetFovOptionsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetLightFreqEventImplCopyWith<$Res> {
  factory _$$SetLightFreqEventImplCopyWith(
    _$SetLightFreqEventImpl value,
    $Res Function(_$SetLightFreqEventImpl) then,
  ) = __$$SetLightFreqEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String val});
}

/// @nodoc
class __$$SetLightFreqEventImplCopyWithImpl<$Res>
    extends _$RtspStreamingEventCopyWithImpl<$Res, _$SetLightFreqEventImpl>
    implements _$$SetLightFreqEventImplCopyWith<$Res> {
  __$$SetLightFreqEventImplCopyWithImpl(
    _$SetLightFreqEventImpl _value,
    $Res Function(_$SetLightFreqEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? val = null}) {
    return _then(
      _$SetLightFreqEventImpl(
        null == val
            ? _value.val
            : val // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$SetLightFreqEventImpl implements _SetLightFreqEvent {
  const _$SetLightFreqEventImpl(this.val);

  @override
  final String val;

  @override
  String toString() {
    return 'RtspStreamingEvent.setLightFreqEvent(val: $val)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetLightFreqEventImpl &&
            (identical(other.val, val) || other.val == val));
  }

  @override
  int get hashCode => Object.hash(runtimeType, val);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetLightFreqEventImplCopyWith<_$SetLightFreqEventImpl> get copyWith =>
      __$$SetLightFreqEventImplCopyWithImpl<_$SetLightFreqEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streamMode, int distance, bool withCable)
    started,
    required TResult Function(String val, bool isReset) setFovOptionsEvent,
    required TResult Function(String val) setLightFreqEvent,
    required TResult Function(String val) setIsoOptionsEvent,
    required TResult Function(String val) setEvOptionsEvent,
    required TResult Function(String val) setVideoResolutionsEvent,
    required TResult Function(bool onDisposeSessions) disposeBloc,
    required TResult Function(bool withCable) startStreaming,
    required TResult Function() socketConnectEvent,
    required TResult Function() startFrameProcessing,
    required TResult Function() detectCircleProcessingEvent,
    required TResult Function() stopCircleDetection,
  }) {
    return setLightFreqEvent(val);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streamMode, int distance, bool withCable)? started,
    TResult? Function(String val, bool isReset)? setFovOptionsEvent,
    TResult? Function(String val)? setLightFreqEvent,
    TResult? Function(String val)? setIsoOptionsEvent,
    TResult? Function(String val)? setEvOptionsEvent,
    TResult? Function(String val)? setVideoResolutionsEvent,
    TResult? Function(bool onDisposeSessions)? disposeBloc,
    TResult? Function(bool withCable)? startStreaming,
    TResult? Function()? socketConnectEvent,
    TResult? Function()? startFrameProcessing,
    TResult? Function()? detectCircleProcessingEvent,
    TResult? Function()? stopCircleDetection,
  }) {
    return setLightFreqEvent?.call(val);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streamMode, int distance, bool withCable)? started,
    TResult Function(String val, bool isReset)? setFovOptionsEvent,
    TResult Function(String val)? setLightFreqEvent,
    TResult Function(String val)? setIsoOptionsEvent,
    TResult Function(String val)? setEvOptionsEvent,
    TResult Function(String val)? setVideoResolutionsEvent,
    TResult Function(bool onDisposeSessions)? disposeBloc,
    TResult Function(bool withCable)? startStreaming,
    TResult Function()? socketConnectEvent,
    TResult Function()? startFrameProcessing,
    TResult Function()? detectCircleProcessingEvent,
    TResult Function()? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (setLightFreqEvent != null) {
      return setLightFreqEvent(val);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SetFovOptionsEvent value) setFovOptionsEvent,
    required TResult Function(_SetLightFreqEvent value) setLightFreqEvent,
    required TResult Function(_SetIsoOptionsEvent value) setIsoOptionsEvent,
    required TResult Function(_SetEvOptionsEvent value) setEvOptionsEvent,
    required TResult Function(_SetVideoResolutionsEvent value)
    setVideoResolutionsEvent,
    required TResult Function(_DisposeBloc value) disposeBloc,
    required TResult Function(_StartStreaming value) startStreaming,
    required TResult Function(_SocketConnectEvent value) socketConnectEvent,
    required TResult Function(_StartFrameProcessing value) startFrameProcessing,
    required TResult Function(_DetectCircleProcessingEvent value)
    detectCircleProcessingEvent,
    required TResult Function(_StopCircleDetection value) stopCircleDetection,
  }) {
    return setLightFreqEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult? Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult? Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult? Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult? Function(_SetVideoResolutionsEvent value)?
    setVideoResolutionsEvent,
    TResult? Function(_DisposeBloc value)? disposeBloc,
    TResult? Function(_StartStreaming value)? startStreaming,
    TResult? Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult? Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult? Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult? Function(_StopCircleDetection value)? stopCircleDetection,
  }) {
    return setLightFreqEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult Function(_SetVideoResolutionsEvent value)? setVideoResolutionsEvent,
    TResult Function(_DisposeBloc value)? disposeBloc,
    TResult Function(_StartStreaming value)? startStreaming,
    TResult Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult Function(_StopCircleDetection value)? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (setLightFreqEvent != null) {
      return setLightFreqEvent(this);
    }
    return orElse();
  }
}

abstract class _SetLightFreqEvent implements RtspStreamingEvent {
  const factory _SetLightFreqEvent(final String val) = _$SetLightFreqEventImpl;

  String get val;

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetLightFreqEventImplCopyWith<_$SetLightFreqEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetIsoOptionsEventImplCopyWith<$Res> {
  factory _$$SetIsoOptionsEventImplCopyWith(
    _$SetIsoOptionsEventImpl value,
    $Res Function(_$SetIsoOptionsEventImpl) then,
  ) = __$$SetIsoOptionsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String val});
}

/// @nodoc
class __$$SetIsoOptionsEventImplCopyWithImpl<$Res>
    extends _$RtspStreamingEventCopyWithImpl<$Res, _$SetIsoOptionsEventImpl>
    implements _$$SetIsoOptionsEventImplCopyWith<$Res> {
  __$$SetIsoOptionsEventImplCopyWithImpl(
    _$SetIsoOptionsEventImpl _value,
    $Res Function(_$SetIsoOptionsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? val = null}) {
    return _then(
      _$SetIsoOptionsEventImpl(
        null == val
            ? _value.val
            : val // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$SetIsoOptionsEventImpl implements _SetIsoOptionsEvent {
  const _$SetIsoOptionsEventImpl(this.val);

  @override
  final String val;

  @override
  String toString() {
    return 'RtspStreamingEvent.setIsoOptionsEvent(val: $val)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetIsoOptionsEventImpl &&
            (identical(other.val, val) || other.val == val));
  }

  @override
  int get hashCode => Object.hash(runtimeType, val);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetIsoOptionsEventImplCopyWith<_$SetIsoOptionsEventImpl> get copyWith =>
      __$$SetIsoOptionsEventImplCopyWithImpl<_$SetIsoOptionsEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streamMode, int distance, bool withCable)
    started,
    required TResult Function(String val, bool isReset) setFovOptionsEvent,
    required TResult Function(String val) setLightFreqEvent,
    required TResult Function(String val) setIsoOptionsEvent,
    required TResult Function(String val) setEvOptionsEvent,
    required TResult Function(String val) setVideoResolutionsEvent,
    required TResult Function(bool onDisposeSessions) disposeBloc,
    required TResult Function(bool withCable) startStreaming,
    required TResult Function() socketConnectEvent,
    required TResult Function() startFrameProcessing,
    required TResult Function() detectCircleProcessingEvent,
    required TResult Function() stopCircleDetection,
  }) {
    return setIsoOptionsEvent(val);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streamMode, int distance, bool withCable)? started,
    TResult? Function(String val, bool isReset)? setFovOptionsEvent,
    TResult? Function(String val)? setLightFreqEvent,
    TResult? Function(String val)? setIsoOptionsEvent,
    TResult? Function(String val)? setEvOptionsEvent,
    TResult? Function(String val)? setVideoResolutionsEvent,
    TResult? Function(bool onDisposeSessions)? disposeBloc,
    TResult? Function(bool withCable)? startStreaming,
    TResult? Function()? socketConnectEvent,
    TResult? Function()? startFrameProcessing,
    TResult? Function()? detectCircleProcessingEvent,
    TResult? Function()? stopCircleDetection,
  }) {
    return setIsoOptionsEvent?.call(val);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streamMode, int distance, bool withCable)? started,
    TResult Function(String val, bool isReset)? setFovOptionsEvent,
    TResult Function(String val)? setLightFreqEvent,
    TResult Function(String val)? setIsoOptionsEvent,
    TResult Function(String val)? setEvOptionsEvent,
    TResult Function(String val)? setVideoResolutionsEvent,
    TResult Function(bool onDisposeSessions)? disposeBloc,
    TResult Function(bool withCable)? startStreaming,
    TResult Function()? socketConnectEvent,
    TResult Function()? startFrameProcessing,
    TResult Function()? detectCircleProcessingEvent,
    TResult Function()? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (setIsoOptionsEvent != null) {
      return setIsoOptionsEvent(val);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SetFovOptionsEvent value) setFovOptionsEvent,
    required TResult Function(_SetLightFreqEvent value) setLightFreqEvent,
    required TResult Function(_SetIsoOptionsEvent value) setIsoOptionsEvent,
    required TResult Function(_SetEvOptionsEvent value) setEvOptionsEvent,
    required TResult Function(_SetVideoResolutionsEvent value)
    setVideoResolutionsEvent,
    required TResult Function(_DisposeBloc value) disposeBloc,
    required TResult Function(_StartStreaming value) startStreaming,
    required TResult Function(_SocketConnectEvent value) socketConnectEvent,
    required TResult Function(_StartFrameProcessing value) startFrameProcessing,
    required TResult Function(_DetectCircleProcessingEvent value)
    detectCircleProcessingEvent,
    required TResult Function(_StopCircleDetection value) stopCircleDetection,
  }) {
    return setIsoOptionsEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult? Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult? Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult? Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult? Function(_SetVideoResolutionsEvent value)?
    setVideoResolutionsEvent,
    TResult? Function(_DisposeBloc value)? disposeBloc,
    TResult? Function(_StartStreaming value)? startStreaming,
    TResult? Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult? Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult? Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult? Function(_StopCircleDetection value)? stopCircleDetection,
  }) {
    return setIsoOptionsEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult Function(_SetVideoResolutionsEvent value)? setVideoResolutionsEvent,
    TResult Function(_DisposeBloc value)? disposeBloc,
    TResult Function(_StartStreaming value)? startStreaming,
    TResult Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult Function(_StopCircleDetection value)? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (setIsoOptionsEvent != null) {
      return setIsoOptionsEvent(this);
    }
    return orElse();
  }
}

abstract class _SetIsoOptionsEvent implements RtspStreamingEvent {
  const factory _SetIsoOptionsEvent(final String val) =
      _$SetIsoOptionsEventImpl;

  String get val;

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetIsoOptionsEventImplCopyWith<_$SetIsoOptionsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetEvOptionsEventImplCopyWith<$Res> {
  factory _$$SetEvOptionsEventImplCopyWith(
    _$SetEvOptionsEventImpl value,
    $Res Function(_$SetEvOptionsEventImpl) then,
  ) = __$$SetEvOptionsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String val});
}

/// @nodoc
class __$$SetEvOptionsEventImplCopyWithImpl<$Res>
    extends _$RtspStreamingEventCopyWithImpl<$Res, _$SetEvOptionsEventImpl>
    implements _$$SetEvOptionsEventImplCopyWith<$Res> {
  __$$SetEvOptionsEventImplCopyWithImpl(
    _$SetEvOptionsEventImpl _value,
    $Res Function(_$SetEvOptionsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? val = null}) {
    return _then(
      _$SetEvOptionsEventImpl(
        null == val
            ? _value.val
            : val // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$SetEvOptionsEventImpl implements _SetEvOptionsEvent {
  const _$SetEvOptionsEventImpl(this.val);

  @override
  final String val;

  @override
  String toString() {
    return 'RtspStreamingEvent.setEvOptionsEvent(val: $val)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetEvOptionsEventImpl &&
            (identical(other.val, val) || other.val == val));
  }

  @override
  int get hashCode => Object.hash(runtimeType, val);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetEvOptionsEventImplCopyWith<_$SetEvOptionsEventImpl> get copyWith =>
      __$$SetEvOptionsEventImplCopyWithImpl<_$SetEvOptionsEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streamMode, int distance, bool withCable)
    started,
    required TResult Function(String val, bool isReset) setFovOptionsEvent,
    required TResult Function(String val) setLightFreqEvent,
    required TResult Function(String val) setIsoOptionsEvent,
    required TResult Function(String val) setEvOptionsEvent,
    required TResult Function(String val) setVideoResolutionsEvent,
    required TResult Function(bool onDisposeSessions) disposeBloc,
    required TResult Function(bool withCable) startStreaming,
    required TResult Function() socketConnectEvent,
    required TResult Function() startFrameProcessing,
    required TResult Function() detectCircleProcessingEvent,
    required TResult Function() stopCircleDetection,
  }) {
    return setEvOptionsEvent(val);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streamMode, int distance, bool withCable)? started,
    TResult? Function(String val, bool isReset)? setFovOptionsEvent,
    TResult? Function(String val)? setLightFreqEvent,
    TResult? Function(String val)? setIsoOptionsEvent,
    TResult? Function(String val)? setEvOptionsEvent,
    TResult? Function(String val)? setVideoResolutionsEvent,
    TResult? Function(bool onDisposeSessions)? disposeBloc,
    TResult? Function(bool withCable)? startStreaming,
    TResult? Function()? socketConnectEvent,
    TResult? Function()? startFrameProcessing,
    TResult? Function()? detectCircleProcessingEvent,
    TResult? Function()? stopCircleDetection,
  }) {
    return setEvOptionsEvent?.call(val);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streamMode, int distance, bool withCable)? started,
    TResult Function(String val, bool isReset)? setFovOptionsEvent,
    TResult Function(String val)? setLightFreqEvent,
    TResult Function(String val)? setIsoOptionsEvent,
    TResult Function(String val)? setEvOptionsEvent,
    TResult Function(String val)? setVideoResolutionsEvent,
    TResult Function(bool onDisposeSessions)? disposeBloc,
    TResult Function(bool withCable)? startStreaming,
    TResult Function()? socketConnectEvent,
    TResult Function()? startFrameProcessing,
    TResult Function()? detectCircleProcessingEvent,
    TResult Function()? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (setEvOptionsEvent != null) {
      return setEvOptionsEvent(val);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SetFovOptionsEvent value) setFovOptionsEvent,
    required TResult Function(_SetLightFreqEvent value) setLightFreqEvent,
    required TResult Function(_SetIsoOptionsEvent value) setIsoOptionsEvent,
    required TResult Function(_SetEvOptionsEvent value) setEvOptionsEvent,
    required TResult Function(_SetVideoResolutionsEvent value)
    setVideoResolutionsEvent,
    required TResult Function(_DisposeBloc value) disposeBloc,
    required TResult Function(_StartStreaming value) startStreaming,
    required TResult Function(_SocketConnectEvent value) socketConnectEvent,
    required TResult Function(_StartFrameProcessing value) startFrameProcessing,
    required TResult Function(_DetectCircleProcessingEvent value)
    detectCircleProcessingEvent,
    required TResult Function(_StopCircleDetection value) stopCircleDetection,
  }) {
    return setEvOptionsEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult? Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult? Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult? Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult? Function(_SetVideoResolutionsEvent value)?
    setVideoResolutionsEvent,
    TResult? Function(_DisposeBloc value)? disposeBloc,
    TResult? Function(_StartStreaming value)? startStreaming,
    TResult? Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult? Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult? Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult? Function(_StopCircleDetection value)? stopCircleDetection,
  }) {
    return setEvOptionsEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult Function(_SetVideoResolutionsEvent value)? setVideoResolutionsEvent,
    TResult Function(_DisposeBloc value)? disposeBloc,
    TResult Function(_StartStreaming value)? startStreaming,
    TResult Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult Function(_StopCircleDetection value)? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (setEvOptionsEvent != null) {
      return setEvOptionsEvent(this);
    }
    return orElse();
  }
}

abstract class _SetEvOptionsEvent implements RtspStreamingEvent {
  const factory _SetEvOptionsEvent(final String val) = _$SetEvOptionsEventImpl;

  String get val;

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetEvOptionsEventImplCopyWith<_$SetEvOptionsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetVideoResolutionsEventImplCopyWith<$Res> {
  factory _$$SetVideoResolutionsEventImplCopyWith(
    _$SetVideoResolutionsEventImpl value,
    $Res Function(_$SetVideoResolutionsEventImpl) then,
  ) = __$$SetVideoResolutionsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String val});
}

/// @nodoc
class __$$SetVideoResolutionsEventImplCopyWithImpl<$Res>
    extends
        _$RtspStreamingEventCopyWithImpl<$Res, _$SetVideoResolutionsEventImpl>
    implements _$$SetVideoResolutionsEventImplCopyWith<$Res> {
  __$$SetVideoResolutionsEventImplCopyWithImpl(
    _$SetVideoResolutionsEventImpl _value,
    $Res Function(_$SetVideoResolutionsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? val = null}) {
    return _then(
      _$SetVideoResolutionsEventImpl(
        null == val
            ? _value.val
            : val // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$SetVideoResolutionsEventImpl implements _SetVideoResolutionsEvent {
  const _$SetVideoResolutionsEventImpl(this.val);

  @override
  final String val;

  @override
  String toString() {
    return 'RtspStreamingEvent.setVideoResolutionsEvent(val: $val)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetVideoResolutionsEventImpl &&
            (identical(other.val, val) || other.val == val));
  }

  @override
  int get hashCode => Object.hash(runtimeType, val);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetVideoResolutionsEventImplCopyWith<_$SetVideoResolutionsEventImpl>
  get copyWith => __$$SetVideoResolutionsEventImplCopyWithImpl<
    _$SetVideoResolutionsEventImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streamMode, int distance, bool withCable)
    started,
    required TResult Function(String val, bool isReset) setFovOptionsEvent,
    required TResult Function(String val) setLightFreqEvent,
    required TResult Function(String val) setIsoOptionsEvent,
    required TResult Function(String val) setEvOptionsEvent,
    required TResult Function(String val) setVideoResolutionsEvent,
    required TResult Function(bool onDisposeSessions) disposeBloc,
    required TResult Function(bool withCable) startStreaming,
    required TResult Function() socketConnectEvent,
    required TResult Function() startFrameProcessing,
    required TResult Function() detectCircleProcessingEvent,
    required TResult Function() stopCircleDetection,
  }) {
    return setVideoResolutionsEvent(val);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streamMode, int distance, bool withCable)? started,
    TResult? Function(String val, bool isReset)? setFovOptionsEvent,
    TResult? Function(String val)? setLightFreqEvent,
    TResult? Function(String val)? setIsoOptionsEvent,
    TResult? Function(String val)? setEvOptionsEvent,
    TResult? Function(String val)? setVideoResolutionsEvent,
    TResult? Function(bool onDisposeSessions)? disposeBloc,
    TResult? Function(bool withCable)? startStreaming,
    TResult? Function()? socketConnectEvent,
    TResult? Function()? startFrameProcessing,
    TResult? Function()? detectCircleProcessingEvent,
    TResult? Function()? stopCircleDetection,
  }) {
    return setVideoResolutionsEvent?.call(val);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streamMode, int distance, bool withCable)? started,
    TResult Function(String val, bool isReset)? setFovOptionsEvent,
    TResult Function(String val)? setLightFreqEvent,
    TResult Function(String val)? setIsoOptionsEvent,
    TResult Function(String val)? setEvOptionsEvent,
    TResult Function(String val)? setVideoResolutionsEvent,
    TResult Function(bool onDisposeSessions)? disposeBloc,
    TResult Function(bool withCable)? startStreaming,
    TResult Function()? socketConnectEvent,
    TResult Function()? startFrameProcessing,
    TResult Function()? detectCircleProcessingEvent,
    TResult Function()? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (setVideoResolutionsEvent != null) {
      return setVideoResolutionsEvent(val);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SetFovOptionsEvent value) setFovOptionsEvent,
    required TResult Function(_SetLightFreqEvent value) setLightFreqEvent,
    required TResult Function(_SetIsoOptionsEvent value) setIsoOptionsEvent,
    required TResult Function(_SetEvOptionsEvent value) setEvOptionsEvent,
    required TResult Function(_SetVideoResolutionsEvent value)
    setVideoResolutionsEvent,
    required TResult Function(_DisposeBloc value) disposeBloc,
    required TResult Function(_StartStreaming value) startStreaming,
    required TResult Function(_SocketConnectEvent value) socketConnectEvent,
    required TResult Function(_StartFrameProcessing value) startFrameProcessing,
    required TResult Function(_DetectCircleProcessingEvent value)
    detectCircleProcessingEvent,
    required TResult Function(_StopCircleDetection value) stopCircleDetection,
  }) {
    return setVideoResolutionsEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult? Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult? Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult? Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult? Function(_SetVideoResolutionsEvent value)?
    setVideoResolutionsEvent,
    TResult? Function(_DisposeBloc value)? disposeBloc,
    TResult? Function(_StartStreaming value)? startStreaming,
    TResult? Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult? Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult? Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult? Function(_StopCircleDetection value)? stopCircleDetection,
  }) {
    return setVideoResolutionsEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult Function(_SetVideoResolutionsEvent value)? setVideoResolutionsEvent,
    TResult Function(_DisposeBloc value)? disposeBloc,
    TResult Function(_StartStreaming value)? startStreaming,
    TResult Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult Function(_StopCircleDetection value)? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (setVideoResolutionsEvent != null) {
      return setVideoResolutionsEvent(this);
    }
    return orElse();
  }
}

abstract class _SetVideoResolutionsEvent implements RtspStreamingEvent {
  const factory _SetVideoResolutionsEvent(final String val) =
      _$SetVideoResolutionsEventImpl;

  String get val;

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetVideoResolutionsEventImplCopyWith<_$SetVideoResolutionsEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisposeBlocImplCopyWith<$Res> {
  factory _$$DisposeBlocImplCopyWith(
    _$DisposeBlocImpl value,
    $Res Function(_$DisposeBlocImpl) then,
  ) = __$$DisposeBlocImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool onDisposeSessions});
}

/// @nodoc
class __$$DisposeBlocImplCopyWithImpl<$Res>
    extends _$RtspStreamingEventCopyWithImpl<$Res, _$DisposeBlocImpl>
    implements _$$DisposeBlocImplCopyWith<$Res> {
  __$$DisposeBlocImplCopyWithImpl(
    _$DisposeBlocImpl _value,
    $Res Function(_$DisposeBlocImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? onDisposeSessions = null}) {
    return _then(
      _$DisposeBlocImpl(
        null == onDisposeSessions
            ? _value.onDisposeSessions
            : onDisposeSessions // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$DisposeBlocImpl implements _DisposeBloc {
  const _$DisposeBlocImpl(this.onDisposeSessions);

  @override
  final bool onDisposeSessions;

  @override
  String toString() {
    return 'RtspStreamingEvent.disposeBloc(onDisposeSessions: $onDisposeSessions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisposeBlocImpl &&
            (identical(other.onDisposeSessions, onDisposeSessions) ||
                other.onDisposeSessions == onDisposeSessions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onDisposeSessions);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisposeBlocImplCopyWith<_$DisposeBlocImpl> get copyWith =>
      __$$DisposeBlocImplCopyWithImpl<_$DisposeBlocImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streamMode, int distance, bool withCable)
    started,
    required TResult Function(String val, bool isReset) setFovOptionsEvent,
    required TResult Function(String val) setLightFreqEvent,
    required TResult Function(String val) setIsoOptionsEvent,
    required TResult Function(String val) setEvOptionsEvent,
    required TResult Function(String val) setVideoResolutionsEvent,
    required TResult Function(bool onDisposeSessions) disposeBloc,
    required TResult Function(bool withCable) startStreaming,
    required TResult Function() socketConnectEvent,
    required TResult Function() startFrameProcessing,
    required TResult Function() detectCircleProcessingEvent,
    required TResult Function() stopCircleDetection,
  }) {
    return disposeBloc(onDisposeSessions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streamMode, int distance, bool withCable)? started,
    TResult? Function(String val, bool isReset)? setFovOptionsEvent,
    TResult? Function(String val)? setLightFreqEvent,
    TResult? Function(String val)? setIsoOptionsEvent,
    TResult? Function(String val)? setEvOptionsEvent,
    TResult? Function(String val)? setVideoResolutionsEvent,
    TResult? Function(bool onDisposeSessions)? disposeBloc,
    TResult? Function(bool withCable)? startStreaming,
    TResult? Function()? socketConnectEvent,
    TResult? Function()? startFrameProcessing,
    TResult? Function()? detectCircleProcessingEvent,
    TResult? Function()? stopCircleDetection,
  }) {
    return disposeBloc?.call(onDisposeSessions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streamMode, int distance, bool withCable)? started,
    TResult Function(String val, bool isReset)? setFovOptionsEvent,
    TResult Function(String val)? setLightFreqEvent,
    TResult Function(String val)? setIsoOptionsEvent,
    TResult Function(String val)? setEvOptionsEvent,
    TResult Function(String val)? setVideoResolutionsEvent,
    TResult Function(bool onDisposeSessions)? disposeBloc,
    TResult Function(bool withCable)? startStreaming,
    TResult Function()? socketConnectEvent,
    TResult Function()? startFrameProcessing,
    TResult Function()? detectCircleProcessingEvent,
    TResult Function()? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (disposeBloc != null) {
      return disposeBloc(onDisposeSessions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SetFovOptionsEvent value) setFovOptionsEvent,
    required TResult Function(_SetLightFreqEvent value) setLightFreqEvent,
    required TResult Function(_SetIsoOptionsEvent value) setIsoOptionsEvent,
    required TResult Function(_SetEvOptionsEvent value) setEvOptionsEvent,
    required TResult Function(_SetVideoResolutionsEvent value)
    setVideoResolutionsEvent,
    required TResult Function(_DisposeBloc value) disposeBloc,
    required TResult Function(_StartStreaming value) startStreaming,
    required TResult Function(_SocketConnectEvent value) socketConnectEvent,
    required TResult Function(_StartFrameProcessing value) startFrameProcessing,
    required TResult Function(_DetectCircleProcessingEvent value)
    detectCircleProcessingEvent,
    required TResult Function(_StopCircleDetection value) stopCircleDetection,
  }) {
    return disposeBloc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult? Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult? Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult? Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult? Function(_SetVideoResolutionsEvent value)?
    setVideoResolutionsEvent,
    TResult? Function(_DisposeBloc value)? disposeBloc,
    TResult? Function(_StartStreaming value)? startStreaming,
    TResult? Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult? Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult? Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult? Function(_StopCircleDetection value)? stopCircleDetection,
  }) {
    return disposeBloc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult Function(_SetVideoResolutionsEvent value)? setVideoResolutionsEvent,
    TResult Function(_DisposeBloc value)? disposeBloc,
    TResult Function(_StartStreaming value)? startStreaming,
    TResult Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult Function(_StopCircleDetection value)? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (disposeBloc != null) {
      return disposeBloc(this);
    }
    return orElse();
  }
}

abstract class _DisposeBloc implements RtspStreamingEvent {
  const factory _DisposeBloc(final bool onDisposeSessions) = _$DisposeBlocImpl;

  bool get onDisposeSessions;

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisposeBlocImplCopyWith<_$DisposeBlocImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartStreamingImplCopyWith<$Res> {
  factory _$$StartStreamingImplCopyWith(
    _$StartStreamingImpl value,
    $Res Function(_$StartStreamingImpl) then,
  ) = __$$StartStreamingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool withCable});
}

/// @nodoc
class __$$StartStreamingImplCopyWithImpl<$Res>
    extends _$RtspStreamingEventCopyWithImpl<$Res, _$StartStreamingImpl>
    implements _$$StartStreamingImplCopyWith<$Res> {
  __$$StartStreamingImplCopyWithImpl(
    _$StartStreamingImpl _value,
    $Res Function(_$StartStreamingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? withCable = null}) {
    return _then(
      _$StartStreamingImpl(
        null == withCable
            ? _value.withCable
            : withCable // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$StartStreamingImpl implements _StartStreaming {
  const _$StartStreamingImpl(this.withCable);

  @override
  final bool withCable;

  @override
  String toString() {
    return 'RtspStreamingEvent.startStreaming(withCable: $withCable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartStreamingImpl &&
            (identical(other.withCable, withCable) ||
                other.withCable == withCable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, withCable);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartStreamingImplCopyWith<_$StartStreamingImpl> get copyWith =>
      __$$StartStreamingImplCopyWithImpl<_$StartStreamingImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streamMode, int distance, bool withCable)
    started,
    required TResult Function(String val, bool isReset) setFovOptionsEvent,
    required TResult Function(String val) setLightFreqEvent,
    required TResult Function(String val) setIsoOptionsEvent,
    required TResult Function(String val) setEvOptionsEvent,
    required TResult Function(String val) setVideoResolutionsEvent,
    required TResult Function(bool onDisposeSessions) disposeBloc,
    required TResult Function(bool withCable) startStreaming,
    required TResult Function() socketConnectEvent,
    required TResult Function() startFrameProcessing,
    required TResult Function() detectCircleProcessingEvent,
    required TResult Function() stopCircleDetection,
  }) {
    return startStreaming(withCable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streamMode, int distance, bool withCable)? started,
    TResult? Function(String val, bool isReset)? setFovOptionsEvent,
    TResult? Function(String val)? setLightFreqEvent,
    TResult? Function(String val)? setIsoOptionsEvent,
    TResult? Function(String val)? setEvOptionsEvent,
    TResult? Function(String val)? setVideoResolutionsEvent,
    TResult? Function(bool onDisposeSessions)? disposeBloc,
    TResult? Function(bool withCable)? startStreaming,
    TResult? Function()? socketConnectEvent,
    TResult? Function()? startFrameProcessing,
    TResult? Function()? detectCircleProcessingEvent,
    TResult? Function()? stopCircleDetection,
  }) {
    return startStreaming?.call(withCable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streamMode, int distance, bool withCable)? started,
    TResult Function(String val, bool isReset)? setFovOptionsEvent,
    TResult Function(String val)? setLightFreqEvent,
    TResult Function(String val)? setIsoOptionsEvent,
    TResult Function(String val)? setEvOptionsEvent,
    TResult Function(String val)? setVideoResolutionsEvent,
    TResult Function(bool onDisposeSessions)? disposeBloc,
    TResult Function(bool withCable)? startStreaming,
    TResult Function()? socketConnectEvent,
    TResult Function()? startFrameProcessing,
    TResult Function()? detectCircleProcessingEvent,
    TResult Function()? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (startStreaming != null) {
      return startStreaming(withCable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SetFovOptionsEvent value) setFovOptionsEvent,
    required TResult Function(_SetLightFreqEvent value) setLightFreqEvent,
    required TResult Function(_SetIsoOptionsEvent value) setIsoOptionsEvent,
    required TResult Function(_SetEvOptionsEvent value) setEvOptionsEvent,
    required TResult Function(_SetVideoResolutionsEvent value)
    setVideoResolutionsEvent,
    required TResult Function(_DisposeBloc value) disposeBloc,
    required TResult Function(_StartStreaming value) startStreaming,
    required TResult Function(_SocketConnectEvent value) socketConnectEvent,
    required TResult Function(_StartFrameProcessing value) startFrameProcessing,
    required TResult Function(_DetectCircleProcessingEvent value)
    detectCircleProcessingEvent,
    required TResult Function(_StopCircleDetection value) stopCircleDetection,
  }) {
    return startStreaming(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult? Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult? Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult? Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult? Function(_SetVideoResolutionsEvent value)?
    setVideoResolutionsEvent,
    TResult? Function(_DisposeBloc value)? disposeBloc,
    TResult? Function(_StartStreaming value)? startStreaming,
    TResult? Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult? Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult? Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult? Function(_StopCircleDetection value)? stopCircleDetection,
  }) {
    return startStreaming?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult Function(_SetVideoResolutionsEvent value)? setVideoResolutionsEvent,
    TResult Function(_DisposeBloc value)? disposeBloc,
    TResult Function(_StartStreaming value)? startStreaming,
    TResult Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult Function(_StopCircleDetection value)? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (startStreaming != null) {
      return startStreaming(this);
    }
    return orElse();
  }
}

abstract class _StartStreaming implements RtspStreamingEvent {
  const factory _StartStreaming(final bool withCable) = _$StartStreamingImpl;

  bool get withCable;

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartStreamingImplCopyWith<_$StartStreamingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SocketConnectEventImplCopyWith<$Res> {
  factory _$$SocketConnectEventImplCopyWith(
    _$SocketConnectEventImpl value,
    $Res Function(_$SocketConnectEventImpl) then,
  ) = __$$SocketConnectEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SocketConnectEventImplCopyWithImpl<$Res>
    extends _$RtspStreamingEventCopyWithImpl<$Res, _$SocketConnectEventImpl>
    implements _$$SocketConnectEventImplCopyWith<$Res> {
  __$$SocketConnectEventImplCopyWithImpl(
    _$SocketConnectEventImpl _value,
    $Res Function(_$SocketConnectEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SocketConnectEventImpl implements _SocketConnectEvent {
  const _$SocketConnectEventImpl();

  @override
  String toString() {
    return 'RtspStreamingEvent.socketConnectEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SocketConnectEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streamMode, int distance, bool withCable)
    started,
    required TResult Function(String val, bool isReset) setFovOptionsEvent,
    required TResult Function(String val) setLightFreqEvent,
    required TResult Function(String val) setIsoOptionsEvent,
    required TResult Function(String val) setEvOptionsEvent,
    required TResult Function(String val) setVideoResolutionsEvent,
    required TResult Function(bool onDisposeSessions) disposeBloc,
    required TResult Function(bool withCable) startStreaming,
    required TResult Function() socketConnectEvent,
    required TResult Function() startFrameProcessing,
    required TResult Function() detectCircleProcessingEvent,
    required TResult Function() stopCircleDetection,
  }) {
    return socketConnectEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streamMode, int distance, bool withCable)? started,
    TResult? Function(String val, bool isReset)? setFovOptionsEvent,
    TResult? Function(String val)? setLightFreqEvent,
    TResult? Function(String val)? setIsoOptionsEvent,
    TResult? Function(String val)? setEvOptionsEvent,
    TResult? Function(String val)? setVideoResolutionsEvent,
    TResult? Function(bool onDisposeSessions)? disposeBloc,
    TResult? Function(bool withCable)? startStreaming,
    TResult? Function()? socketConnectEvent,
    TResult? Function()? startFrameProcessing,
    TResult? Function()? detectCircleProcessingEvent,
    TResult? Function()? stopCircleDetection,
  }) {
    return socketConnectEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streamMode, int distance, bool withCable)? started,
    TResult Function(String val, bool isReset)? setFovOptionsEvent,
    TResult Function(String val)? setLightFreqEvent,
    TResult Function(String val)? setIsoOptionsEvent,
    TResult Function(String val)? setEvOptionsEvent,
    TResult Function(String val)? setVideoResolutionsEvent,
    TResult Function(bool onDisposeSessions)? disposeBloc,
    TResult Function(bool withCable)? startStreaming,
    TResult Function()? socketConnectEvent,
    TResult Function()? startFrameProcessing,
    TResult Function()? detectCircleProcessingEvent,
    TResult Function()? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (socketConnectEvent != null) {
      return socketConnectEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SetFovOptionsEvent value) setFovOptionsEvent,
    required TResult Function(_SetLightFreqEvent value) setLightFreqEvent,
    required TResult Function(_SetIsoOptionsEvent value) setIsoOptionsEvent,
    required TResult Function(_SetEvOptionsEvent value) setEvOptionsEvent,
    required TResult Function(_SetVideoResolutionsEvent value)
    setVideoResolutionsEvent,
    required TResult Function(_DisposeBloc value) disposeBloc,
    required TResult Function(_StartStreaming value) startStreaming,
    required TResult Function(_SocketConnectEvent value) socketConnectEvent,
    required TResult Function(_StartFrameProcessing value) startFrameProcessing,
    required TResult Function(_DetectCircleProcessingEvent value)
    detectCircleProcessingEvent,
    required TResult Function(_StopCircleDetection value) stopCircleDetection,
  }) {
    return socketConnectEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult? Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult? Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult? Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult? Function(_SetVideoResolutionsEvent value)?
    setVideoResolutionsEvent,
    TResult? Function(_DisposeBloc value)? disposeBloc,
    TResult? Function(_StartStreaming value)? startStreaming,
    TResult? Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult? Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult? Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult? Function(_StopCircleDetection value)? stopCircleDetection,
  }) {
    return socketConnectEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult Function(_SetVideoResolutionsEvent value)? setVideoResolutionsEvent,
    TResult Function(_DisposeBloc value)? disposeBloc,
    TResult Function(_StartStreaming value)? startStreaming,
    TResult Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult Function(_StopCircleDetection value)? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (socketConnectEvent != null) {
      return socketConnectEvent(this);
    }
    return orElse();
  }
}

abstract class _SocketConnectEvent implements RtspStreamingEvent {
  const factory _SocketConnectEvent() = _$SocketConnectEventImpl;
}

/// @nodoc
abstract class _$$StartFrameProcessingImplCopyWith<$Res> {
  factory _$$StartFrameProcessingImplCopyWith(
    _$StartFrameProcessingImpl value,
    $Res Function(_$StartFrameProcessingImpl) then,
  ) = __$$StartFrameProcessingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartFrameProcessingImplCopyWithImpl<$Res>
    extends _$RtspStreamingEventCopyWithImpl<$Res, _$StartFrameProcessingImpl>
    implements _$$StartFrameProcessingImplCopyWith<$Res> {
  __$$StartFrameProcessingImplCopyWithImpl(
    _$StartFrameProcessingImpl _value,
    $Res Function(_$StartFrameProcessingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartFrameProcessingImpl implements _StartFrameProcessing {
  const _$StartFrameProcessingImpl();

  @override
  String toString() {
    return 'RtspStreamingEvent.startFrameProcessing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartFrameProcessingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streamMode, int distance, bool withCable)
    started,
    required TResult Function(String val, bool isReset) setFovOptionsEvent,
    required TResult Function(String val) setLightFreqEvent,
    required TResult Function(String val) setIsoOptionsEvent,
    required TResult Function(String val) setEvOptionsEvent,
    required TResult Function(String val) setVideoResolutionsEvent,
    required TResult Function(bool onDisposeSessions) disposeBloc,
    required TResult Function(bool withCable) startStreaming,
    required TResult Function() socketConnectEvent,
    required TResult Function() startFrameProcessing,
    required TResult Function() detectCircleProcessingEvent,
    required TResult Function() stopCircleDetection,
  }) {
    return startFrameProcessing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streamMode, int distance, bool withCable)? started,
    TResult? Function(String val, bool isReset)? setFovOptionsEvent,
    TResult? Function(String val)? setLightFreqEvent,
    TResult? Function(String val)? setIsoOptionsEvent,
    TResult? Function(String val)? setEvOptionsEvent,
    TResult? Function(String val)? setVideoResolutionsEvent,
    TResult? Function(bool onDisposeSessions)? disposeBloc,
    TResult? Function(bool withCable)? startStreaming,
    TResult? Function()? socketConnectEvent,
    TResult? Function()? startFrameProcessing,
    TResult? Function()? detectCircleProcessingEvent,
    TResult? Function()? stopCircleDetection,
  }) {
    return startFrameProcessing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streamMode, int distance, bool withCable)? started,
    TResult Function(String val, bool isReset)? setFovOptionsEvent,
    TResult Function(String val)? setLightFreqEvent,
    TResult Function(String val)? setIsoOptionsEvent,
    TResult Function(String val)? setEvOptionsEvent,
    TResult Function(String val)? setVideoResolutionsEvent,
    TResult Function(bool onDisposeSessions)? disposeBloc,
    TResult Function(bool withCable)? startStreaming,
    TResult Function()? socketConnectEvent,
    TResult Function()? startFrameProcessing,
    TResult Function()? detectCircleProcessingEvent,
    TResult Function()? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (startFrameProcessing != null) {
      return startFrameProcessing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SetFovOptionsEvent value) setFovOptionsEvent,
    required TResult Function(_SetLightFreqEvent value) setLightFreqEvent,
    required TResult Function(_SetIsoOptionsEvent value) setIsoOptionsEvent,
    required TResult Function(_SetEvOptionsEvent value) setEvOptionsEvent,
    required TResult Function(_SetVideoResolutionsEvent value)
    setVideoResolutionsEvent,
    required TResult Function(_DisposeBloc value) disposeBloc,
    required TResult Function(_StartStreaming value) startStreaming,
    required TResult Function(_SocketConnectEvent value) socketConnectEvent,
    required TResult Function(_StartFrameProcessing value) startFrameProcessing,
    required TResult Function(_DetectCircleProcessingEvent value)
    detectCircleProcessingEvent,
    required TResult Function(_StopCircleDetection value) stopCircleDetection,
  }) {
    return startFrameProcessing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult? Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult? Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult? Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult? Function(_SetVideoResolutionsEvent value)?
    setVideoResolutionsEvent,
    TResult? Function(_DisposeBloc value)? disposeBloc,
    TResult? Function(_StartStreaming value)? startStreaming,
    TResult? Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult? Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult? Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult? Function(_StopCircleDetection value)? stopCircleDetection,
  }) {
    return startFrameProcessing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult Function(_SetVideoResolutionsEvent value)? setVideoResolutionsEvent,
    TResult Function(_DisposeBloc value)? disposeBloc,
    TResult Function(_StartStreaming value)? startStreaming,
    TResult Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult Function(_StopCircleDetection value)? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (startFrameProcessing != null) {
      return startFrameProcessing(this);
    }
    return orElse();
  }
}

abstract class _StartFrameProcessing implements RtspStreamingEvent {
  const factory _StartFrameProcessing() = _$StartFrameProcessingImpl;
}

/// @nodoc
abstract class _$$DetectCircleProcessingEventImplCopyWith<$Res> {
  factory _$$DetectCircleProcessingEventImplCopyWith(
    _$DetectCircleProcessingEventImpl value,
    $Res Function(_$DetectCircleProcessingEventImpl) then,
  ) = __$$DetectCircleProcessingEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DetectCircleProcessingEventImplCopyWithImpl<$Res>
    extends
        _$RtspStreamingEventCopyWithImpl<
          $Res,
          _$DetectCircleProcessingEventImpl
        >
    implements _$$DetectCircleProcessingEventImplCopyWith<$Res> {
  __$$DetectCircleProcessingEventImplCopyWithImpl(
    _$DetectCircleProcessingEventImpl _value,
    $Res Function(_$DetectCircleProcessingEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DetectCircleProcessingEventImpl
    implements _DetectCircleProcessingEvent {
  const _$DetectCircleProcessingEventImpl();

  @override
  String toString() {
    return 'RtspStreamingEvent.detectCircleProcessingEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectCircleProcessingEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streamMode, int distance, bool withCable)
    started,
    required TResult Function(String val, bool isReset) setFovOptionsEvent,
    required TResult Function(String val) setLightFreqEvent,
    required TResult Function(String val) setIsoOptionsEvent,
    required TResult Function(String val) setEvOptionsEvent,
    required TResult Function(String val) setVideoResolutionsEvent,
    required TResult Function(bool onDisposeSessions) disposeBloc,
    required TResult Function(bool withCable) startStreaming,
    required TResult Function() socketConnectEvent,
    required TResult Function() startFrameProcessing,
    required TResult Function() detectCircleProcessingEvent,
    required TResult Function() stopCircleDetection,
  }) {
    return detectCircleProcessingEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streamMode, int distance, bool withCable)? started,
    TResult? Function(String val, bool isReset)? setFovOptionsEvent,
    TResult? Function(String val)? setLightFreqEvent,
    TResult? Function(String val)? setIsoOptionsEvent,
    TResult? Function(String val)? setEvOptionsEvent,
    TResult? Function(String val)? setVideoResolutionsEvent,
    TResult? Function(bool onDisposeSessions)? disposeBloc,
    TResult? Function(bool withCable)? startStreaming,
    TResult? Function()? socketConnectEvent,
    TResult? Function()? startFrameProcessing,
    TResult? Function()? detectCircleProcessingEvent,
    TResult? Function()? stopCircleDetection,
  }) {
    return detectCircleProcessingEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streamMode, int distance, bool withCable)? started,
    TResult Function(String val, bool isReset)? setFovOptionsEvent,
    TResult Function(String val)? setLightFreqEvent,
    TResult Function(String val)? setIsoOptionsEvent,
    TResult Function(String val)? setEvOptionsEvent,
    TResult Function(String val)? setVideoResolutionsEvent,
    TResult Function(bool onDisposeSessions)? disposeBloc,
    TResult Function(bool withCable)? startStreaming,
    TResult Function()? socketConnectEvent,
    TResult Function()? startFrameProcessing,
    TResult Function()? detectCircleProcessingEvent,
    TResult Function()? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (detectCircleProcessingEvent != null) {
      return detectCircleProcessingEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SetFovOptionsEvent value) setFovOptionsEvent,
    required TResult Function(_SetLightFreqEvent value) setLightFreqEvent,
    required TResult Function(_SetIsoOptionsEvent value) setIsoOptionsEvent,
    required TResult Function(_SetEvOptionsEvent value) setEvOptionsEvent,
    required TResult Function(_SetVideoResolutionsEvent value)
    setVideoResolutionsEvent,
    required TResult Function(_DisposeBloc value) disposeBloc,
    required TResult Function(_StartStreaming value) startStreaming,
    required TResult Function(_SocketConnectEvent value) socketConnectEvent,
    required TResult Function(_StartFrameProcessing value) startFrameProcessing,
    required TResult Function(_DetectCircleProcessingEvent value)
    detectCircleProcessingEvent,
    required TResult Function(_StopCircleDetection value) stopCircleDetection,
  }) {
    return detectCircleProcessingEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult? Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult? Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult? Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult? Function(_SetVideoResolutionsEvent value)?
    setVideoResolutionsEvent,
    TResult? Function(_DisposeBloc value)? disposeBloc,
    TResult? Function(_StartStreaming value)? startStreaming,
    TResult? Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult? Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult? Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult? Function(_StopCircleDetection value)? stopCircleDetection,
  }) {
    return detectCircleProcessingEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult Function(_SetVideoResolutionsEvent value)? setVideoResolutionsEvent,
    TResult Function(_DisposeBloc value)? disposeBloc,
    TResult Function(_StartStreaming value)? startStreaming,
    TResult Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult Function(_StopCircleDetection value)? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (detectCircleProcessingEvent != null) {
      return detectCircleProcessingEvent(this);
    }
    return orElse();
  }
}

abstract class _DetectCircleProcessingEvent implements RtspStreamingEvent {
  const factory _DetectCircleProcessingEvent() =
      _$DetectCircleProcessingEventImpl;
}

/// @nodoc
abstract class _$$StopCircleDetectionImplCopyWith<$Res> {
  factory _$$StopCircleDetectionImplCopyWith(
    _$StopCircleDetectionImpl value,
    $Res Function(_$StopCircleDetectionImpl) then,
  ) = __$$StopCircleDetectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopCircleDetectionImplCopyWithImpl<$Res>
    extends _$RtspStreamingEventCopyWithImpl<$Res, _$StopCircleDetectionImpl>
    implements _$$StopCircleDetectionImplCopyWith<$Res> {
  __$$StopCircleDetectionImplCopyWithImpl(
    _$StopCircleDetectionImpl _value,
    $Res Function(_$StopCircleDetectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RtspStreamingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StopCircleDetectionImpl implements _StopCircleDetection {
  const _$StopCircleDetectionImpl();

  @override
  String toString() {
    return 'RtspStreamingEvent.stopCircleDetection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopCircleDetectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streamMode, int distance, bool withCable)
    started,
    required TResult Function(String val, bool isReset) setFovOptionsEvent,
    required TResult Function(String val) setLightFreqEvent,
    required TResult Function(String val) setIsoOptionsEvent,
    required TResult Function(String val) setEvOptionsEvent,
    required TResult Function(String val) setVideoResolutionsEvent,
    required TResult Function(bool onDisposeSessions) disposeBloc,
    required TResult Function(bool withCable) startStreaming,
    required TResult Function() socketConnectEvent,
    required TResult Function() startFrameProcessing,
    required TResult Function() detectCircleProcessingEvent,
    required TResult Function() stopCircleDetection,
  }) {
    return stopCircleDetection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streamMode, int distance, bool withCable)? started,
    TResult? Function(String val, bool isReset)? setFovOptionsEvent,
    TResult? Function(String val)? setLightFreqEvent,
    TResult? Function(String val)? setIsoOptionsEvent,
    TResult? Function(String val)? setEvOptionsEvent,
    TResult? Function(String val)? setVideoResolutionsEvent,
    TResult? Function(bool onDisposeSessions)? disposeBloc,
    TResult? Function(bool withCable)? startStreaming,
    TResult? Function()? socketConnectEvent,
    TResult? Function()? startFrameProcessing,
    TResult? Function()? detectCircleProcessingEvent,
    TResult? Function()? stopCircleDetection,
  }) {
    return stopCircleDetection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streamMode, int distance, bool withCable)? started,
    TResult Function(String val, bool isReset)? setFovOptionsEvent,
    TResult Function(String val)? setLightFreqEvent,
    TResult Function(String val)? setIsoOptionsEvent,
    TResult Function(String val)? setEvOptionsEvent,
    TResult Function(String val)? setVideoResolutionsEvent,
    TResult Function(bool onDisposeSessions)? disposeBloc,
    TResult Function(bool withCable)? startStreaming,
    TResult Function()? socketConnectEvent,
    TResult Function()? startFrameProcessing,
    TResult Function()? detectCircleProcessingEvent,
    TResult Function()? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (stopCircleDetection != null) {
      return stopCircleDetection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SetFovOptionsEvent value) setFovOptionsEvent,
    required TResult Function(_SetLightFreqEvent value) setLightFreqEvent,
    required TResult Function(_SetIsoOptionsEvent value) setIsoOptionsEvent,
    required TResult Function(_SetEvOptionsEvent value) setEvOptionsEvent,
    required TResult Function(_SetVideoResolutionsEvent value)
    setVideoResolutionsEvent,
    required TResult Function(_DisposeBloc value) disposeBloc,
    required TResult Function(_StartStreaming value) startStreaming,
    required TResult Function(_SocketConnectEvent value) socketConnectEvent,
    required TResult Function(_StartFrameProcessing value) startFrameProcessing,
    required TResult Function(_DetectCircleProcessingEvent value)
    detectCircleProcessingEvent,
    required TResult Function(_StopCircleDetection value) stopCircleDetection,
  }) {
    return stopCircleDetection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult? Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult? Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult? Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult? Function(_SetVideoResolutionsEvent value)?
    setVideoResolutionsEvent,
    TResult? Function(_DisposeBloc value)? disposeBloc,
    TResult? Function(_StartStreaming value)? startStreaming,
    TResult? Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult? Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult? Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult? Function(_StopCircleDetection value)? stopCircleDetection,
  }) {
    return stopCircleDetection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetFovOptionsEvent value)? setFovOptionsEvent,
    TResult Function(_SetLightFreqEvent value)? setLightFreqEvent,
    TResult Function(_SetIsoOptionsEvent value)? setIsoOptionsEvent,
    TResult Function(_SetEvOptionsEvent value)? setEvOptionsEvent,
    TResult Function(_SetVideoResolutionsEvent value)? setVideoResolutionsEvent,
    TResult Function(_DisposeBloc value)? disposeBloc,
    TResult Function(_StartStreaming value)? startStreaming,
    TResult Function(_SocketConnectEvent value)? socketConnectEvent,
    TResult Function(_StartFrameProcessing value)? startFrameProcessing,
    TResult Function(_DetectCircleProcessingEvent value)?
    detectCircleProcessingEvent,
    TResult Function(_StopCircleDetection value)? stopCircleDetection,
    required TResult orElse(),
  }) {
    if (stopCircleDetection != null) {
      return stopCircleDetection(this);
    }
    return orElse();
  }
}

abstract class _StopCircleDetection implements RtspStreamingEvent {
  const factory _StopCircleDetection() = _$StopCircleDetectionImpl;
}

/// @nodoc
mixin _$RtspStreamingState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFovLoading => throw _privateConstructorUsedError;
  bool get isPauseStream => throw _privateConstructorUsedError;
  bool get isStreamDisposed => throw _privateConstructorUsedError;
  bool get onDisposeSessions => throw _privateConstructorUsedError;
  bool get isSimpleStream => throw _privateConstructorUsedError;
  bool get isReSetting => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  String get streamState => throw _privateConstructorUsedError;
  String get startText => throw _privateConstructorUsedError;
  String get batteryP => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool isLoading,
      bool isFovLoading,
      bool isPauseStream,
      bool isStreamDisposed,
      bool onDisposeSessions,
      bool isSimpleStream,
      bool isReSetting,
      String error,
      String streamState,
      String startText,
      String batteryP,
    )
    initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      bool isLoading,
      bool isFovLoading,
      bool isPauseStream,
      bool isStreamDisposed,
      bool onDisposeSessions,
      bool isSimpleStream,
      bool isReSetting,
      String error,
      String streamState,
      String startText,
      String batteryP,
    )?
    initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      bool isLoading,
      bool isFovLoading,
      bool isPauseStream,
      bool isStreamDisposed,
      bool onDisposeSessions,
      bool isSimpleStream,
      bool isReSetting,
      String error,
      String streamState,
      String startText,
      String batteryP,
    )?
    initial,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of RtspStreamingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RtspStreamingStateCopyWith<RtspStreamingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RtspStreamingStateCopyWith<$Res> {
  factory $RtspStreamingStateCopyWith(
    RtspStreamingState value,
    $Res Function(RtspStreamingState) then,
  ) = _$RtspStreamingStateCopyWithImpl<$Res, RtspStreamingState>;
  @useResult
  $Res call({
    bool isLoading,
    bool isFovLoading,
    bool isPauseStream,
    bool isStreamDisposed,
    bool onDisposeSessions,
    bool isSimpleStream,
    bool isReSetting,
    String error,
    String streamState,
    String startText,
    String batteryP,
  });
}

/// @nodoc
class _$RtspStreamingStateCopyWithImpl<$Res, $Val extends RtspStreamingState>
    implements $RtspStreamingStateCopyWith<$Res> {
  _$RtspStreamingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RtspStreamingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFovLoading = null,
    Object? isPauseStream = null,
    Object? isStreamDisposed = null,
    Object? onDisposeSessions = null,
    Object? isSimpleStream = null,
    Object? isReSetting = null,
    Object? error = null,
    Object? streamState = null,
    Object? startText = null,
    Object? batteryP = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            isFovLoading:
                null == isFovLoading
                    ? _value.isFovLoading
                    : isFovLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            isPauseStream:
                null == isPauseStream
                    ? _value.isPauseStream
                    : isPauseStream // ignore: cast_nullable_to_non_nullable
                        as bool,
            isStreamDisposed:
                null == isStreamDisposed
                    ? _value.isStreamDisposed
                    : isStreamDisposed // ignore: cast_nullable_to_non_nullable
                        as bool,
            onDisposeSessions:
                null == onDisposeSessions
                    ? _value.onDisposeSessions
                    : onDisposeSessions // ignore: cast_nullable_to_non_nullable
                        as bool,
            isSimpleStream:
                null == isSimpleStream
                    ? _value.isSimpleStream
                    : isSimpleStream // ignore: cast_nullable_to_non_nullable
                        as bool,
            isReSetting:
                null == isReSetting
                    ? _value.isReSetting
                    : isReSetting // ignore: cast_nullable_to_non_nullable
                        as bool,
            error:
                null == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String,
            streamState:
                null == streamState
                    ? _value.streamState
                    : streamState // ignore: cast_nullable_to_non_nullable
                        as String,
            startText:
                null == startText
                    ? _value.startText
                    : startText // ignore: cast_nullable_to_non_nullable
                        as String,
            batteryP:
                null == batteryP
                    ? _value.batteryP
                    : batteryP // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $RtspStreamingStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool isFovLoading,
    bool isPauseStream,
    bool isStreamDisposed,
    bool onDisposeSessions,
    bool isSimpleStream,
    bool isReSetting,
    String error,
    String streamState,
    String startText,
    String batteryP,
  });
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RtspStreamingStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RtspStreamingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFovLoading = null,
    Object? isPauseStream = null,
    Object? isStreamDisposed = null,
    Object? onDisposeSessions = null,
    Object? isSimpleStream = null,
    Object? isReSetting = null,
    Object? error = null,
    Object? streamState = null,
    Object? startText = null,
    Object? batteryP = null,
  }) {
    return _then(
      _$InitialImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        isFovLoading:
            null == isFovLoading
                ? _value.isFovLoading
                : isFovLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        isPauseStream:
            null == isPauseStream
                ? _value.isPauseStream
                : isPauseStream // ignore: cast_nullable_to_non_nullable
                    as bool,
        isStreamDisposed:
            null == isStreamDisposed
                ? _value.isStreamDisposed
                : isStreamDisposed // ignore: cast_nullable_to_non_nullable
                    as bool,
        onDisposeSessions:
            null == onDisposeSessions
                ? _value.onDisposeSessions
                : onDisposeSessions // ignore: cast_nullable_to_non_nullable
                    as bool,
        isSimpleStream:
            null == isSimpleStream
                ? _value.isSimpleStream
                : isSimpleStream // ignore: cast_nullable_to_non_nullable
                    as bool,
        isReSetting:
            null == isReSetting
                ? _value.isReSetting
                : isReSetting // ignore: cast_nullable_to_non_nullable
                    as bool,
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String,
        streamState:
            null == streamState
                ? _value.streamState
                : streamState // ignore: cast_nullable_to_non_nullable
                    as String,
        startText:
            null == startText
                ? _value.startText
                : startText // ignore: cast_nullable_to_non_nullable
                    as String,
        batteryP:
            null == batteryP
                ? _value.batteryP
                : batteryP // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({
    this.isLoading = false,
    this.isFovLoading = false,
    this.isPauseStream = false,
    this.isStreamDisposed = false,
    this.onDisposeSessions = false,
    this.isSimpleStream = false,
    this.isReSetting = false,
    this.error = '',
    this.streamState = 'none',
    this.startText = 'Open stream',
    this.batteryP = '',
  });

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isFovLoading;
  @override
  @JsonKey()
  final bool isPauseStream;
  @override
  @JsonKey()
  final bool isStreamDisposed;
  @override
  @JsonKey()
  final bool onDisposeSessions;
  @override
  @JsonKey()
  final bool isSimpleStream;
  @override
  @JsonKey()
  final bool isReSetting;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final String streamState;
  @override
  @JsonKey()
  final String startText;
  @override
  @JsonKey()
  final String batteryP;

  @override
  String toString() {
    return 'RtspStreamingState.initial(isLoading: $isLoading, isFovLoading: $isFovLoading, isPauseStream: $isPauseStream, isStreamDisposed: $isStreamDisposed, onDisposeSessions: $onDisposeSessions, isSimpleStream: $isSimpleStream, isReSetting: $isReSetting, error: $error, streamState: $streamState, startText: $startText, batteryP: $batteryP)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFovLoading, isFovLoading) ||
                other.isFovLoading == isFovLoading) &&
            (identical(other.isPauseStream, isPauseStream) ||
                other.isPauseStream == isPauseStream) &&
            (identical(other.isStreamDisposed, isStreamDisposed) ||
                other.isStreamDisposed == isStreamDisposed) &&
            (identical(other.onDisposeSessions, onDisposeSessions) ||
                other.onDisposeSessions == onDisposeSessions) &&
            (identical(other.isSimpleStream, isSimpleStream) ||
                other.isSimpleStream == isSimpleStream) &&
            (identical(other.isReSetting, isReSetting) ||
                other.isReSetting == isReSetting) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.streamState, streamState) ||
                other.streamState == streamState) &&
            (identical(other.startText, startText) ||
                other.startText == startText) &&
            (identical(other.batteryP, batteryP) ||
                other.batteryP == batteryP));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isFovLoading,
    isPauseStream,
    isStreamDisposed,
    onDisposeSessions,
    isSimpleStream,
    isReSetting,
    error,
    streamState,
    startText,
    batteryP,
  );

  /// Create a copy of RtspStreamingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool isLoading,
      bool isFovLoading,
      bool isPauseStream,
      bool isStreamDisposed,
      bool onDisposeSessions,
      bool isSimpleStream,
      bool isReSetting,
      String error,
      String streamState,
      String startText,
      String batteryP,
    )
    initial,
  }) {
    return initial(
      isLoading,
      isFovLoading,
      isPauseStream,
      isStreamDisposed,
      onDisposeSessions,
      isSimpleStream,
      isReSetting,
      error,
      streamState,
      startText,
      batteryP,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      bool isLoading,
      bool isFovLoading,
      bool isPauseStream,
      bool isStreamDisposed,
      bool onDisposeSessions,
      bool isSimpleStream,
      bool isReSetting,
      String error,
      String streamState,
      String startText,
      String batteryP,
    )?
    initial,
  }) {
    return initial?.call(
      isLoading,
      isFovLoading,
      isPauseStream,
      isStreamDisposed,
      onDisposeSessions,
      isSimpleStream,
      isReSetting,
      error,
      streamState,
      startText,
      batteryP,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      bool isLoading,
      bool isFovLoading,
      bool isPauseStream,
      bool isStreamDisposed,
      bool onDisposeSessions,
      bool isSimpleStream,
      bool isReSetting,
      String error,
      String streamState,
      String startText,
      String batteryP,
    )?
    initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
        isLoading,
        isFovLoading,
        isPauseStream,
        isStreamDisposed,
        onDisposeSessions,
        isSimpleStream,
        isReSetting,
        error,
        streamState,
        startText,
        batteryP,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RtspStreamingState {
  const factory _Initial({
    final bool isLoading,
    final bool isFovLoading,
    final bool isPauseStream,
    final bool isStreamDisposed,
    final bool onDisposeSessions,
    final bool isSimpleStream,
    final bool isReSetting,
    final String error,
    final String streamState,
    final String startText,
    final String batteryP,
  }) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get isFovLoading;
  @override
  bool get isPauseStream;
  @override
  bool get isStreamDisposed;
  @override
  bool get onDisposeSessions;
  @override
  bool get isSimpleStream;
  @override
  bool get isReSetting;
  @override
  String get error;
  @override
  String get streamState;
  @override
  String get startText;
  @override
  String get batteryP;

  /// Create a copy of RtspStreamingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
