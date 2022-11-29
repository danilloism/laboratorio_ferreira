// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../src/core/presentation/states/pagination_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaginationState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> items) data,
    required TResult Function() loading,
    required TResult Function(Object? e, StackTrace? stackTrace) error,
    required TResult Function(List<T> items) onGoingLoading,
    required TResult Function(List<T> items, Object? e, StackTrace? stackTrace)
        onGoingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> items)? data,
    TResult? Function()? loading,
    TResult? Function(Object? e, StackTrace? stackTrace)? error,
    TResult? Function(List<T> items)? onGoingLoading,
    TResult? Function(List<T> items, Object? e, StackTrace? stackTrace)?
        onGoingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> items)? data,
    TResult Function()? loading,
    TResult Function(Object? e, StackTrace? stackTrace)? error,
    TResult Function(List<T> items)? onGoingLoading,
    TResult Function(List<T> items, Object? e, StackTrace? stackTrace)?
        onGoingError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaginationData<T> value) data,
    required TResult Function(PaginationLoading<T> value) loading,
    required TResult Function(PaginationError<T> value) error,
    required TResult Function(PaginationOnGoingLoading<T> value) onGoingLoading,
    required TResult Function(PaginationOnGoingError<T> value) onGoingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaginationData<T> value)? data,
    TResult? Function(PaginationLoading<T> value)? loading,
    TResult? Function(PaginationError<T> value)? error,
    TResult? Function(PaginationOnGoingLoading<T> value)? onGoingLoading,
    TResult? Function(PaginationOnGoingError<T> value)? onGoingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaginationData<T> value)? data,
    TResult Function(PaginationLoading<T> value)? loading,
    TResult Function(PaginationError<T> value)? error,
    TResult Function(PaginationOnGoingLoading<T> value)? onGoingLoading,
    TResult Function(PaginationOnGoingError<T> value)? onGoingError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationStateCopyWith<T, $Res> {
  factory $PaginationStateCopyWith(
          PaginationState<T> value, $Res Function(PaginationState<T>) then) =
      _$PaginationStateCopyWithImpl<T, $Res, PaginationState<T>>;
}

/// @nodoc
class _$PaginationStateCopyWithImpl<T, $Res, $Val extends PaginationState<T>>
    implements $PaginationStateCopyWith<T, $Res> {
  _$PaginationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PaginationDataCopyWith<T, $Res> {
  factory _$$PaginationDataCopyWith(
          _$PaginationData<T> value, $Res Function(_$PaginationData<T>) then) =
      __$$PaginationDataCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> items});
}

