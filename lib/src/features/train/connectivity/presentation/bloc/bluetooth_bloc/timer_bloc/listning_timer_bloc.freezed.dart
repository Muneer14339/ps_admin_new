// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listning_timer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ListningTimerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTimer,
    required TResult Function() stopTimer,
    required TResult Function() updateTimer,
    required TResult Function(bool isMissingShot) onShotDetectedEvent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTimer,
    TResult? Function()? stopTimer,
    TResult? Function()? updateTimer,
    TResult? Function(bool isMissingShot)? onShotDetectedEvent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTimer,
    TResult Function()? stopTimer,
    TResult Function()? updateTimer,
    TResult Function(bool isMissingShot)? onShotDetectedEvent,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartTimerEvent value) startTimer,
    required TResult Function(StopTimerEvent value) stopTimer,
    required TResult Function(UpdateTimerEvent value) updateTimer,
    required TResult Function(OnShotDetectedEvent value) onShotDetectedEvent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartTimerEvent value)? startTimer,
    TResult? Function(StopTimerEvent value)? stopTimer,
    TResult? Function(UpdateTimerEvent value)? updateTimer,
    TResult? Function(OnShotDetectedEvent value)? onShotDetectedEvent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartTimerEvent value)? startTimer,
    TResult Function(StopTimerEvent value)? stopTimer,
    TResult Function(UpdateTimerEvent value)? updateTimer,
    TResult Function(OnShotDetectedEvent value)? onShotDetectedEvent,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListningTimerEventCopyWith<$Res> {
  factory $ListningTimerEventCopyWith(
    ListningTimerEvent value,
    $Res Function(ListningTimerEvent) then,
  ) = _$ListningTimerEventCopyWithImpl<$Res, ListningTimerEvent>;
}

/// @nodoc
class _$ListningTimerEventCopyWithImpl<$Res, $Val extends ListningTimerEvent>
    implements $ListningTimerEventCopyWith<$Res> {
  _$ListningTimerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListningTimerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartTimerEventImplCopyWith<$Res> {
  factory _$$StartTimerEventImplCopyWith(
    _$StartTimerEventImpl value,
    $Res Function(_$StartTimerEventImpl) then,
  ) = __$$StartTimerEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartTimerEventImplCopyWithImpl<$Res>
    extends _$ListningTimerEventCopyWithImpl<$Res, _$StartTimerEventImpl>
    implements _$$StartTimerEventImplCopyWith<$Res> {
  __$$StartTimerEventImplCopyWithImpl(
    _$StartTimerEventImpl _value,
    $Res Function(_$StartTimerEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListningTimerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartTimerEventImpl implements StartTimerEvent {
  const _$StartTimerEventImpl();

  @override
  String toString() {
    return 'ListningTimerEvent.startTimer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartTimerEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTimer,
    required TResult Function() stopTimer,
    required TResult Function() updateTimer,
    required TResult Function(bool isMissingShot) onShotDetectedEvent,
  }) {
    return startTimer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTimer,
    TResult? Function()? stopTimer,
    TResult? Function()? updateTimer,
    TResult? Function(bool isMissingShot)? onShotDetectedEvent,
  }) {
    return startTimer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTimer,
    TResult Function()? stopTimer,
    TResult Function()? updateTimer,
    TResult Function(bool isMissingShot)? onShotDetectedEvent,
    required TResult orElse(),
  }) {
    if (startTimer != null) {
      return startTimer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartTimerEvent value) startTimer,
    required TResult Function(StopTimerEvent value) stopTimer,
    required TResult Function(UpdateTimerEvent value) updateTimer,
    required TResult Function(OnShotDetectedEvent value) onShotDetectedEvent,
  }) {
    return startTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartTimerEvent value)? startTimer,
    TResult? Function(StopTimerEvent value)? stopTimer,
    TResult? Function(UpdateTimerEvent value)? updateTimer,
    TResult? Function(OnShotDetectedEvent value)? onShotDetectedEvent,
  }) {
    return startTimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartTimerEvent value)? startTimer,
    TResult Function(StopTimerEvent value)? stopTimer,
    TResult Function(UpdateTimerEvent value)? updateTimer,
    TResult Function(OnShotDetectedEvent value)? onShotDetectedEvent,
    required TResult orElse(),
  }) {
    if (startTimer != null) {
      return startTimer(this);
    }
    return orElse();
  }
}

