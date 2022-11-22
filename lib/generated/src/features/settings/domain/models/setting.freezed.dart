// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../../src/features/settings/domain/models/setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Setting {
  Session? get session => throw _privateConstructorUsedError;
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  bool get useMaterial3 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingCopyWith<Setting> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingCopyWith<$Res> {
  factory $SettingCopyWith(Setting value, $Res Function(Setting) then) =
      _$SettingCopyWithImpl<$Res, Setting>;
  @useResult
  $Res call({Session? session, ThemeMode themeMode, bool useMaterial3});

  $SessionCopyWith<$Res>? get session;
}

/// @nodoc
class _$SettingCopyWithImpl<$Res, $Val extends Setting>
    implements $SettingCopyWith<$Res> {
  _$SettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? themeMode = null,
    Object? useMaterial3 = null,
  }) {
    return _then(_value.copyWith(
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session?,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      useMaterial3: null == useMaterial3
          ? _value.useMaterial3
          : useMaterial3 // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res>? get session {
    if (_value.session == null) {
      return null;
    }

    return $SessionCopyWith<$Res>(_value.session!, (value) {
      return _then(_value.copyWith(session: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SettingCopyWith<$Res> implements $SettingCopyWith<$Res> {
  factory _$$_SettingCopyWith(
          _$_Setting value, $Res Function(_$_Setting) then) =
      __$$_SettingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Session? session, ThemeMode themeMode, bool useMaterial3});

  @override
  $SessionCopyWith<$Res>? get session;
}

/// @nodoc
class __$$_SettingCopyWithImpl<$Res>
    extends _$SettingCopyWithImpl<$Res, _$_Setting>
    implements _$$_SettingCopyWith<$Res> {
  __$$_SettingCopyWithImpl(_$_Setting _value, $Res Function(_$_Setting) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? themeMode = null,
    Object? useMaterial3 = null,
  }) {
    return _then(_$_Setting(
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session?,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      useMaterial3: null == useMaterial3
          ? _value.useMaterial3
          : useMaterial3 // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Setting implements _Setting {
  const _$_Setting(
      {this.session,
      this.themeMode = ThemeMode.system,
      this.useMaterial3 = false});

  @override
  final Session? session;
  @override
  @JsonKey()
  final ThemeMode themeMode;
  @override
  @JsonKey()
  final bool useMaterial3;

  @override
  String toString() {
    return 'Setting(session: $session, themeMode: $themeMode, useMaterial3: $useMaterial3)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Setting &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.useMaterial3, useMaterial3) ||
                other.useMaterial3 == useMaterial3));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, session, themeMode, useMaterial3);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingCopyWith<_$_Setting> get copyWith =>
      __$$_SettingCopyWithImpl<_$_Setting>(this, _$identity);
}

abstract class _Setting implements Setting {
  const factory _Setting(
      {final Session? session,
      final ThemeMode themeMode,
      final bool useMaterial3}) = _$_Setting;

  @override
  Session? get session;
  @override
  ThemeMode get themeMode;
  @override
  bool get useMaterial3;
  @override
  @JsonKey(ignore: true)
  _$$_SettingCopyWith<_$_Setting> get copyWith =>
      throw _privateConstructorUsedError;
}
