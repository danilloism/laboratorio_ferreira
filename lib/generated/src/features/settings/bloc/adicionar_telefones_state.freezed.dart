// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../src/features/settings/bloc/adicionar_telefones_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdicionarTelefonesState {
  List<TelefoneInputWithKey> get telefones =>
      throw _privateConstructorUsedError;
  List<TelefoneInputError> get errors => throw _privateConstructorUsedError;
  bool get update => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdicionarTelefonesStateCopyWith<AdicionarTelefonesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdicionarTelefonesStateCopyWith<$Res> {
  factory $AdicionarTelefonesStateCopyWith(AdicionarTelefonesState value,
          $Res Function(AdicionarTelefonesState) then) =
      _$AdicionarTelefonesStateCopyWithImpl<$Res>;
  $Res call(
      {List<TelefoneInputWithKey> telefones,
      List<TelefoneInputError> errors,
      bool update});
}

/// @nodoc
class _$AdicionarTelefonesStateCopyWithImpl<$Res>
    implements $AdicionarTelefonesStateCopyWith<$Res> {
  _$AdicionarTelefonesStateCopyWithImpl(this._value, this._then);

  final AdicionarTelefonesState _value;
  // ignore: unused_field
  final $Res Function(AdicionarTelefonesState) _then;

  @override
  $Res call({
    Object? telefones = freezed,
    Object? errors = freezed,
    Object? update = freezed,
  }) {
    return _then(_value.copyWith(
      telefones: telefones == freezed
          ? _value.telefones
          : telefones // ignore: cast_nullable_to_non_nullable
              as List<TelefoneInputWithKey>,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<TelefoneInputError>,
      update: update == freezed
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_AdicionarTelefonesStateCopyWith<$Res>
    implements $AdicionarTelefonesStateCopyWith<$Res> {
  factory _$$_AdicionarTelefonesStateCopyWith(_$_AdicionarTelefonesState value,
          $Res Function(_$_AdicionarTelefonesState) then) =
      __$$_AdicionarTelefonesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<TelefoneInputWithKey> telefones,
      List<TelefoneInputError> errors,
      bool update});
}

/// @nodoc
class __$$_AdicionarTelefonesStateCopyWithImpl<$Res>
    extends _$AdicionarTelefonesStateCopyWithImpl<$Res>
    implements _$$_AdicionarTelefonesStateCopyWith<$Res> {
  __$$_AdicionarTelefonesStateCopyWithImpl(_$_AdicionarTelefonesState _value,
      $Res Function(_$_AdicionarTelefonesState) _then)
      : super(_value, (v) => _then(v as _$_AdicionarTelefonesState));

  @override
  _$_AdicionarTelefonesState get _value =>
      super._value as _$_AdicionarTelefonesState;

  @override
  $Res call({
    Object? telefones = freezed,
    Object? errors = freezed,
    Object? update = freezed,
  }) {
    return _then(_$_AdicionarTelefonesState(
      telefones: telefones == freezed
          ? _value._telefones
          : telefones // ignore: cast_nullable_to_non_nullable
              as List<TelefoneInputWithKey>,
      errors: errors == freezed
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<TelefoneInputError>,
      update: update == freezed
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AdicionarTelefonesState implements _AdicionarTelefonesState {
  const _$_AdicionarTelefonesState(
      {final List<TelefoneInputWithKey> telefones = const [],
      final List<TelefoneInputError> errors = const [],
      this.update = false})
      : _telefones = telefones,
        _errors = errors;

  final List<TelefoneInputWithKey> _telefones;
  @override
  @JsonKey()
  List<TelefoneInputWithKey> get telefones {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_telefones);
  }

  final List<TelefoneInputError> _errors;
  @override
  @JsonKey()
  List<TelefoneInputError> get errors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  @JsonKey()
  final bool update;

  @override
  String toString() {
    return 'AdicionarTelefonesState(telefones: $telefones, errors: $errors, update: $update)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdicionarTelefonesState &&
            const DeepCollectionEquality()
                .equals(other._telefones, _telefones) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            const DeepCollectionEquality().equals(other.update, update));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_telefones),
      const DeepCollectionEquality().hash(_errors),
      const DeepCollectionEquality().hash(update));

  @JsonKey(ignore: true)
  @override
  _$$_AdicionarTelefonesStateCopyWith<_$_AdicionarTelefonesState>
      get copyWith =>
          __$$_AdicionarTelefonesStateCopyWithImpl<_$_AdicionarTelefonesState>(
              this, _$identity);
}

abstract class _AdicionarTelefonesState implements AdicionarTelefonesState {
  const factory _AdicionarTelefonesState(
      {final List<TelefoneInputWithKey> telefones,
      final List<TelefoneInputError> errors,
      final bool update}) = _$_AdicionarTelefonesState;

  @override
  List<TelefoneInputWithKey> get telefones;
  @override
  List<TelefoneInputError> get errors;
  @override
  bool get update;
  @override
  @JsonKey(ignore: true)
  _$$_AdicionarTelefonesStateCopyWith<_$_AdicionarTelefonesState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TelefoneInputWithKey {
  TelefoneInput get input => throw _privateConstructorUsedError;
  int get key => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TelefoneInputWithKeyCopyWith<TelefoneInputWithKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TelefoneInputWithKeyCopyWith<$Res> {
  factory $TelefoneInputWithKeyCopyWith(TelefoneInputWithKey value,
          $Res Function(TelefoneInputWithKey) then) =
      _$TelefoneInputWithKeyCopyWithImpl<$Res>;
  $Res call({TelefoneInput input, int key});
}

/// @nodoc
class _$TelefoneInputWithKeyCopyWithImpl<$Res>
    implements $TelefoneInputWithKeyCopyWith<$Res> {
  _$TelefoneInputWithKeyCopyWithImpl(this._value, this._then);

  final TelefoneInputWithKey _value;
  // ignore: unused_field
  final $Res Function(TelefoneInputWithKey) _then;

  @override
  $Res call({
    Object? input = freezed,
    Object? key = freezed,
  }) {
    return _then(_value.copyWith(
      input: input == freezed
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as TelefoneInput,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_TelefoneInputWithKeyCopyWith<$Res>
    implements $TelefoneInputWithKeyCopyWith<$Res> {
  factory _$$_TelefoneInputWithKeyCopyWith(_$_TelefoneInputWithKey value,
          $Res Function(_$_TelefoneInputWithKey) then) =
      __$$_TelefoneInputWithKeyCopyWithImpl<$Res>;
  @override
  $Res call({TelefoneInput input, int key});
}

/// @nodoc
class __$$_TelefoneInputWithKeyCopyWithImpl<$Res>
    extends _$TelefoneInputWithKeyCopyWithImpl<$Res>
    implements _$$_TelefoneInputWithKeyCopyWith<$Res> {
  __$$_TelefoneInputWithKeyCopyWithImpl(_$_TelefoneInputWithKey _value,
      $Res Function(_$_TelefoneInputWithKey) _then)
      : super(_value, (v) => _then(v as _$_TelefoneInputWithKey));

  @override
  _$_TelefoneInputWithKey get _value => super._value as _$_TelefoneInputWithKey;

  @override
  $Res call({
    Object? input = freezed,
    Object? key = freezed,
  }) {
    return _then(_$_TelefoneInputWithKey(
      input: input == freezed
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as TelefoneInput,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TelefoneInputWithKey implements _TelefoneInputWithKey {
  const _$_TelefoneInputWithKey({required this.input, required this.key});

  @override
  final TelefoneInput input;
  @override
  final int key;

  @override
  String toString() {
    return 'TelefoneInputWithKey(input: $input, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TelefoneInputWithKey &&
            const DeepCollectionEquality().equals(other.input, input) &&
            const DeepCollectionEquality().equals(other.key, key));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(input),
      const DeepCollectionEquality().hash(key));

  @JsonKey(ignore: true)
  @override
  _$$_TelefoneInputWithKeyCopyWith<_$_TelefoneInputWithKey> get copyWith =>
      __$$_TelefoneInputWithKeyCopyWithImpl<_$_TelefoneInputWithKey>(
          this, _$identity);
}

abstract class _TelefoneInputWithKey implements TelefoneInputWithKey {
  const factory _TelefoneInputWithKey(
      {required final TelefoneInput input,
      required final int key}) = _$_TelefoneInputWithKey;

  @override
  TelefoneInput get input;
  @override
  int get key;
  @override
  @JsonKey(ignore: true)
  _$$_TelefoneInputWithKeyCopyWith<_$_TelefoneInputWithKey> get copyWith =>
      throw _privateConstructorUsedError;
}