/// @nodoc
class __$$PaginationDataCopyWithImpl<T, $Res>
    extends _$PaginationStateCopyWithImpl<T, $Res, _$PaginationData<T>>
    implements _$$PaginationDataCopyWith<T, $Res> {
  __$$PaginationDataCopyWithImpl(
      _$PaginationData<T> _value, $Res Function(_$PaginationData<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$PaginationData<T>(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$PaginationData<T> implements PaginationData<T> {
  const _$PaginationData(final List<T> items) : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PaginationState<$T>.data(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationData<T> &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationDataCopyWith<T, _$PaginationData<T>> get copyWith =>
      __$$PaginationDataCopyWithImpl<T, _$PaginationData<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> items) data,
    required TResult Function() loading,
    required TResult Function(Object? e, StackTrace? stackTrace) error,
    required TResult Function(List<T> items) onGoingLoading,
    required TResult Function(List<T> items, Object? e, StackTrace? stackTrace)
        onGoingError,
  }) {
    return data(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> items)? data,
    TResult? Function()? loading,
    TResult? Function(Object? e, StackTrace? stackTrace)? error,
    TResult? Function(List<T> items)? onGoingLoading,
    TResult? Function(List<T> items, Object? e, StackTrace? stackTrace)?
        onGoingError,
  }) {
    return data?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> items)? data,
    TResult Function()? loading,
    TResult Function(Object? e, StackTrace? stackTrace)? error,
    TResult Function(List<T> items)? onGoingLoading,
    TResult Function(List<T> items, Object? e, StackTrace? stackTrace)?
        onGoingError,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaginationData<T> value) data,
    required TResult Function(PaginationLoading<T> value) loading,
    required TResult Function(PaginationError<T> value) error,
    required TResult Function(PaginationOnGoingLoading<T> value) onGoingLoading,
    required TResult Function(PaginationOnGoingError<T> value) onGoingError,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaginationData<T> value)? data,
    TResult? Function(PaginationLoading<T> value)? loading,
    TResult? Function(PaginationError<T> value)? error,
    TResult? Function(PaginationOnGoingLoading<T> value)? onGoingLoading,
    TResult? Function(PaginationOnGoingError<T> value)? onGoingError,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaginationData<T> value)? data,
    TResult Function(PaginationLoading<T> value)? loading,
    TResult Function(PaginationError<T> value)? error,
    TResult Function(PaginationOnGoingLoading<T> value)? onGoingLoading,
    TResult Function(PaginationOnGoingError<T> value)? onGoingError,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class PaginationData<T> implements PaginationState<T> {
  const factory PaginationData(final List<T> items) = _$PaginationData<T>;

  List<T> get items;
  @JsonKey(ignore: true)
  _$$PaginationDataCopyWith<T, _$PaginationData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaginationLoadingCopyWith<T, $Res> {
  factory _$$PaginationLoadingCopyWith(_$PaginationLoading<T> value,
          $Res Function(_$PaginationLoading<T>) then) =
      __$$PaginationLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$PaginationLoadingCopyWithImpl<T, $Res>
    extends _$PaginationStateCopyWithImpl<T, $Res, _$PaginationLoading<T>>
    implements _$$PaginationLoadingCopyWith<T, $Res> {
  __$$PaginationLoadingCopyWithImpl(_$PaginationLoading<T> _value,
      $Res Function(_$PaginationLoading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PaginationLoading<T> implements PaginationLoading<T> {
  const _$PaginationLoading();

  @override
  String toString() {
    return 'PaginationState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PaginationLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> items) data,
    required TResult Function() loading,
    required TResult Function(Object? e, StackTrace? stackTrace) error,
    required TResult Function(List<T> items) onGoingLoading,
    required TResult Function(List<T> items, Object? e, StackTrace? stackTrace)
        onGoingError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> items)? data,
    TResult? Function()? loading,
    TResult? Function(Object? e, StackTrace? stackTrace)? error,
    TResult? Function(List<T> items)? onGoingLoading,
    TResult? Function(List<T> items, Object? e, StackTrace? stackTrace)?
        onGoingError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> items)? data,
    TResult Function()? loading,
    TResult Function(Object? e, StackTrace? stackTrace)? error,
    TResult Function(List<T> items)? onGoingLoading,
    TResult Function(List<T> items, Object? e, StackTrace? stackTrace)?
        onGoingError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaginationData<T> value) data,
    required TResult Function(PaginationLoading<T> value) loading,
    required TResult Function(PaginationError<T> value) error,
    required TResult Function(PaginationOnGoingLoading<T> value) onGoingLoading,
    required TResult Function(PaginationOnGoingError<T> value) onGoingError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaginationData<T> value)? data,
    TResult? Function(PaginationLoading<T> value)? loading,
    TResult? Function(PaginationError<T> value)? error,
    TResult? Function(PaginationOnGoingLoading<T> value)? onGoingLoading,
    TResult? Function(PaginationOnGoingError<T> value)? onGoingError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaginationData<T> value)? data,
    TResult Function(PaginationLoading<T> value)? loading,
    TResult Function(PaginationError<T> value)? error,
    TResult Function(PaginationOnGoingLoading<T> value)? onGoingLoading,
    TResult Function(PaginationOnGoingError<T> value)? onGoingError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PaginationLoading<T> implements PaginationState<T> {
  const factory PaginationLoading() = _$PaginationLoading<T>;
}

/// @nodoc
abstract class _$$PaginationErrorCopyWith<T, $Res> {
  factory _$$PaginationErrorCopyWith(_$PaginationError<T> value,
          $Res Function(_$PaginationError<T>) then) =
      __$$PaginationErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Object? e, StackTrace? stackTrace});
}

