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
mixin _$LocalStorageItem {
  dynamic get key => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalStorageItemCopyWith<LocalStorageItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalStorageItemCopyWith<$Res> {
  factory $LocalStorageItemCopyWith(
          LocalStorageItem value, $Res Function(LocalStorageItem) then) =
      _$LocalStorageItemCopyWithImpl<$Res>;
  $Res call({dynamic key, dynamic value});
}

/// @nodoc
class _$LocalStorageItemCopyWithImpl<$Res>
    implements $LocalStorageItemCopyWith<$Res> {
  _$LocalStorageItemCopyWithImpl(this._value, this._then);

  final LocalStorageItem _value;
  // ignore: unused_field
  final $Res Function(LocalStorageItem) _then;

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
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_LocalStorageItemCopyWith<$Res>
    implements $LocalStorageItemCopyWith<$Res> {
  factory _$$_LocalStorageItemCopyWith(
          _$_LocalStorageItem value, $Res Function(_$_LocalStorageItem) then) =
      __$$_LocalStorageItemCopyWithImpl<$Res>;
  @override
  $Res call({dynamic key, dynamic value});
}

/// @nodoc
class __$$_LocalStorageItemCopyWithImpl<$Res>
    extends _$LocalStorageItemCopyWithImpl<$Res>
    implements _$$_LocalStorageItemCopyWith<$Res> {
  __$$_LocalStorageItemCopyWithImpl(
      _$_LocalStorageItem _value, $Res Function(_$_LocalStorageItem) _then)
      : super(_value, (v) => _then(v as _$_LocalStorageItem));

  @override
  _$_LocalStorageItem get _value => super._value as _$_LocalStorageItem;

  @override
  $Res call({
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_LocalStorageItem(
      key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as dynamic,
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_LocalStorageItem implements _LocalStorageItem {
  _$_LocalStorageItem(this.key, this.value);

  @override
  final dynamic key;
  @override
  final dynamic value;

  @override
  String toString() {
    return 'LocalStorageItem(key: $key, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalStorageItem &&
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
  _$$_LocalStorageItemCopyWith<_$_LocalStorageItem> get copyWith =>
      __$$_LocalStorageItemCopyWithImpl<_$_LocalStorageItem>(this, _$identity);
}

abstract class _LocalStorageItem implements LocalStorageItem {
  factory _LocalStorageItem(final dynamic key, final dynamic value) =
      _$_LocalStorageItem;

  @override
  dynamic get key;
  @override
  dynamic get value;
  @override
  @JsonKey(ignore: true)
  _$$_LocalStorageItemCopyWith<_$_LocalStorageItem> get copyWith =>
      throw _privateConstructorUsedError;
}