abstract class StartTimerEvent implements ListningTimerEvent {
  const factory StartTimerEvent() = _$StartTimerEventImpl;
}

/// @nodoc
abstract class _$$StopTimerEventImplCopyWith<$Res> {
  factory _$$StopTimerEventImplCopyWith(
    _$StopTimerEventImpl value,
    $Res Function(_$StopTimerEventImpl) then,
  ) = __$$StopTimerEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopTimerEventImplCopyWithImpl<$Res>
    extends _$ListningTimerEventCopyWithImpl<$Res, _$StopTimerEventImpl>
    implements _$$StopTimerEventImplCopyWith<$Res> {
  __$$StopTimerEventImplCopyWithImpl(
    _$StopTimerEventImpl _value,
    $Res Function(_$StopTimerEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListningTimerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StopTimerEventImpl implements StopTimerEvent {
  const _$StopTimerEventImpl();

  @override
  String toString() {
    return 'ListningTimerEvent.stopTimer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopTimerEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTimer,
    required TResult Function() stopTimer,
    required TResult Function() updateTimer,
    required TResult Function(bool isMissingShot) onShotDetectedEvent,
  }) {
    return stopTimer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTimer,
    TResult? Function()? stopTimer,
    TResult? Function()? updateTimer,
    TResult? Function(bool isMissingShot)? onShotDetectedEvent,
  }) {
    return stopTimer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTimer,
    TResult Function()? stopTimer,
    TResult Function()? updateTimer,
    TResult Function(bool isMissingShot)? onShotDetectedEvent,
    required TResult orElse(),
  }) {
    if (stopTimer != null) {
      return stopTimer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartTimerEvent value) startTimer,
    required TResult Function(StopTimerEvent value) stopTimer,
    required TResult Function(UpdateTimerEvent value) updateTimer,
    required TResult Function(OnShotDetectedEvent value) onShotDetectedEvent,
  }) {
    return stopTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartTimerEvent value)? startTimer,
    TResult? Function(StopTimerEvent value)? stopTimer,
    TResult? Function(UpdateTimerEvent value)? updateTimer,
    TResult? Function(OnShotDetectedEvent value)? onShotDetectedEvent,
  }) {
    return stopTimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartTimerEvent value)? startTimer,
    TResult Function(StopTimerEvent value)? stopTimer,
    TResult Function(UpdateTimerEvent value)? updateTimer,
    TResult Function(OnShotDetectedEvent value)? onShotDetectedEvent,
    required TResult orElse(),
  }) {
    if (stopTimer != null) {
      return stopTimer(this);
    }
    return orElse();
  }
}

abstract class StopTimerEvent implements ListningTimerEvent {
  const factory StopTimerEvent() = _$StopTimerEventImpl;
}

/// @nodoc
abstract class _$$UpdateTimerEventImplCopyWith<$Res> {
  factory _$$UpdateTimerEventImplCopyWith(
    _$UpdateTimerEventImpl value,
    $Res Function(_$UpdateTimerEventImpl) then,
  ) = __$$UpdateTimerEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateTimerEventImplCopyWithImpl<$Res>
    extends _$ListningTimerEventCopyWithImpl<$Res, _$UpdateTimerEventImpl>
    implements _$$UpdateTimerEventImplCopyWith<$Res> {
  __$$UpdateTimerEventImplCopyWithImpl(
    _$UpdateTimerEventImpl _value,
    $Res Function(_$UpdateTimerEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListningTimerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateTimerEventImpl implements UpdateTimerEvent {
  const _$UpdateTimerEventImpl();

  @override
  String toString() {
    return 'ListningTimerEvent.updateTimer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateTimerEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTimer,
    required TResult Function() stopTimer,
    required TResult Function() updateTimer,
    required TResult Function(bool isMissingShot) onShotDetectedEvent,
  }) {
    return updateTimer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTimer,
    TResult? Function()? stopTimer,
    TResult? Function()? updateTimer,
    TResult? Function(bool isMissingShot)? onShotDetectedEvent,
  }) {
    return updateTimer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTimer,
    TResult Function()? stopTimer,
    TResult Function()? updateTimer,
    TResult Function(bool isMissingShot)? onShotDetectedEvent,
    required TResult orElse(),
  }) {
    if (updateTimer != null) {
      return updateTimer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartTimerEvent value) startTimer,
    required TResult Function(StopTimerEvent value) stopTimer,
    required TResult Function(UpdateTimerEvent value) updateTimer,
    required TResult Function(OnShotDetectedEvent value) onShotDetectedEvent,
  }) {
    return updateTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartTimerEvent value)? startTimer,
    TResult? Function(StopTimerEvent value)? stopTimer,
    TResult? Function(UpdateTimerEvent value)? updateTimer,
    TResult? Function(OnShotDetectedEvent value)? onShotDetectedEvent,
  }) {
    return updateTimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartTimerEvent value)? startTimer,
    TResult Function(StopTimerEvent value)? stopTimer,
    TResult Function(UpdateTimerEvent value)? updateTimer,
    TResult Function(OnShotDetectedEvent value)? onShotDetectedEvent,
    required TResult orElse(),
  }) {
    if (updateTimer != null) {
      return updateTimer(this);
    }
    return orElse();
  }
}

