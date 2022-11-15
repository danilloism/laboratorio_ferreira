// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../../src/features/contato/domain/models/editor_contato.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditorContato {
  NomeInput get nome => throw _privateConstructorUsedError;
  TelefonesInputList get telefones => throw _privateConstructorUsedError;
  Set<Roles> get categorias => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditorContatoCopyWith<EditorContato> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditorContatoCopyWith<$Res> {
  factory $EditorContatoCopyWith(
          EditorContato value, $Res Function(EditorContato) then) =
      _$EditorContatoCopyWithImpl<$Res, EditorContato>;
  @useResult
  $Res call(
      {NomeInput nome,
      TelefonesInputList telefones,
      Set<Roles> categorias,
      FormzStatus status,
      String? error});
}

/// @nodoc
class _$EditorContatoCopyWithImpl<$Res, $Val extends EditorContato>
    implements $EditorContatoCopyWith<$Res> {
  _$EditorContatoCopyWithImpl(this._value, this._then);

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
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as NomeInput,
      telefones: null == telefones
          ? _value.telefones
          : telefones // ignore: cast_nullable_to_non_nullable
              as TelefonesInputList,
      categorias: null == categorias
          ? _value.categorias
          : categorias // ignore: cast_nullable_to_non_nullable
              as Set<Roles>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditorContatoCopyWith<$Res>
    implements $EditorContatoCopyWith<$Res> {
  factory _$$_EditorContatoCopyWith(
          _$_EditorContato value, $Res Function(_$_EditorContato) then) =
      __$$_EditorContatoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NomeInput nome,
      TelefonesInputList telefones,
      Set<Roles> categorias,
      FormzStatus status,
      String? error});
}

/// @nodoc
class __$$_EditorContatoCopyWithImpl<$Res>
    extends _$EditorContatoCopyWithImpl<$Res, _$_EditorContato>
    implements _$$_EditorContatoCopyWith<$Res> {
  __$$_EditorContatoCopyWithImpl(
      _$_EditorContato _value, $Res Function(_$_EditorContato) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? telefones = null,
    Object? categorias = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$_EditorContato(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as NomeInput,
      telefones: null == telefones
          ? _value.telefones
          : telefones // ignore: cast_nullable_to_non_nullable
              as TelefonesInputList,
      categorias: null == categorias
          ? _value._categorias
          : categorias // ignore: cast_nullable_to_non_nullable
              as Set<Roles>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_EditorContato implements _EditorContato {
  const _$_EditorContato(
      {this.nome = const NomeInput.pure(),
      this.telefones = const TelefonesInputList.pure(),
      final Set<Roles> categorias = const {},
      this.status = FormzStatus.pure,
      this.error})
      : _categorias = categorias;

  @override
  @JsonKey()
  final NomeInput nome;
  @override
  @JsonKey()
  final TelefonesInputList telefones;
  final Set<Roles> _categorias;
  @override
  @JsonKey()
  Set<Roles> get categorias {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_categorias);
  }

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  final String? error;

  @override
  String toString() {
    return 'EditorContato(nome: $nome, telefones: $telefones, categorias: $categorias, status: $status, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditorContato &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.telefones, telefones) ||
                other.telefones == telefones) &&
            const DeepCollectionEquality()
                .equals(other._categorias, _categorias) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nome, telefones,
      const DeepCollectionEquality().hash(_categorias), status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditorContatoCopyWith<_$_EditorContato> get copyWith =>
      __$$_EditorContatoCopyWithImpl<_$_EditorContato>(this, _$identity);
}

abstract class _EditorContato implements EditorContato {
  const factory _EditorContato(
      {final NomeInput nome,
      final TelefonesInputList telefones,
      final Set<Roles> categorias,
      final FormzStatus status,
      final String? error}) = _$_EditorContato;

  @override
  NomeInput get nome;
  @override
  TelefonesInputList get telefones;
  @override
  Set<Roles> get categorias;
  @override
  FormzStatus get status;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_EditorContatoCopyWith<_$_EditorContato> get copyWith =>
      throw _privateConstructorUsedError;
}
