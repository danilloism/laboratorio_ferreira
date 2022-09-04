// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../src/features/auth/bloc/auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appInitialized,
    required TResult Function(Account account) logInButtonPressed,
    required TResult Function() logOutButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appInitialized,
    TResult Function(Account account)? logInButtonPressed,
    TResult Function()? logOutButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appInitialized,
    TResult Function(Account account)? logInButtonPressed,
    TResult Function()? logOutButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitialized value) appInitialized,
    required TResult Function(LogInButtonPressed value) logInButtonPressed,
    required TResult Function(LogOutButtonPressed value) logOutButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppInitialized value)? appInitialized,
    TResult Function(LogInButtonPressed value)? logInButtonPressed,
    TResult Function(LogOutButtonPressed value)? logOutButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitialized value)? appInitialized,
    TResult Function(LogInButtonPressed value)? logInButtonPressed,
    TResult Function(LogOutButtonPressed value)? logOutButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class _$$AppInitializedCopyWith<$Res> {
  factory _$$AppInitializedCopyWith(
          _$AppInitialized value, $Res Function(_$AppInitialized) then) =
      __$$AppInitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppInitializedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AppInitializedCopyWith<$Res> {
  __$$AppInitializedCopyWithImpl(
      _$AppInitialized _value, $Res Function(_$AppInitialized) _then)
      : super(_value, (v) => _then(v as _$AppInitialized));

  @override
  _$AppInitialized get _value => super._value as _$AppInitialized;
}

/// @nodoc

class _$AppInitialized implements AppInitialized {
  const _$AppInitialized();

  @override
  String toString() {
    return 'AuthEvent.appInitialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appInitialized,
    required TResult Function(Account account) logInButtonPressed,
    required TResult Function() logOutButtonPressed,
  }) {
    return appInitialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appInitialized,
    TResult Function(Account account)? logInButtonPressed,
    TResult Function()? logOutButtonPressed,
  }) {
    return appInitialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appInitialized,
    TResult Function(Account account)? logInButtonPressed,
    TResult Function()? logOutButtonPressed,
    required TResult orElse(),
  }) {
    if (appInitialized != null) {
      return appInitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitialized value) appInitialized,
    required TResult Function(LogInButtonPressed value) logInButtonPressed,
    required TResult Function(LogOutButtonPressed value) logOutButtonPressed,
  }) {
    return appInitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppInitialized value)? appInitialized,
    TResult Function(LogInButtonPressed value)? logInButtonPressed,
    TResult Function(LogOutButtonPressed value)? logOutButtonPressed,
  }) {
    return appInitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitialized value)? appInitialized,
    TResult Function(LogInButtonPressed value)? logInButtonPressed,
    TResult Function(LogOutButtonPressed value)? logOutButtonPressed,
    required TResult orElse(),
  }) {
    if (appInitialized != null) {
      return appInitialized(this);
    }
    return orElse();
  }
}

abstract class AppInitialized implements AuthEvent {
  const factory AppInitialized() = _$AppInitialized;
}

