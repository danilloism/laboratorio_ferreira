// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../../src/features/contato/presentation/states/contatos_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContatosStore {
  List<Contato> get contatos => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContatosStoreCopyWith<ContatosStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContatosStoreCopyWith<$Res> {
  factory $ContatosStoreCopyWith(
          ContatosStore value, $Res Function(ContatosStore) then) =
      _$ContatosStoreCopyWithImpl<$Res, ContatosStore>;
  @useResult
  $Res call({List<Contato> contatos, bool isLoading});
}

/// @nodoc
class _$ContatosStoreCopyWithImpl<$Res, $Val extends ContatosStore>
    implements $ContatosStoreCopyWith<$Res> {
  _$ContatosStoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contatos = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      contatos: null == contatos
          ? _value.contatos
          : contatos // ignore: cast_nullable_to_non_nullable
              as List<Contato>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContatosStoreCopyWith<$Res>
    implements $ContatosStoreCopyWith<$Res> {
  factory _$$_ContatosStoreCopyWith(
          _$_ContatosStore value, $Res Function(_$_ContatosStore) then) =
      __$$_ContatosStoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Contato> contatos, bool isLoading});
}

/// @nodoc
class __$$_ContatosStoreCopyWithImpl<$Res>
    extends _$ContatosStoreCopyWithImpl<$Res, _$_ContatosStore>
    implements _$$_ContatosStoreCopyWith<$Res> {
  __$$_ContatosStoreCopyWithImpl(
      _$_ContatosStore _value, $Res Function(_$_ContatosStore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contatos = null,
    Object? isLoading = null,
  }) {
    return _then(_$_ContatosStore(
      contatos: null == contatos
          ? _value._contatos
          : contatos // ignore: cast_nullable_to_non_nullable
              as List<Contato>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ContatosStore extends _ContatosStore {
  const _$_ContatosStore(
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
    return 'ContatosStore(contatos: $contatos, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContatosStore &&
            const DeepCollectionEquality().equals(other._contatos, _contatos) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_contatos), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContatosStoreCopyWith<_$_ContatosStore> get copyWith =>
      __$$_ContatosStoreCopyWithImpl<_$_ContatosStore>(this, _$identity);
}

abstract class _ContatosStore extends ContatosStore {
  const factory _ContatosStore(
      {final List<Contato> contatos, final bool isLoading}) = _$_ContatosStore;
  const _ContatosStore._() : super._();

  @override
  List<Contato> get contatos;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_ContatosStoreCopyWith<_$_ContatosStore> get copyWith =>
      throw _privateConstructorUsedError;
}
