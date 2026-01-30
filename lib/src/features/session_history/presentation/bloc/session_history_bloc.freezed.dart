// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SessionHistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllSessions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllSessions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllSessions,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllSessions value) getAllSessions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllSessions value)? getAllSessions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllSessions value)? getAllSessions,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionHistoryEventCopyWith<$Res> {
  factory $SessionHistoryEventCopyWith(
    SessionHistoryEvent value,
    $Res Function(SessionHistoryEvent) then,
  ) = _$SessionHistoryEventCopyWithImpl<$Res, SessionHistoryEvent>;
}

/// @nodoc
class _$SessionHistoryEventCopyWithImpl<$Res, $Val extends SessionHistoryEvent>
    implements $SessionHistoryEventCopyWith<$Res> {
  _$SessionHistoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetAllSessionsImplCopyWith<$Res> {
  factory _$$GetAllSessionsImplCopyWith(
    _$GetAllSessionsImpl value,
    $Res Function(_$GetAllSessionsImpl) then,
  ) = __$$GetAllSessionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllSessionsImplCopyWithImpl<$Res>
    extends _$SessionHistoryEventCopyWithImpl<$Res, _$GetAllSessionsImpl>
    implements _$$GetAllSessionsImplCopyWith<$Res> {
  __$$GetAllSessionsImplCopyWithImpl(
    _$GetAllSessionsImpl _value,
    $Res Function(_$GetAllSessionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SessionHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetAllSessionsImpl implements _GetAllSessions {
  const _$GetAllSessionsImpl();

  @override
  String toString() {
    return 'SessionHistoryEvent.getAllSessions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllSessionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllSessions,
  }) {
    return getAllSessions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllSessions,
  }) {
    return getAllSessions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllSessions,
    required TResult orElse(),
  }) {
    if (getAllSessions != null) {
      return getAllSessions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllSessions value) getAllSessions,
  }) {
    return getAllSessions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllSessions value)? getAllSessions,
  }) {
    return getAllSessions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllSessions value)? getAllSessions,
    required TResult orElse(),
  }) {
    if (getAllSessions != null) {
      return getAllSessions(this);
    }
    return orElse();
  }
}

abstract class _GetAllSessions implements SessionHistoryEvent {
  const factory _GetAllSessions() = _$GetAllSessionsImpl;
}

/// @nodoc
mixin _$SessionHistoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<SaveSessionModel> get session => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, List<SaveSessionModel> session)
    initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, List<SaveSessionModel> session)? initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, List<SaveSessionModel> session)? initial,
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

  /// Create a copy of SessionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionHistoryStateCopyWith<SessionHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionHistoryStateCopyWith<$Res> {
  factory $SessionHistoryStateCopyWith(
    SessionHistoryState value,
    $Res Function(SessionHistoryState) then,
  ) = _$SessionHistoryStateCopyWithImpl<$Res, SessionHistoryState>;
  @useResult
  $Res call({bool isLoading, List<SaveSessionModel> session});
}

/// @nodoc
class _$SessionHistoryStateCopyWithImpl<$Res, $Val extends SessionHistoryState>
    implements $SessionHistoryStateCopyWith<$Res> {
  _$SessionHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isLoading = null, Object? session = null}) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            session:
                null == session
                    ? _value.session
                    : session // ignore: cast_nullable_to_non_nullable
                        as List<SaveSessionModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $SessionHistoryStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<SaveSessionModel> session});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SessionHistoryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SessionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isLoading = null, Object? session = null}) {
    return _then(
      _$InitialImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        session:
            null == session
                ? _value._session
                : session // ignore: cast_nullable_to_non_nullable
                    as List<SaveSessionModel>,
      ),
    );
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({
    this.isLoading = false,
    final List<SaveSessionModel> session = const [],
  }) : _session = session;

  @override
  @JsonKey()
  final bool isLoading;
  final List<SaveSessionModel> _session;
  @override
  @JsonKey()
  List<SaveSessionModel> get session {
    if (_session is EqualUnmodifiableListView) return _session;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_session);
  }

  @override
  String toString() {
    return 'SessionHistoryState.initial(isLoading: $isLoading, session: $session)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._session, _session));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    const DeepCollectionEquality().hash(_session),
  );

  /// Create a copy of SessionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, List<SaveSessionModel> session)
    initial,
  }) {
    return initial(isLoading, session);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, List<SaveSessionModel> session)? initial,
  }) {
    return initial?.call(isLoading, session);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, List<SaveSessionModel> session)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoading, session);
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

abstract class _Initial implements SessionHistoryState {
  const factory _Initial({
    final bool isLoading,
    final List<SaveSessionModel> session,
  }) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  List<SaveSessionModel> get session;

  /// Create a copy of SessionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
