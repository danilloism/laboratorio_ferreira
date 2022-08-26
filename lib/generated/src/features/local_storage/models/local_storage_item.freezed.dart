// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../src/features/local_storage/models/local_storage_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalStorageItem<T> {
  dynamic get key => throw _privateConstructorUsedError;
  T get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalStorageItemCopyWith<T, LocalStorageItem<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalStorageItemCopyWith<T, $Res> {
  factory $LocalStorageItemCopyWith(
          LocalStorageItem<T> value, $Res Function(LocalStorageItem<T>) then) =
      _$LocalStorageItemCopyWithImpl<T, $Res>;
  $Res call({dynamic key, T value});
}

/// @nodoc
class _$LocalStorageItemCopyWithImpl<T, $Res>
    implements $LocalStorageItemCopyWith<T, $Res> {
  _$LocalStorageItemCopyWithImpl(this._value, this._then);

  final LocalStorageItem<T> _value;
  // ignore: unused_field
  final $Res Function(LocalStorageItem<T>) _then;

  @override
  $Res call({
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as dynamic,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
abstract class _$$_LocalStorageItemCopyWith<T, $Res>
    implements $LocalStorageItemCopyWith<T, $Res> {
  factory _$$_LocalStorageItemCopyWith(_$_LocalStorageItem<T> value,
          $Res Function(_$_LocalStorageItem<T>) then) =
      __$$_LocalStorageItemCopyWithImpl<T, $Res>;
  @override
  $Res call({dynamic key, T value});
}

/// @nodoc
class __$$_LocalStorageItemCopyWithImpl<T, $Res>
    extends _$LocalStorageItemCopyWithImpl<T, $Res>
    implements _$$_LocalStorageItemCopyWith<T, $Res> {
  __$$_LocalStorageItemCopyWithImpl(_$_LocalStorageItem<T> _value,
      $Res Function(_$_LocalStorageItem<T>) _then)
      : super(_value, (v) => _then(v as _$_LocalStorageItem<T>));

  @override
  _$_LocalStorageItem<T> get _value => super._value as _$_LocalStorageItem<T>;

  @override
  $Res call({
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_LocalStorageItem<T>(
      key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as dynamic,
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_LocalStorageItem<T> implements _LocalStorageItem<T> {
  _$_LocalStorageItem(this.key, this.value);

  @override
  final dynamic key;
  @override
  final T value;

  @override
  String toString() {
    return 'LocalStorageItem<$T>(key: $key, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalStorageItem<T> &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_LocalStorageItemCopyWith<T, _$_LocalStorageItem<T>> get copyWith =>
      __$$_LocalStorageItemCopyWithImpl<T, _$_LocalStorageItem<T>>(
          this, _$identity);
}

abstract class _LocalStorageItem<T> implements LocalStorageItem<T> {
  factory _LocalStorageItem(final dynamic key, final T value) =
      _$_LocalStorageItem<T>;

  @override
  dynamic get key;
  @override
  T get value;
  @override
  @JsonKey(ignore: true)
  _$$_LocalStorageItemCopyWith<T, _$_LocalStorageItem<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
