// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../src/features/auth/models/session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Session {
  @HiveField(0)
  Account get account => throw _privateConstructorUsedError;
  @HiveField(1)
  List<RolesEnum> get roles => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get expiresIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) Account account,
      @HiveField(1) List<RolesEnum> roles,
      @HiveField(2) DateTime expiresIn});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class _$SessionCopyWithImpl<$Res> implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  final Session _value;
  // ignore: unused_field
  final $Res Function(Session) _then;

  @override
  $Res call({
    Object? account = freezed,
    Object? roles = freezed,
    Object? expiresIn = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      roles: roles == freezed
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<RolesEnum>,
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$_AuthModelCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$_AuthModelCopyWith(
          _$_AuthModel value, $Res Function(_$_AuthModel) then) =
      __$$_AuthModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) Account account,
      @HiveField(1) List<RolesEnum> roles,
      @HiveField(2) DateTime expiresIn});

  @override
  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$_AuthModelCopyWithImpl<$Res> extends _$SessionCopyWithImpl<$Res>
    implements _$$_AuthModelCopyWith<$Res> {
  __$$_AuthModelCopyWithImpl(
      _$_AuthModel _value, $Res Function(_$_AuthModel) _then)
      : super(_value, (v) => _then(v as _$_AuthModel));

  @override
  _$_AuthModel get _value => super._value as _$_AuthModel;

  @override
  $Res call({
    Object? account = freezed,
    Object? roles = freezed,
    Object? expiresIn = freezed,
  }) {
    return _then(_$_AuthModel(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      roles: roles == freezed
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<RolesEnum>,
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 2)
class _$_AuthModel implements _AuthModel {
  const _$_AuthModel(
      {@HiveField(0) required this.account,
      @HiveField(1) required final List<RolesEnum> roles,
      @HiveField(2) required this.expiresIn})
      : _roles = roles;

  @override
  @HiveField(0)
  final Account account;
  final List<RolesEnum> _roles;
  @override
  @HiveField(1)
  List<RolesEnum> get roles {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  @HiveField(2)
  final DateTime expiresIn;

  @override
  String toString() {
    return 'Session(account: $account, roles: $roles, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthModel &&
            const DeepCollectionEquality().equals(other.account, account) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            const DeepCollectionEquality().equals(other.expiresIn, expiresIn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(account),
      const DeepCollectionEquality().hash(_roles),
      const DeepCollectionEquality().hash(expiresIn));

  @JsonKey(ignore: true)
  @override
  _$$_AuthModelCopyWith<_$_AuthModel> get copyWith =>
      __$$_AuthModelCopyWithImpl<_$_AuthModel>(this, _$identity);
}

abstract class _AuthModel implements Session {
  const factory _AuthModel(
      {@HiveField(0) required final Account account,
      @HiveField(1) required final List<RolesEnum> roles,
      @HiveField(2) required final DateTime expiresIn}) = _$_AuthModel;

  @override
  @HiveField(0)
  Account get account;
  @override
  @HiveField(1)
  List<RolesEnum> get roles;
  @override
  @HiveField(2)
  DateTime get expiresIn;
  @override
  @JsonKey(ignore: true)
  _$$_AuthModelCopyWith<_$_AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}