abstract class UpdateTimerEvent implements ListningTimerEvent {
  const factory UpdateTimerEvent() = _$UpdateTimerEventImpl;
}

/// @nodoc
abstract class _$$OnShotDetectedEventImplCopyWith<$Res> {
  factory _$$OnShotDetectedEventImplCopyWith(
    _$OnShotDetectedEventImpl value,
    $Res Function(_$OnShotDetectedEventImpl) then,
  ) = __$$OnShotDetectedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isMissingShot});
}

/// @nodoc
class __$$OnShotDetectedEventImplCopyWithImpl<$Res>
    extends _$ListningTimerEventCopyWithImpl<$Res, _$OnShotDetectedEventImpl>
    implements _$$OnShotDetectedEventImplCopyWith<$Res> {
  __$$OnShotDetectedEventImplCopyWithImpl(
    _$OnShotDetectedEventImpl _value,
    $Res Function(_$OnShotDetectedEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListningTimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isMissingShot = null}) {
    return _then(
      _$OnShotDetectedEventImpl(
        null == isMissingShot
            ? _value.isMissingShot
            : isMissingShot // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$OnShotDetectedEventImpl implements OnShotDetectedEvent {
  const _$OnShotDetectedEventImpl(this.isMissingShot);

  @override
  final bool isMissingShot;

  @override
  String toString() {
    return 'ListningTimerEvent.onShotDetectedEvent(isMissingShot: $isMissingShot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnShotDetectedEventImpl &&
            (identical(other.isMissingShot, isMissingShot) ||
                other.isMissingShot == isMissingShot));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isMissingShot);

  /// Create a copy of ListningTimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnShotDetectedEventImplCopyWith<_$OnShotDetectedEventImpl> get copyWith =>
      __$$OnShotDetectedEventImplCopyWithImpl<_$OnShotDetectedEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTimer,
    required TResult Function() stopTimer,
    required TResult Function() updateTimer,
    required TResult Function(bool isMissingShot) onShotDetectedEvent,
  }) {
    return onShotDetectedEvent(isMissingShot);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTimer,
    TResult? Function()? stopTimer,
    TResult? Function()? updateTimer,
    TResult? Function(bool isMissingShot)? onShotDetectedEvent,
  }) {
    return onShotDetectedEvent?.call(isMissingShot);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTimer,
    TResult Function()? stopTimer,
    TResult Function()? updateTimer,
    TResult Function(bool isMissingShot)? onShotDetectedEvent,
    required TResult orElse(),
  }) {
    if (onShotDetectedEvent != null) {
      return onShotDetectedEvent(isMissingShot);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartTimerEvent value) startTimer,
    required TResult Function(StopTimerEvent value) stopTimer,
    required TResult Function(UpdateTimerEvent value) updateTimer,
    required TResult Function(OnShotDetectedEvent value) onShotDetectedEvent,
  }) {
    return onShotDetectedEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartTimerEvent value)? startTimer,
    TResult? Function(StopTimerEvent value)? stopTimer,
    TResult? Function(UpdateTimerEvent value)? updateTimer,
    TResult? Function(OnShotDetectedEvent value)? onShotDetectedEvent,
  }) {
    return onShotDetectedEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartTimerEvent value)? startTimer,
    TResult Function(StopTimerEvent value)? stopTimer,
    TResult Function(UpdateTimerEvent value)? updateTimer,
    TResult Function(OnShotDetectedEvent value)? onShotDetectedEvent,
    required TResult orElse(),
  }) {
    if (onShotDetectedEvent != null) {
      return onShotDetectedEvent(this);
    }
    return orElse();
  }
}