/// @nodoc
class __$$PaginationErrorCopyWithImpl<T, $Res>
    extends _$PaginationStateCopyWithImpl<T, $Res, _$PaginationError<T>>
    implements _$$PaginationErrorCopyWith<T, $Res> {
  __$$PaginationErrorCopyWithImpl(
      _$PaginationError<T> _value, $Res Function(_$PaginationError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$PaginationError<T>(
      freezed == e ? _value.e : e,
      freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$PaginationError<T> implements PaginationError<T> {
  const _$PaginationError(this.e, [this.stackTrace]);

  @override
  final Object? e;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'PaginationState<$T>.error(e: $e, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationError<T> &&
            const DeepCollectionEquality().equals(other.e, e) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(e), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationErrorCopyWith<T, _$PaginationError<T>> get copyWith =>
      __$$PaginationErrorCopyWithImpl<T, _$PaginationError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> items) data,
    required TResult Function() loading,
    required TResult Function(Object? e, StackTrace? stackTrace) error,
    required TResult Function(List<T> items) onGoingLoading,
    required TResult Function(List<T> items, Object? e, StackTrace? stackTrace)
        onGoingError,
  }) {
    return error(e, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> items)? data,
    TResult? Function()? loading,
    TResult? Function(Object? e, StackTrace? stackTrace)? error,
    TResult? Function(List<T> items)? onGoingLoading,
    TResult? Function(List<T> items, Object? e, StackTrace? stackTrace)?
        onGoingError,
  }) {
    return error?.call(e, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> items)? data,
    TResult Function()? loading,
    TResult Function(Object? e, StackTrace? stackTrace)? error,
    TResult Function(List<T> items)? onGoingLoading,
    TResult Function(List<T> items, Object? e, StackTrace? stackTrace)?
        onGoingError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(e, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaginationData<T> value) data,
    required TResult Function(PaginationLoading<T> value) loading,
    required TResult Function(PaginationError<T> value) error,
    required TResult Function(PaginationOnGoingLoading<T> value) onGoingLoading,
    required TResult Function(PaginationOnGoingError<T> value) onGoingError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaginationData<T> value)? data,
    TResult? Function(PaginationLoading<T> value)? loading,
    TResult? Function(PaginationError<T> value)? error,
    TResult? Function(PaginationOnGoingLoading<T> value)? onGoingLoading,
    TResult? Function(PaginationOnGoingError<T> value)? onGoingError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaginationData<T> value)? data,
    TResult Function(PaginationLoading<T> value)? loading,
    TResult Function(PaginationError<T> value)? error,
    TResult Function(PaginationOnGoingLoading<T> value)? onGoingLoading,
    TResult Function(PaginationOnGoingError<T> value)? onGoingError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PaginationError<T> implements PaginationState<T> {
  const factory PaginationError(final Object? e,
      [final StackTrace? stackTrace]) = _$PaginationError<T>;

  Object? get e;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  _$$PaginationErrorCopyWith<T, _$PaginationError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaginationOnGoingLoadingCopyWith<T, $Res> {
  factory _$$PaginationOnGoingLoadingCopyWith(
          _$PaginationOnGoingLoading<T> value,
          $Res Function(_$PaginationOnGoingLoading<T>) then) =
      __$$PaginationOnGoingLoadingCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> items});
}

/// @nodoc
class __$$PaginationOnGoingLoadingCopyWithImpl<T, $Res>
    extends _$PaginationStateCopyWithImpl<T, $Res,
        _$PaginationOnGoingLoading<T>>
    implements _$$PaginationOnGoingLoadingCopyWith<T, $Res> {
  __$$PaginationOnGoingLoadingCopyWithImpl(_$PaginationOnGoingLoading<T> _value,
      $Res Function(_$PaginationOnGoingLoading<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$PaginationOnGoingLoading<T>(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$PaginationOnGoingLoading<T> implements PaginationOnGoingLoading<T> {
  const _$PaginationOnGoingLoading(final List<T> items) : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PaginationState<$T>.onGoingLoading(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationOnGoingLoading<T> &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationOnGoingLoadingCopyWith<T, _$PaginationOnGoingLoading<T>>
      get copyWith => __$$PaginationOnGoingLoadingCopyWithImpl<T,
          _$PaginationOnGoingLoading<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> items) data,
    required TResult Function() loading,
    required TResult Function(Object? e, StackTrace? stackTrace) error,
    required TResult Function(List<T> items) onGoingLoading,
    required TResult Function(List<T> items, Object? e, StackTrace? stackTrace)
        onGoingError,
  }) {
    return onGoingLoading(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> items)? data,
    TResult? Function()? loading,
    TResult? Function(Object? e, StackTrace? stackTrace)? error,
    TResult? Function(List<T> items)? onGoingLoading,
    TResult? Function(List<T> items, Object? e, StackTrace? stackTrace)?
        onGoingError,
  }) {
    return onGoingLoading?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> items)? data,
    TResult Function()? loading,
    TResult Function(Object? e, StackTrace? stackTrace)? error,
    TResult Function(List<T> items)? onGoingLoading,
    TResult Function(List<T> items, Object? e, StackTrace? stackTrace)?
        onGoingError,
    required TResult orElse(),
  }) {
    if (onGoingLoading != null) {
      return onGoingLoading(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaginationData<T> value) data,
    required TResult Function(PaginationLoading<T> value) loading,
    required TResult Function(PaginationError<T> value) error,
    required TResult Function(PaginationOnGoingLoading<T> value) onGoingLoading,
    required TResult Function(PaginationOnGoingError<T> value) onGoingError,
  }) {
    return onGoingLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaginationData<T> value)? data,
    TResult? Function(PaginationLoading<T> value)? loading,
    TResult? Function(PaginationError<T> value)? error,
    TResult? Function(PaginationOnGoingLoading<T> value)? onGoingLoading,
    TResult? Function(PaginationOnGoingError<T> value)? onGoingError,
  }) {
    return onGoingLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaginationData<T> value)? data,
    TResult Function(PaginationLoading<T> value)? loading,
    TResult Function(PaginationError<T> value)? error,
    TResult Function(PaginationOnGoingLoading<T> value)? onGoingLoading,
    TResult Function(PaginationOnGoingError<T> value)? onGoingError,
    required TResult orElse(),
  }) {
    if (onGoingLoading != null) {
      return onGoingLoading(this);
    }
    return orElse();
  }
}