/// @nodoc
abstract class _$$LogInButtonPressedCopyWith<$Res> {
  factory _$$LogInButtonPressedCopyWith(_$LogInButtonPressed value,
          $Res Function(_$LogInButtonPressed) then) =
      __$$LogInButtonPressedCopyWithImpl<$Res>;
  $Res call({Account account});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$LogInButtonPressedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$LogInButtonPressedCopyWith<$Res> {
  __$$LogInButtonPressedCopyWithImpl(
      _$LogInButtonPressed _value, $Res Function(_$LogInButtonPressed) _then)
      : super(_value, (v) => _then(v as _$LogInButtonPressed));

  @override
  _$LogInButtonPressed get _value => super._value as _$LogInButtonPressed;

  @override
  $Res call({
    Object? account = freezed,
  }) {
    return _then(_$LogInButtonPressed(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
    ));
  }

  @override
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc

class _$LogInButtonPressed implements LogInButtonPressed {
  const _$LogInButtonPressed({required this.account});

  @override
  final Account account;

  @override
  String toString() {
    return 'AuthEvent.logInButtonPressed(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogInButtonPressed &&
            const DeepCollectionEquality().equals(other.account, account));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(account));

  @JsonKey(ignore: true)
  @override
  _$$LogInButtonPressedCopyWith<_$LogInButtonPressed> get copyWith =>
      __$$LogInButtonPressedCopyWithImpl<_$LogInButtonPressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appInitialized,
    required TResult Function(Account account) logInButtonPressed,
    required TResult Function() logOutButtonPressed,
  }) {
    return logInButtonPressed(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appInitialized,
    TResult Function(Account account)? logInButtonPressed,
    TResult Function()? logOutButtonPressed,
  }) {
    return logInButtonPressed?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appInitialized,
    TResult Function(Account account)? logInButtonPressed,
    TResult Function()? logOutButtonPressed,
    required TResult orElse(),
  }) {
    if (logInButtonPressed != null) {
      return logInButtonPressed(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitialized value) appInitialized,
    required TResult Function(LogInButtonPressed value) logInButtonPressed,
    required TResult Function(LogOutButtonPressed value) logOutButtonPressed,
  }) {
    return logInButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppInitialized value)? appInitialized,
    TResult Function(LogInButtonPressed value)? logInButtonPressed,
    TResult Function(LogOutButtonPressed value)? logOutButtonPressed,
  }) {
    return logInButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitialized value)? appInitialized,
    TResult Function(LogInButtonPressed value)? logInButtonPressed,
    TResult Function(LogOutButtonPressed value)? logOutButtonPressed,
    required TResult orElse(),
  }) {
    if (logInButtonPressed != null) {
      return logInButtonPressed(this);
    }
    return orElse();
  }
}

abstract class LogInButtonPressed implements AuthEvent {
  const factory LogInButtonPressed({required final Account account}) =
      _$LogInButtonPressed;

  Account get account;
  @JsonKey(ignore: true)
  _$$LogInButtonPressedCopyWith<_$LogInButtonPressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogOutButtonPressedCopyWith<$Res> {
  factory _$$LogOutButtonPressedCopyWith(_$LogOutButtonPressed value,
          $Res Function(_$LogOutButtonPressed) then) =
      __$$LogOutButtonPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogOutButtonPressedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$LogOutButtonPressedCopyWith<$Res> {
  __$$LogOutButtonPressedCopyWithImpl(
      _$LogOutButtonPressed _value, $Res Function(_$LogOutButtonPressed) _then)
      : super(_value, (v) => _then(v as _$LogOutButtonPressed));

  @override
  _$LogOutButtonPressed get _value => super._value as _$LogOutButtonPressed;
}

/// @nodoc

class _$LogOutButtonPressed implements LogOutButtonPressed {
  const _$LogOutButtonPressed();

  @override
  String toString() {
    return 'AuthEvent.logOutButtonPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogOutButtonPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appInitialized,
    required TResult Function(Account account) logInButtonPressed,
    required TResult Function() logOutButtonPressed,
  }) {
    return logOutButtonPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appInitialized,
    TResult Function(Account account)? logInButtonPressed,
    TResult Function()? logOutButtonPressed,
  }) {
    return logOutButtonPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appInitialized,
    TResult Function(Account account)? logInButtonPressed,
    TResult Function()? logOutButtonPressed,
    required TResult orElse(),
  }) {
    if (logOutButtonPressed != null) {
      return logOutButtonPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitialized value) appInitialized,
    required TResult Function(LogInButtonPressed value) logInButtonPressed,
    required TResult Function(LogOutButtonPressed value) logOutButtonPressed,
  }) {
    return logOutButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppInitialized value)? appInitialized,
    TResult Function(LogInButtonPressed value)? logInButtonPressed,
    TResult Function(LogOutButtonPressed value)? logOutButtonPressed,
  }) {
    return logOutButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitialized value)? appInitialized,
    TResult Function(LogInButtonPressed value)? logInButtonPressed,
    TResult Function(LogOutButtonPressed value)? logOutButtonPressed,
    required TResult orElse(),
  }) {
    if (logOutButtonPressed != null) {
      return logOutButtonPressed(this);
    }
    return orElse();
  }
}

abstract class LogOutButtonPressed implements AuthEvent {
  const factory LogOutButtonPressed() = _$LogOutButtonPressed;
}