abstract class OnShotDetectedEvent implements ListningTimerEvent {
  const factory OnShotDetectedEvent(final bool isMissingShot) =
      _$OnShotDetectedEventImpl;

  bool get isMissingShot;

  /// Create a copy of ListningTimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnShotDetectedEventImplCopyWith<_$OnShotDetectedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ListningTimerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isOk) onShotDetected,
    required TResult Function(int secondsLeft) running,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isOk)? onShotDetected,
    TResult? Function(int secondsLeft)? running,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isOk)? onShotDetected,
    TResult Function(int secondsLeft)? running,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerInitial value) initial,
    required TResult Function(OnShotDetected value) onShotDetected,
    required TResult Function(TimerRunning value) running,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerInitial value)? initial,
    TResult? Function(OnShotDetected value)? onShotDetected,
    TResult? Function(TimerRunning value)? running,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerInitial value)? initial,
    TResult Function(OnShotDetected value)? onShotDetected,
    TResult Function(TimerRunning value)? running,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListningTimerStateCopyWith<$Res> {
  factory $ListningTimerStateCopyWith(
    ListningTimerState value,
    $Res Function(ListningTimerState) then,
  ) = _$ListningTimerStateCopyWithImpl<$Res, ListningTimerState>;
}

/// @nodoc
class _$ListningTimerStateCopyWithImpl<$Res, $Val extends ListningTimerState>
    implements $ListningTimerStateCopyWith<$Res> {
  _$ListningTimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListningTimerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TimerInitialImplCopyWith<$Res> {
  factory _$$TimerInitialImplCopyWith(
    _$TimerInitialImpl value,
    $Res Function(_$TimerInitialImpl) then,
  ) = __$$TimerInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerInitialImplCopyWithImpl<$Res>
    extends _$ListningTimerStateCopyWithImpl<$Res, _$TimerInitialImpl>
    implements _$$TimerInitialImplCopyWith<$Res> {
  __$$TimerInitialImplCopyWithImpl(
    _$TimerInitialImpl _value,
    $Res Function(_$TimerInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListningTimerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimerInitialImpl implements TimerInitial {
  const _$TimerInitialImpl();

  @override
  String toString() {
    return 'ListningTimerState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isOk) onShotDetected,
    required TResult Function(int secondsLeft) running,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isOk)? onShotDetected,
    TResult? Function(int secondsLeft)? running,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isOk)? onShotDetected,
    TResult Function(int secondsLeft)? running,
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
    required TResult Function(TimerInitial value) initial,
    required TResult Function(OnShotDetected value) onShotDetected,
    required TResult Function(TimerRunning value) running,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerInitial value)? initial,
    TResult? Function(OnShotDetected value)? onShotDetected,
    TResult? Function(TimerRunning value)? running,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerInitial value)? initial,
    TResult Function(OnShotDetected value)? onShotDetected,
    TResult Function(TimerRunning value)? running,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TimerInitial implements ListningTimerState {
  const factory TimerInitial() = _$TimerInitialImpl;
}

/// @nodoc
abstract class _$$OnShotDetectedImplCopyWith<$Res> {
  factory _$$OnShotDetectedImplCopyWith(
    _$OnShotDetectedImpl value,
    $Res Function(_$OnShotDetectedImpl) then,
  ) = __$$OnShotDetectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isOk});
}

/// @nodoc
class __$$OnShotDetectedImplCopyWithImpl<$Res>
    extends _$ListningTimerStateCopyWithImpl<$Res, _$OnShotDetectedImpl>
    implements _$$OnShotDetectedImplCopyWith<$Res> {
  __$$OnShotDetectedImplCopyWithImpl(
    _$OnShotDetectedImpl _value,
    $Res Function(_$OnShotDetectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListningTimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isOk = null}) {
    return _then(
      _$OnShotDetectedImpl(
        null == isOk
            ? _value.isOk
            : isOk // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$OnShotDetectedImpl implements OnShotDetected {
  const _$OnShotDetectedImpl(this.isOk);

  @override
  final bool isOk;

  @override
  String toString() {
    return 'ListningTimerState.onShotDetected(isOk: $isOk)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnShotDetectedImpl &&
            (identical(other.isOk, isOk) || other.isOk == isOk));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOk);

  /// Create a copy of ListningTimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnShotDetectedImplCopyWith<_$OnShotDetectedImpl> get copyWith =>
      __$$OnShotDetectedImplCopyWithImpl<_$OnShotDetectedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isOk) onShotDetected,
    required TResult Function(int secondsLeft) running,
  }) {
    return onShotDetected(isOk);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isOk)? onShotDetected,
    TResult? Function(int secondsLeft)? running,
  }) {
    return onShotDetected?.call(isOk);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isOk)? onShotDetected,
    TResult Function(int secondsLeft)? running,
    required TResult orElse(),
  }) {
    if (onShotDetected != null) {
      return onShotDetected(isOk);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerInitial value) initial,
    required TResult Function(OnShotDetected value) onShotDetected,
    required TResult Function(TimerRunning value) running,
  }) {
    return onShotDetected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerInitial value)? initial,
    TResult? Function(OnShotDetected value)? onShotDetected,
    TResult? Function(TimerRunning value)? running,
  }) {
    return onShotDetected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerInitial value)? initial,
    TResult Function(OnShotDetected value)? onShotDetected,
    TResult Function(TimerRunning value)? running,
    required TResult orElse(),
  }) {
    if (onShotDetected != null) {
      return onShotDetected(this);
    }
    return orElse();
  }
}

