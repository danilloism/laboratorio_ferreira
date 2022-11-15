// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../../src/features/contato/domain/models/contato.dart';

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
  Set<String> get telefones => throw _privateConstructorUsedError;
  Set<Roles> get categorias => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  bool? get ativo => throw _privateConstructorUsedError;
  Account? get account => throw _privateConstructorUsedError;
  DateTime? get criadoEm => throw _privateConstructorUsedError;
  DateTime? get atualizadoEm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContatoCopyWith<Contato> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContatoCopyWith<$Res> {
  factory $ContatoCopyWith(Contato value, $Res Function(Contato) then) =
      _$ContatoCopyWithImpl<$Res, Contato>;
  @useResult
  $Res call(
      {String nome,
      Set<String> telefones,
      Set<Roles> categorias,
      String uid,
      bool? ativo,
      Account? account,
      DateTime? criadoEm,
      DateTime? atualizadoEm});

  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class _$ContatoCopyWithImpl<$Res, $Val extends Contato>
    implements $ContatoCopyWith<$Res> {
  _$ContatoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? telefones = null,
    Object? categorias = null,
    Object? uid = null,
    Object? ativo = freezed,
    Object? account = freezed,
    Object? criadoEm = freezed,
    Object? atualizadoEm = freezed,
  }) {
    return _then(_value.copyWith(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      telefones: null == telefones
          ? _value.telefones
          : telefones // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      categorias: null == categorias
          ? _value.categorias
          : categorias // ignore: cast_nullable_to_non_nullable
              as Set<Roles>,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      ativo: freezed == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      criadoEm: freezed == criadoEm
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      atualizadoEm: freezed == atualizadoEm
          ? _value.atualizadoEm
          : atualizadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ContatoCopyWith<$Res> implements $ContatoCopyWith<$Res> {
  factory _$$_ContatoCopyWith(
          _$_Contato value, $Res Function(_$_Contato) then) =
      __$$_ContatoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nome,
      Set<String> telefones,
      Set<Roles> categorias,
      String uid,
      bool? ativo,
      Account? account,
      DateTime? criadoEm,
      DateTime? atualizadoEm});

  @override
  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class __$$_ContatoCopyWithImpl<$Res>
    extends _$ContatoCopyWithImpl<$Res, _$_Contato>
    implements _$$_ContatoCopyWith<$Res> {
  __$$_ContatoCopyWithImpl(_$_Contato _value, $Res Function(_$_Contato) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? telefones = null,
    Object? categorias = null,
    Object? uid = null,
    Object? ativo = freezed,
    Object? account = freezed,
    Object? criadoEm = freezed,
    Object? atualizadoEm = freezed,
  }) {
    return _then(_$_Contato(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      telefones: null == telefones
          ? _value._telefones
          : telefones // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      categorias: null == categorias
          ? _value._categorias
          : categorias // ignore: cast_nullable_to_non_nullable
              as Set<Roles>,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      ativo: freezed == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      criadoEm: freezed == criadoEm
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      atualizadoEm: freezed == atualizadoEm
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
      required final Set<String> telefones,
      required final Set<Roles> categorias,
      required this.uid,
      this.ativo,
      this.account,
      this.criadoEm,
      this.atualizadoEm})
      : _telefones = telefones,
        _categorias = categorias;

  factory _$_Contato.fromJson(Map<String, dynamic> json) =>
      _$$_ContatoFromJson(json);

  @override
  final String nome;
  final Set<String> _telefones;
  @override
  Set<String> get telefones {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_telefones);
  }

  final Set<Roles> _categorias;
  @override
  Set<Roles> get categorias {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_categorias);
  }

  @override
  final String uid;
  @override
  final bool? ativo;
  @override
  final Account? account;
  @override
  final DateTime? criadoEm;
  @override
  final DateTime? atualizadoEm;

  @override
  String toString() {
    return 'Contato(nome: $nome, telefones: $telefones, categorias: $categorias, uid: $uid, ativo: $ativo, account: $account, criadoEm: $criadoEm, atualizadoEm: $atualizadoEm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Contato &&
            (identical(other.nome, nome) || other.nome == nome) &&
            const DeepCollectionEquality()
                .equals(other._telefones, _telefones) &&
            const DeepCollectionEquality()
                .equals(other._categorias, _categorias) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.ativo, ativo) || other.ativo == ativo) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.criadoEm, criadoEm) ||
                other.criadoEm == criadoEm) &&
            (identical(other.atualizadoEm, atualizadoEm) ||
                other.atualizadoEm == atualizadoEm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nome,
      const DeepCollectionEquality().hash(_telefones),
      const DeepCollectionEquality().hash(_categorias),
      uid,
      ativo,
      account,
      criadoEm,
      atualizadoEm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      required final Set<String> telefones,
      required final Set<Roles> categorias,
      required final String uid,
      final bool? ativo,
      final Account? account,
      final DateTime? criadoEm,
      final DateTime? atualizadoEm}) = _$_Contato;

  factory _Contato.fromJson(Map<String, dynamic> json) = _$_Contato.fromJson;

  @override
  String get nome;
  @override
  Set<String> get telefones;
  @override
  Set<Roles> get categorias;
  @override
  String get uid;
  @override
  bool? get ativo;
  @override
  Account? get account;
  @override
  DateTime? get criadoEm;
  @override
  DateTime? get atualizadoEm;
  @override
  @JsonKey(ignore: true)
  _$$_ContatoCopyWith<_$_Contato> get copyWith =>
      throw _privateConstructorUsedError;
}
