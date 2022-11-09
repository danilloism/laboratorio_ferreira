// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../../src/features/contato/presentation/states/lista_contatos_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListaContatosState {
  List<Contato> get contatos => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListaContatosStateCopyWith<ListaContatosState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListaContatosStateCopyWith<$Res> {
  factory $ListaContatosStateCopyWith(
          ListaContatosState value, $Res Function(ListaContatosState) then) =
      _$ListaContatosStateCopyWithImpl<$Res>;
  $Res call({List<Contato> contatos, bool isLoading});
}

/// @nodoc
class _$ListaContatosStateCopyWithImpl<$Res>
    implements $ListaContatosStateCopyWith<$Res> {
  _$ListaContatosStateCopyWithImpl(this._value, this._then);

  final ListaContatosState _value;
  // ignore: unused_field
  final $Res Function(ListaContatosState) _then;

  @override
  $Res call({
    Object? contatos = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      contatos: contatos == freezed
          ? _value.contatos
          : contatos // ignore: cast_nullable_to_non_nullable
              as List<Contato>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ListaContatosStateCopyWith<$Res>
    implements $ListaContatosStateCopyWith<$Res> {
  factory _$$_ListaContatosStateCopyWith(_$_ListaContatosState value,
          $Res Function(_$_ListaContatosState) then) =
      __$$_ListaContatosStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Contato> contatos, bool isLoading});
}

/// @nodoc
class __$$_ListaContatosStateCopyWithImpl<$Res>
    extends _$ListaContatosStateCopyWithImpl<$Res>
    implements _$$_ListaContatosStateCopyWith<$Res> {
  __$$_ListaContatosStateCopyWithImpl(
      _$_ListaContatosState _value, $Res Function(_$_ListaContatosState) _then)
      : super(_value, (v) => _then(v as _$_ListaContatosState));

  @override
  _$_ListaContatosState get _value => super._value as _$_ListaContatosState;

  @override
  $Res call({
    Object? contatos = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_ListaContatosState(
      contatos: contatos == freezed
          ? _value._contatos
          : contatos // ignore: cast_nullable_to_non_nullable
              as List<Contato>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ListaContatosState extends _ListaContatosState {
  const _$_ListaContatosState(
      {final List<Contato> contatos = const [], this.isLoading = true})
      : _contatos = contatos,
        super._();

  final List<Contato> _contatos;
  @override
  @JsonKey()
  List<Contato> get contatos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contatos);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ListaContatosState(contatos: $contatos, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListaContatosState &&
            const DeepCollectionEquality().equals(other._contatos, _contatos) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_contatos),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_ListaContatosStateCopyWith<_$_ListaContatosState> get copyWith =>
      __$$_ListaContatosStateCopyWithImpl<_$_ListaContatosState>(
          this, _$identity);
}

abstract class _ListaContatosState extends ListaContatosState {
  const factory _ListaContatosState(
      {final List<Contato> contatos,
      final bool isLoading}) = _$_ListaContatosState;
  const _ListaContatosState._() : super._();

  @override
  List<Contato> get contatos;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_ListaContatosStateCopyWith<_$_ListaContatosState> get copyWith =>
      throw _privateConstructorUsedError;
}
