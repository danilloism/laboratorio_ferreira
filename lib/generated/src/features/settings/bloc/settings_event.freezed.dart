// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../src/features/settings/bloc/settings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode mode) themeModeChanged,
    required TResult Function(Session? session) sessionChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ThemeMode mode)? themeModeChanged,
    TResult Function(Session? session)? sessionChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode mode)? themeModeChanged,
    TResult Function(Session? session)? sessionChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeModeChanged value) themeModeChanged,
    required TResult Function(_SessionChanged value) sessionChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ThemeModeChanged value)? themeModeChanged,
    TResult Function(_SessionChanged value)? sessionChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeModeChanged value)? themeModeChanged,
    TResult Function(_SessionChanged value)? sessionChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  final SettingsEvent _value;
  // ignore: unused_field
  final $Res Function(SettingsEvent) _then;
}

/// @nodoc
abstract class _$$_ThemeModeChangedCopyWith<$Res> {
  factory _$$_ThemeModeChangedCopyWith(
          _$_ThemeModeChanged value, $Res Function(_$_ThemeModeChanged) then) =
      __$$_ThemeModeChangedCopyWithImpl<$Res>;
  $Res call({ThemeMode mode});
}

/// @nodoc
class __$$_ThemeModeChangedCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$$_ThemeModeChangedCopyWith<$Res> {
  __$$_ThemeModeChangedCopyWithImpl(
      _$_ThemeModeChanged _value, $Res Function(_$_ThemeModeChanged) _then)
      : super(_value, (v) => _then(v as _$_ThemeModeChanged));

  @override
  _$_ThemeModeChanged get _value => super._value as _$_ThemeModeChanged;

  @override
  $Res call({
    Object? mode = freezed,
  }) {
    return _then(_$_ThemeModeChanged(
      mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$_ThemeModeChanged extends _ThemeModeChanged {
  const _$_ThemeModeChanged(this.mode) : super._();

  @override
  final ThemeMode mode;

  @override
  String toString() {
    return 'SettingsEvent.themeModeChanged(mode: $mode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThemeModeChanged &&
            const DeepCollectionEquality().equals(other.mode, mode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(mode));

  @JsonKey(ignore: true)
  @override
  _$$_ThemeModeChangedCopyWith<_$_ThemeModeChanged> get copyWith =>
      __$$_ThemeModeChangedCopyWithImpl<_$_ThemeModeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode mode) themeModeChanged,
    required TResult Function(Session? session) sessionChanged,
  }) {
    return themeModeChanged(mode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ThemeMode mode)? themeModeChanged,
    TResult Function(Session? session)? sessionChanged,
  }) {
    return themeModeChanged?.call(mode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode mode)? themeModeChanged,
    TResult Function(Session? session)? sessionChanged,
    required TResult orElse(),
  }) {
    if (themeModeChanged != null) {
      return themeModeChanged(mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeModeChanged value) themeModeChanged,
    required TResult Function(_SessionChanged value) sessionChanged,
  }) {
    return themeModeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ThemeModeChanged value)? themeModeChanged,
    TResult Function(_SessionChanged value)? sessionChanged,
  }) {
    return themeModeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeModeChanged value)? themeModeChanged,
    TResult Function(_SessionChanged value)? sessionChanged,
    required TResult orElse(),
  }) {
    if (themeModeChanged != null) {
      return themeModeChanged(this);
    }
    return orElse();
  }
}

abstract class _ThemeModeChanged extends SettingsEvent {
  const factory _ThemeModeChanged(final ThemeMode mode) = _$_ThemeModeChanged;
  const _ThemeModeChanged._() : super._();

  ThemeMode get mode;
  @JsonKey(ignore: true)
  _$$_ThemeModeChangedCopyWith<_$_ThemeModeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SessionChangedCopyWith<$Res> {
  factory _$$_SessionChangedCopyWith(
          _$_SessionChanged value, $Res Function(_$_SessionChanged) then) =
      __$$_SessionChangedCopyWithImpl<$Res>;
  $Res call({Session? session});
}

/// @nodoc
class __$$_SessionChangedCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$$_SessionChangedCopyWith<$Res> {
  __$$_SessionChangedCopyWithImpl(
      _$_SessionChanged _value, $Res Function(_$_SessionChanged) _then)
      : super(_value, (v) => _then(v as _$_SessionChanged));

  @override
  _$_SessionChanged get _value => super._value as _$_SessionChanged;

  @override
  $Res call({
    Object? session = freezed,
  }) {
    return _then(_$_SessionChanged(
      session == freezed
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session?,
    ));
  }
}

/// @nodoc

class _$_SessionChanged extends _SessionChanged {
  const _$_SessionChanged([this.session]) : super._();

  @override
  final Session? session;

  @override
  String toString() {
    return 'SettingsEvent.sessionChanged(session: $session)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SessionChanged &&
            const DeepCollectionEquality().equals(other.session, session));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(session));

  @JsonKey(ignore: true)
  @override
  _$$_SessionChangedCopyWith<_$_SessionChanged> get copyWith =>
      __$$_SessionChangedCopyWithImpl<_$_SessionChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode mode) themeModeChanged,
    required TResult Function(Session? session) sessionChanged,
  }) {
    return sessionChanged(session);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ThemeMode mode)? themeModeChanged,
    TResult Function(Session? session)? sessionChanged,
  }) {
    return sessionChanged?.call(session);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode mode)? themeModeChanged,
    TResult Function(Session? session)? sessionChanged,
    required TResult orElse(),
  }) {
    if (sessionChanged != null) {
      return sessionChanged(session);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeModeChanged value) themeModeChanged,
    required TResult Function(_SessionChanged value) sessionChanged,
  }) {
    return sessionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ThemeModeChanged value)? themeModeChanged,
    TResult Function(_SessionChanged value)? sessionChanged,
  }) {
    return sessionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeModeChanged value)? themeModeChanged,
    TResult Function(_SessionChanged value)? sessionChanged,
    required TResult orElse(),
  }) {
    if (sessionChanged != null) {
      return sessionChanged(this);
    }
    return orElse();
  }
}

abstract class _SessionChanged extends SettingsEvent {
  const factory _SessionChanged([final Session? session]) = _$_SessionChanged;
  const _SessionChanged._() : super._();

  Session? get session;
  @JsonKey(ignore: true)
  _$$_SessionChangedCopyWith<_$_SessionChanged> get copyWith =>
      throw _privateConstructorUsedError;
}