abstract class OnShotDetected implements ListningTimerState {
  const factory OnShotDetected(final bool isOk) = _$OnShotDetectedImpl;

  bool get isOk;

  /// Create a copy of ListningTimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnShotDetectedImplCopyWith<_$OnShotDetectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerRunningImplCopyWith<$Res> {
  factory _$$TimerRunningImplCopyWith(
    _$TimerRunningImpl value,
    $Res Function(_$TimerRunningImpl) then,
  ) = __$$TimerRunningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int secondsLeft});
}

/// @nodoc
class __$$TimerRunningImplCopyWithImpl<$Res>
    extends _$ListningTimerStateCopyWithImpl<$Res, _$TimerRunningImpl>
    implements _$$TimerRunningImplCopyWith<$Res> {
  __$$TimerRunningImplCopyWithImpl(
    _$TimerRunningImpl _value,
    $Res Function(_$TimerRunningImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListningTimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? secondsLeft = null}) {
    return _then(
      _$TimerRunningImpl(
        null == secondsLeft
            ? _value.secondsLeft
            : secondsLeft // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$TimerRunningImpl implements TimerRunning {
  const _$TimerRunningImpl(this.secondsLeft);

  @override
  final int secondsLeft;

  @override
  String toString() {
    return 'ListningTimerState.running(secondsLeft: $secondsLeft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerRunningImpl &&
            (identical(other.secondsLeft, secondsLeft) ||
                other.secondsLeft == secondsLeft));
  }

  @override
  int get hashCode => Object.hash(runtimeType, secondsLeft);

  /// Create a copy of ListningTimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerRunningImplCopyWith<_$TimerRunningImpl> get copyWith =>
      __$$TimerRunningImplCopyWithImpl<_$TimerRunningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isOk) onShotDetected,
    required TResult Function(int secondsLeft) running,
  }) {
    return running(secondsLeft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isOk)? onShotDetected,
    TResult? Function(int secondsLeft)? running,
  }) {
    return running?.call(secondsLeft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isOk)? onShotDetected,
    TResult Function(int secondsLeft)? running,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(secondsLeft);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerInitial value) initial,
    required TResult Function(OnShotDetected value) onShotDetected,
    required TResult Function(TimerRunning value) running,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerInitial value)? initial,
    TResult? Function(OnShotDetected value)? onShotDetected,
    TResult? Function(TimerRunning value)? running,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerInitial value)? initial,
    TResult Function(OnShotDetected value)? onShotDetected,
    TResult Function(TimerRunning value)? running,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class TimerRunning implements ListningTimerState {
  const factory TimerRunning(final int secondsLeft) = _$TimerRunningImpl;

  int get secondsLeft;

  /// Create a copy of ListningTimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerRunningImplCopyWith<_$TimerRunningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
