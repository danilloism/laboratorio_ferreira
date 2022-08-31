// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../src/core/bloc/settings_event.dart';

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
    required TResult Function(Setting setting) activeSettingChanged,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ThemeMode mode)? themeModeChanged,
    TResult Function(Setting setting)? activeSettingChanged,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode mode)? themeModeChanged,
    TResult Function(Setting setting)? activeSettingChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeModeChanged value) themeModeChanged,
    required TResult Function(_ActiveSettingChanged value) activeSettingChanged,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ThemeModeChanged value)? themeModeChanged,
    TResult Function(_ActiveSettingChanged value)? activeSettingChanged,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeModeChanged value)? themeModeChanged,
    TResult Function(_ActiveSettingChanged value)? activeSettingChanged,
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
    required TResult Function(Setting setting) activeSettingChanged,
  }) {
    return themeModeChanged(mode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ThemeMode mode)? themeModeChanged,
    TResult Function(Setting setting)? activeSettingChanged,
  }) {
    return themeModeChanged?.call(mode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode mode)? themeModeChanged,
    TResult Function(Setting setting)? activeSettingChanged,
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
    required TResult Function(_ActiveSettingChanged value) activeSettingChanged,
  }) {
    return themeModeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ThemeModeChanged value)? themeModeChanged,
    TResult Function(_ActiveSettingChanged value)? activeSettingChanged,
  }) {
    return themeModeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeModeChanged value)? themeModeChanged,
    TResult Function(_ActiveSettingChanged value)? activeSettingChanged,
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
abstract class _$$_ActiveSettingChangedCopyWith<$Res> {
  factory _$$_ActiveSettingChangedCopyWith(_$_ActiveSettingChanged value,
          $Res Function(_$_ActiveSettingChanged) then) =
      __$$_ActiveSettingChangedCopyWithImpl<$Res>;

  $Res call({Setting setting});

  $SettingCopyWith<$Res> get setting;
}

/// @nodoc
class __$$_ActiveSettingChangedCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$$_ActiveSettingChangedCopyWith<$Res> {
  __$$_ActiveSettingChangedCopyWithImpl(_$_ActiveSettingChanged _value,
      $Res Function(_$_ActiveSettingChanged) _then)
      : super(_value, (v) => _then(v as _$_ActiveSettingChanged));

  @override
  _$_ActiveSettingChanged get _value => super._value as _$_ActiveSettingChanged;

  @override
  $Res call({
    Object? setting = freezed,
  }) {
    return _then(_$_ActiveSettingChanged(
      setting == freezed
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as Setting,
    ));
  }

  @override
  $SettingCopyWith<$Res> get setting {
    return $SettingCopyWith<$Res>(_value.setting, (value) {
      return _then(_value.copyWith(setting: value));
    });
  }
}

/// @nodoc

class _$_ActiveSettingChanged extends _ActiveSettingChanged {
  const _$_ActiveSettingChanged(this.setting) : super._();

  @override
  final Setting setting;

  @override
  String toString() {
    return 'SettingsEvent.activeSettingChanged(setting: $setting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActiveSettingChanged &&
            const DeepCollectionEquality().equals(other.setting, setting));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(setting));

  @JsonKey(ignore: true)
  @override
  _$$_ActiveSettingChangedCopyWith<_$_ActiveSettingChanged> get copyWith =>
      __$$_ActiveSettingChangedCopyWithImpl<_$_ActiveSettingChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode mode) themeModeChanged,
    required TResult Function(Setting setting) activeSettingChanged,
  }) {
    return activeSettingChanged(setting);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ThemeMode mode)? themeModeChanged,
    TResult Function(Setting setting)? activeSettingChanged,
  }) {
    return activeSettingChanged?.call(setting);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode mode)? themeModeChanged,
    TResult Function(Setting setting)? activeSettingChanged,
    required TResult orElse(),
  }) {
    if (activeSettingChanged != null) {
      return activeSettingChanged(setting);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeModeChanged value) themeModeChanged,
    required TResult Function(_ActiveSettingChanged value) activeSettingChanged,
  }) {
    return activeSettingChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ThemeModeChanged value)? themeModeChanged,
    TResult Function(_ActiveSettingChanged value)? activeSettingChanged,
  }) {
    return activeSettingChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeModeChanged value)? themeModeChanged,
    TResult Function(_ActiveSettingChanged value)? activeSettingChanged,
    required TResult orElse(),
  }) {
    if (activeSettingChanged != null) {
      return activeSettingChanged(this);
    }
    return orElse();
  }
}

abstract class _ActiveSettingChanged extends SettingsEvent {
  const factory _ActiveSettingChanged(final Setting setting) =
      _$_ActiveSettingChanged;

  const _ActiveSettingChanged._() : super._();

  Setting get setting;

  @JsonKey(ignore: true)
  _$$_ActiveSettingChangedCopyWith<_$_ActiveSettingChanged> get copyWith =>
      throw _privateConstructorUsedError;
}
