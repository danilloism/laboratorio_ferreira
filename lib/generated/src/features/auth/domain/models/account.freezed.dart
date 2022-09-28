// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../../src/features/auth/domain/models/account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  String get email => throw _privateConstructorUsedError;
  String? get senha => throw _privateConstructorUsedError;
  DateTime? get criadoEm => throw _privateConstructorUsedError;
  DateTime? get atualizadoEm => throw _privateConstructorUsedError;
  String? get contatoUid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res>;
  $Res call(
      {String email,
      String? senha,
      DateTime? criadoEm,
      DateTime? atualizadoEm,
      String? contatoUid});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res> implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  final Account _value;
  // ignore: unused_field
  final $Res Function(Account) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? senha = freezed,
    Object? criadoEm = freezed,
    Object? atualizadoEm = freezed,
    Object? contatoUid = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      senha: senha == freezed
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String?,
      criadoEm: criadoEm == freezed
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      atualizadoEm: atualizadoEm == freezed
          ? _value.atualizadoEm
          : atualizadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contatoUid: contatoUid == freezed
          ? _value.contatoUid
          : contatoUid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$_AccountCopyWith(
          _$_Account value, $Res Function(_$_Account) then) =
      __$$_AccountCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      String? senha,
      DateTime? criadoEm,
      DateTime? atualizadoEm,
      String? contatoUid});
}

/// @nodoc
class __$$_AccountCopyWithImpl<$Res> extends _$AccountCopyWithImpl<$Res>
    implements _$$_AccountCopyWith<$Res> {
  __$$_AccountCopyWithImpl(_$_Account _value, $Res Function(_$_Account) _then)
      : super(_value, (v) => _then(v as _$_Account));

  @override
  _$_Account get _value => super._value as _$_Account;

  @override
  $Res call({
    Object? email = freezed,
    Object? senha = freezed,
    Object? criadoEm = freezed,
    Object? atualizadoEm = freezed,
    Object? contatoUid = freezed,
  }) {
    return _then(_$_Account(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      senha: senha == freezed
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String?,
      criadoEm: criadoEm == freezed
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      atualizadoEm: atualizadoEm == freezed
          ? _value.atualizadoEm
          : atualizadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contatoUid: contatoUid == freezed
          ? _value.contatoUid
          : contatoUid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Account implements _Account {
  const _$_Account(
      {required this.email,
      this.senha,
      this.criadoEm,
      this.atualizadoEm,
      this.contatoUid});

  factory _$_Account.fromJson(Map<String, dynamic> json) =>
      _$$_AccountFromJson(json);

  @override
  final String email;
  @override
  final String? senha;
  @override
  final DateTime? criadoEm;
  @override
  final DateTime? atualizadoEm;
  @override
  final String? contatoUid;

  @override
  String toString() {
    return 'Account(email: $email, senha: $senha, criadoEm: $criadoEm, atualizadoEm: $atualizadoEm, contatoUid: $contatoUid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Account &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.senha, senha) &&
            const DeepCollectionEquality().equals(other.criadoEm, criadoEm) &&
            const DeepCollectionEquality()
                .equals(other.atualizadoEm, atualizadoEm) &&
            const DeepCollectionEquality()
                .equals(other.contatoUid, contatoUid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(senha),
      const DeepCollectionEquality().hash(criadoEm),
      const DeepCollectionEquality().hash(atualizadoEm),
      const DeepCollectionEquality().hash(contatoUid));

  @JsonKey(ignore: true)
  @override
  _$$_AccountCopyWith<_$_Account> get copyWith =>
      __$$_AccountCopyWithImpl<_$_Account>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountToJson(
      this,
    );
  }
}

abstract class _Account implements Account {
  const factory _Account(
      {required final String email,
      final String? senha,
      final DateTime? criadoEm,
      final DateTime? atualizadoEm,
      final String? contatoUid}) = _$_Account;

  factory _Account.fromJson(Map<String, dynamic> json) = _$_Account.fromJson;

  @override
  String get email;
  @override
  String? get senha;
  @override
  DateTime? get criadoEm;
  @override
  DateTime? get atualizadoEm;
  @override
  String? get contatoUid;
  @override
  @JsonKey(ignore: true)
  _$$_AccountCopyWith<_$_Account> get copyWith =>
      throw _privateConstructorUsedError;
}
