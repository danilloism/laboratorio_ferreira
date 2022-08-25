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
  Contato get contato => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get expiresIn => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get logInDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) Contato contato,
      @HiveField(1) DateTime expiresIn,
      @HiveField(2) DateTime logInDate});

  $ContatoCopyWith<$Res> get contato;
}

/// @nodoc
class _$SessionCopyWithImpl<$Res> implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  final Session _value;
  // ignore: unused_field
  final $Res Function(Session) _then;

  @override
  $Res call({
    Object? contato = freezed,
    Object? expiresIn = freezed,
    Object? logInDate = freezed,
  }) {
    return _then(_value.copyWith(
      contato: contato == freezed
          ? _value.contato
          : contato // ignore: cast_nullable_to_non_nullable
              as Contato,
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      logInDate: logInDate == freezed
          ? _value.logInDate
          : logInDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $ContatoCopyWith<$Res> get contato {
    return $ContatoCopyWith<$Res>(_value.contato, (value) {
      return _then(_value.copyWith(contato: value));
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
      {@HiveField(0) Contato contato,
      @HiveField(1) DateTime expiresIn,
      @HiveField(2) DateTime logInDate});

  @override
  $ContatoCopyWith<$Res> get contato;
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
    Object? contato = freezed,
    Object? expiresIn = freezed,
    Object? logInDate = freezed,
  }) {
    return _then(_$_AuthModel(
      contato: contato == freezed
          ? _value.contato
          : contato // ignore: cast_nullable_to_non_nullable
              as Contato,
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      logInDate: logInDate == freezed
          ? _value.logInDate
          : logInDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 2)
class _$_AuthModel implements _AuthModel {
  const _$_AuthModel(
      {@HiveField(0) required this.contato,
      @HiveField(1) required this.expiresIn,
      @HiveField(2) required this.logInDate});

  @override
  @HiveField(0)
  final Contato contato;
  @override
  @HiveField(1)
  final DateTime expiresIn;
  @override
  @HiveField(2)
  final DateTime logInDate;

  @override
  String toString() {
    return 'Session(contato: $contato, expiresIn: $expiresIn, logInDate: $logInDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthModel &&
            const DeepCollectionEquality().equals(other.contato, contato) &&
            const DeepCollectionEquality().equals(other.expiresIn, expiresIn) &&
            const DeepCollectionEquality().equals(other.logInDate, logInDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(contato),
      const DeepCollectionEquality().hash(expiresIn),
      const DeepCollectionEquality().hash(logInDate));

  @JsonKey(ignore: true)
  @override
  _$$_AuthModelCopyWith<_$_AuthModel> get copyWith =>
      __$$_AuthModelCopyWithImpl<_$_AuthModel>(this, _$identity);
}

abstract class _AuthModel implements Session {
  const factory _AuthModel(
      {@HiveField(0) required final Contato contato,
      @HiveField(1) required final DateTime expiresIn,
      @HiveField(2) required final DateTime logInDate}) = _$_AuthModel;

  @override
  @HiveField(0)
  Contato get contato;
  @override
  @HiveField(1)
  DateTime get expiresIn;
  @override
  @HiveField(2)
  DateTime get logInDate;
  @override
  @JsonKey(ignore: true)
  _$$_AuthModelCopyWith<_$_AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}
