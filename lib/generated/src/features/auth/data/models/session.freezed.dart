// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../../src/features/auth/data/models/session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _AuthModel.fromJson(json);
}

/// @nodoc
mixin _$Session {
  Contato get contato => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res>;
  $Res call({Contato contato, String accessToken});

  $ContatoCopyWith<$Res> get contato;
}

/// @nodoc
class _$SessionCopyWithImpl<$Res> implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  final Session _value;
  // ignore: unused_field
  final $Res Function(Session) _then;

  @override
  $Res call({
    Object? contato = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      contato: contato == freezed
          ? _value.contato
          : contato // ignore: cast_nullable_to_non_nullable
              as Contato,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ContatoCopyWith<$Res> get contato {
    return $ContatoCopyWith<$Res>(_value.contato, (value) {
      return _then(_value.copyWith(contato: value));
    });
  }
}

/// @nodoc
abstract class _$$_AuthModelCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$_AuthModelCopyWith(
          _$_AuthModel value, $Res Function(_$_AuthModel) then) =
      __$$_AuthModelCopyWithImpl<$Res>;
  @override
  $Res call({Contato contato, String accessToken});

  @override
  $ContatoCopyWith<$Res> get contato;
}

/// @nodoc
class __$$_AuthModelCopyWithImpl<$Res> extends _$SessionCopyWithImpl<$Res>
    implements _$$_AuthModelCopyWith<$Res> {
  __$$_AuthModelCopyWithImpl(
      _$_AuthModel _value, $Res Function(_$_AuthModel) _then)
      : super(_value, (v) => _then(v as _$_AuthModel));

  @override
  _$_AuthModel get _value => super._value as _$_AuthModel;

  @override
  $Res call({
    Object? contato = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_$_AuthModel(
      contato: contato == freezed
          ? _value.contato
          : contato // ignore: cast_nullable_to_non_nullable
              as Contato,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthModel implements _AuthModel {
  const _$_AuthModel({required this.contato, required this.accessToken});

  factory _$_AuthModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuthModelFromJson(json);

  @override
  final Contato contato;
  @override
  final String accessToken;

  @override
  String toString() {
    return 'Session(contato: $contato, accessToken: $accessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthModel &&
            const DeepCollectionEquality().equals(other.contato, contato) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(contato),
      const DeepCollectionEquality().hash(accessToken));

  @JsonKey(ignore: true)
  @override
  _$$_AuthModelCopyWith<_$_AuthModel> get copyWith =>
      __$$_AuthModelCopyWithImpl<_$_AuthModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthModelToJson(
      this,
    );
  }
}

abstract class _AuthModel implements Session {
  const factory _AuthModel(
      {required final Contato contato,
      required final String accessToken}) = _$_AuthModel;

  factory _AuthModel.fromJson(Map<String, dynamic> json) =
      _$_AuthModel.fromJson;

  @override
  Contato get contato;
  @override
  String get accessToken;
  @override
  @JsonKey(ignore: true)
  _$$_AuthModelCopyWith<_$_AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}