abstract class PaginationOnGoingLoading<T> implements PaginationState<T> {
  const factory PaginationOnGoingLoading(final List<T> items) =
      _$PaginationOnGoingLoading<T>;

  List<T> get items;
  @JsonKey(ignore: true)
  _$$PaginationOnGoingLoadingCopyWith<T, _$PaginationOnGoingLoading<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaginationOnGoingErrorCopyWith<T, $Res> {
  factory _$$PaginationOnGoingErrorCopyWith(_$PaginationOnGoingError<T> value,
          $Res Function(_$PaginationOnGoingError<T>) then) =
      __$$PaginationOnGoingErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> items, Object? e, StackTrace? stackTrace});
}

/// @nodoc
class __$$PaginationOnGoingErrorCopyWithImpl<T, $Res>
    extends _$PaginationStateCopyWithImpl<T, $Res, _$PaginationOnGoingError<T>>
    implements _$$PaginationOnGoingErrorCopyWith<T, $Res> {
  __$$PaginationOnGoingErrorCopyWithImpl(_$PaginationOnGoingError<T> _value,
      $Res Function(_$PaginationOnGoingError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? e = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$PaginationOnGoingError<T>(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      freezed == e ? _value.e : e,
      freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$PaginationOnGoingError<T> implements PaginationOnGoingError<T> {
  const _$PaginationOnGoingError(final List<T> items, this.e, [this.stackTrace])
      : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final Object? e;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'PaginationState<$T>.onGoingError(items: $items, e: $e, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationOnGoingError<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other.e, e) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(e),
      stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationOnGoingErrorCopyWith<T, _$PaginationOnGoingError<T>>
      get copyWith => __$$PaginationOnGoingErrorCopyWithImpl<T,
          _$PaginationOnGoingError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> items) data,
    required TResult Function() loading,
    required TResult Function(Object? e, StackTrace? stackTrace) error,
    required TResult Function(List<T> items) onGoingLoading,
    required TResult Function(List<T> items, Object? e, StackTrace? stackTrace)
        onGoingError,
  }) {
    return onGoingError(items, e, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> items)? data,
    TResult? Function()? loading,
    TResult? Function(Object? e, StackTrace? stackTrace)? error,
    TResult? Function(List<T> items)? onGoingLoading,
    TResult? Function(List<T> items, Object? e, StackTrace? stackTrace)?
        onGoingError,
  }) {
    return onGoingError?.call(items, e, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> items)? data,
    TResult Function()? loading,
    TResult Function(Object? e, StackTrace? stackTrace)? error,
    TResult Function(List<T> items)? onGoingLoading,
    TResult Function(List<T> items, Object? e, StackTrace? stackTrace)?
        onGoingError,
    required TResult orElse(),
  }) {
    if (onGoingError != null) {
      return onGoingError(items, e, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaginationData<T> value) data,
    required TResult Function(PaginationLoading<T> value) loading,
    required TResult Function(PaginationError<T> value) error,
    required TResult Function(PaginationOnGoingLoading<T> value) onGoingLoading,
    required TResult Function(PaginationOnGoingError<T> value) onGoingError,
  }) {
    return onGoingError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaginationData<T> value)? data,
    TResult? Function(PaginationLoading<T> value)? loading,
    TResult? Function(PaginationError<T> value)? error,
    TResult? Function(PaginationOnGoingLoading<T> value)? onGoingLoading,
    TResult? Function(PaginationOnGoingError<T> value)? onGoingError,
  }) {
    return onGoingError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaginationData<T> value)? data,
    TResult Function(PaginationLoading<T> value)? loading,
    TResult Function(PaginationError<T> value)? error,
    TResult Function(PaginationOnGoingLoading<T> value)? onGoingLoading,
    TResult Function(PaginationOnGoingError<T> value)? onGoingError,
    required TResult orElse(),
  }) {
    if (onGoingError != null) {
      return onGoingError(this);
    }
    return orElse();
  }
}

abstract class PaginationOnGoingError<T> implements PaginationState<T> {
  const factory PaginationOnGoingError(final List<T> items, final Object? e,
      [final StackTrace? stackTrace]) = _$PaginationOnGoingError<T>;

  List<T> get items;
  Object? get e;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  _$$PaginationOnGoingErrorCopyWith<T, _$PaginationOnGoingError<T>>
      get copyWith => throw _privateConstructorUsedError;
}
