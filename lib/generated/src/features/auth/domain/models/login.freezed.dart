// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../../src/features/auth/domain/models/login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Login {
  EmailInput get email => throw _privateConstructorUsedError;
  SenhaInput get senha => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  String? get errors => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginCopyWith<Login> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginCopyWith<$Res> {
  factory $LoginCopyWith(Login value, $Res Function(Login) then) =
      _$LoginCopyWithImpl<$Res>;
  $Res call(
      {EmailInput email, SenhaInput senha, FormzStatus status, String? errors});
}

/// @nodoc
class _$LoginCopyWithImpl<$Res> implements $LoginCopyWith<$Res> {
  _$LoginCopyWithImpl(this._value, this._then);

  final Login _value;
  // ignore: unused_field
  final $Res Function(Login) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? senha = freezed,
    Object? status = freezed,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailInput,
      senha: senha == freezed
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as SenhaInput,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginCopyWith<$Res> implements $LoginCopyWith<$Res> {
  factory _$$_LoginCopyWith(_$_Login value, $Res Function(_$_Login) then) =
      __$$_LoginCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailInput email, SenhaInput senha, FormzStatus status, String? errors});
}

/// @nodoc
class __$$_LoginCopyWithImpl<$Res> extends _$LoginCopyWithImpl<$Res>
    implements _$$_LoginCopyWith<$Res> {
  __$$_LoginCopyWithImpl(_$_Login _value, $Res Function(_$_Login) _then)
      : super(_value, (v) => _then(v as _$_Login));

  @override
  _$_Login get _value => super._value as _$_Login;

  @override
  $Res call({
    Object? email = freezed,
    Object? senha = freezed,
    Object? status = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$_Login(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailInput,
      senha: senha == freezed
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as SenhaInput,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Login implements _Login {
  const _$_Login(
      {this.email = const EmailInput.pure(),
      this.senha = const SenhaInput.pure(),
      this.status = FormzStatus.pure,
      this.errors});

  @override
  @JsonKey()
  final EmailInput email;
  @override
  @JsonKey()
  final SenhaInput senha;
  @override
  @JsonKey()
  final FormzStatus status;
  @override
  final String? errors;

  @override
  String toString() {
    return 'Login(email: $email, senha: $senha, status: $status, errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Login &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.senha, senha) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(senha),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(errors));

  @JsonKey(ignore: true)
  @override
  _$$_LoginCopyWith<_$_Login> get copyWith =>
      __$$_LoginCopyWithImpl<_$_Login>(this, _$identity);
}

abstract class _Login implements Login {
  const factory _Login(
      {final EmailInput email,
      final SenhaInput senha,
      final FormzStatus status,
      final String? errors}) = _$_Login;

  @override
  EmailInput get email;
  @override
  SenhaInput get senha;
  @override
  FormzStatus get status;
  @override
  String? get errors;
  @override
  @JsonKey(ignore: true)
  _$$_LoginCopyWith<_$_Login> get copyWith =>
      throw _privateConstructorUsedError;
}
