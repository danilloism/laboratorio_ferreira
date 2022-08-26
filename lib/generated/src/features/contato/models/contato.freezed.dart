// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../src/features/contato/models/contato.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Contato _$ContatoFromJson(Map<String, dynamic> json) {
  return _Contato.fromJson(json);
}

/// @nodoc
mixin _$Contato {
  String get nome => throw _privateConstructorUsedError;
  List<String> get telefones => throw _privateConstructorUsedError;
  List<RolesEnum> get categorias => throw _privateConstructorUsedError;
  bool? get ativo => throw _privateConstructorUsedError;
  Account? get account => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  DateTime? get criadoEm => throw _privateConstructorUsedError;
  DateTime? get atualizadoEm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContatoCopyWith<Contato> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContatoCopyWith<$Res> {
  factory $ContatoCopyWith(Contato value, $Res Function(Contato) then) =
      _$ContatoCopyWithImpl<$Res>;
  $Res call(
      {String nome,
      List<String> telefones,
      List<RolesEnum> categorias,
      bool? ativo,
      Account? account,
      String? uid,
      DateTime? criadoEm,
      DateTime? atualizadoEm});

  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class _$ContatoCopyWithImpl<$Res> implements $ContatoCopyWith<$Res> {
  _$ContatoCopyWithImpl(this._value, this._then);

  final Contato _value;
  // ignore: unused_field
  final $Res Function(Contato) _then;

  @override
  $Res call({
    Object? nome = freezed,
    Object? telefones = freezed,
    Object? categorias = freezed,
    Object? ativo = freezed,
    Object? account = freezed,
    Object? uid = freezed,
    Object? criadoEm = freezed,
    Object? atualizadoEm = freezed,
  }) {
    return _then(_value.copyWith(
      nome: nome == freezed
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      telefones: telefones == freezed
          ? _value.telefones
          : telefones // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categorias: categorias == freezed
          ? _value.categorias
          : categorias // ignore: cast_nullable_to_non_nullable
              as List<RolesEnum>,
      ativo: ativo == freezed
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      criadoEm: criadoEm == freezed
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      atualizadoEm: atualizadoEm == freezed
          ? _value.atualizadoEm
          : atualizadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $AccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc
abstract class _$$_ContatoCopyWith<$Res> implements $ContatoCopyWith<$Res> {
  factory _$$_ContatoCopyWith(
          _$_Contato value, $Res Function(_$_Contato) then) =
      __$$_ContatoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String nome,
      List<String> telefones,
      List<RolesEnum> categorias,
      bool? ativo,
      Account? account,
      String? uid,
      DateTime? criadoEm,
      DateTime? atualizadoEm});

  @override
  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class __$$_ContatoCopyWithImpl<$Res> extends _$ContatoCopyWithImpl<$Res>
    implements _$$_ContatoCopyWith<$Res> {
  __$$_ContatoCopyWithImpl(_$_Contato _value, $Res Function(_$_Contato) _then)
      : super(_value, (v) => _then(v as _$_Contato));

  @override
  _$_Contato get _value => super._value as _$_Contato;

  @override
  $Res call({
    Object? nome = freezed,
    Object? telefones = freezed,
    Object? categorias = freezed,
    Object? ativo = freezed,
    Object? account = freezed,
    Object? uid = freezed,
    Object? criadoEm = freezed,
    Object? atualizadoEm = freezed,
  }) {
    return _then(_$_Contato(
      nome: nome == freezed
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      telefones: telefones == freezed
          ? _value._telefones
          : telefones // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categorias: categorias == freezed
          ? _value._categorias
          : categorias // ignore: cast_nullable_to_non_nullable
              as List<RolesEnum>,
      ativo: ativo == freezed
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      criadoEm: criadoEm == freezed
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      atualizadoEm: atualizadoEm == freezed
          ? _value.atualizadoEm
          : atualizadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Contato implements _Contato {
  const _$_Contato(
      {required this.nome,
      required final List<String> telefones,
      required final List<RolesEnum> categorias,
      this.ativo,
      this.account,
      this.uid,
      this.criadoEm,
      this.atualizadoEm})
      : _telefones = telefones,
        _categorias = categorias;

  factory _$_Contato.fromJson(Map<String, dynamic> json) =>
      _$$_ContatoFromJson(json);

  @override
  final String nome;
  final List<String> _telefones;
  @override
  List<String> get telefones {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_telefones);
  }

  final List<RolesEnum> _categorias;
  @override
  List<RolesEnum> get categorias {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categorias);
  }

  @override
  final bool? ativo;
  @override
  final Account? account;
  @override
  final String? uid;
  @override
  final DateTime? criadoEm;
  @override
  final DateTime? atualizadoEm;

  @override
  String toString() {
    return 'Contato(nome: $nome, telefones: $telefones, categorias: $categorias, ativo: $ativo, account: $account, uid: $uid, criadoEm: $criadoEm, atualizadoEm: $atualizadoEm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Contato &&
            const DeepCollectionEquality().equals(other.nome, nome) &&
            const DeepCollectionEquality()
                .equals(other._telefones, _telefones) &&
            const DeepCollectionEquality()
                .equals(other._categorias, _categorias) &&
            const DeepCollectionEquality().equals(other.ativo, ativo) &&
            const DeepCollectionEquality().equals(other.account, account) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.criadoEm, criadoEm) &&
            const DeepCollectionEquality()
                .equals(other.atualizadoEm, atualizadoEm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nome),
      const DeepCollectionEquality().hash(_telefones),
      const DeepCollectionEquality().hash(_categorias),
      const DeepCollectionEquality().hash(ativo),
      const DeepCollectionEquality().hash(account),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(criadoEm),
      const DeepCollectionEquality().hash(atualizadoEm));

  @JsonKey(ignore: true)
  @override
  _$$_ContatoCopyWith<_$_Contato> get copyWith =>
      __$$_ContatoCopyWithImpl<_$_Contato>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContatoToJson(
      this,
    );
  }
}

abstract class _Contato implements Contato {
  const factory _Contato(
      {required final String nome,
      required final List<String> telefones,
      required final List<RolesEnum> categorias,
      final bool? ativo,
      final Account? account,
      final String? uid,
      final DateTime? criadoEm,
      final DateTime? atualizadoEm}) = _$_Contato;

  factory _Contato.fromJson(Map<String, dynamic> json) = _$_Contato.fromJson;

  @override
  String get nome;
  @override
  List<String> get telefones;
  @override
  List<RolesEnum> get categorias;
  @override
  bool? get ativo;
  @override
  Account? get account;
  @override
  String? get uid;
  @override
  DateTime? get criadoEm;
  @override
  DateTime? get atualizadoEm;
  @override
  @JsonKey(ignore: true)
  _$$_ContatoCopyWith<_$_Contato> get copyWith =>
      throw _privateConstructorUsedError;
}
