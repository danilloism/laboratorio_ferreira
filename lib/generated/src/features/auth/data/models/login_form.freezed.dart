// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../../src/features/auth/data/models/login_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginForm {
  EmailInput? get email => throw _privateConstructorUsedError;
  SenhaInput? get senha => throw _privateConstructorUsedError;
  FormzStatus? get status => throw _privateConstructorUsedError;
  Session? get session => throw _privateConstructorUsedError;
  String? get erro => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFormCopyWith<LoginForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormCopyWith<$Res> {
  factory $LoginFormCopyWith(LoginForm value, $Res Function(LoginForm) then) =
      _$LoginFormCopyWithImpl<$Res>;
  $Res call(
      {EmailInput? email,
      SenhaInput? senha,
      FormzStatus? status,
      Session? session,
      String? erro});

  $SessionCopyWith<$Res>? get session;
}

/// @nodoc
class _$LoginFormCopyWithImpl<$Res> implements $LoginFormCopyWith<$Res> {
  _$LoginFormCopyWithImpl(this._value, this._then);

  final LoginForm _value;
  // ignore: unused_field
  final $Res Function(LoginForm) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? senha = freezed,
    Object? status = freezed,
    Object? session = freezed,
    Object? erro = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailInput?,
      senha: senha == freezed
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as SenhaInput?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus?,
      session: session == freezed
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session?,
      erro: erro == freezed
          ? _value.erro
          : erro // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $SessionCopyWith<$Res>? get session {
    if (_value.session == null) {
      return null;
    }

    return $SessionCopyWith<$Res>(_value.session!, (value) {
      return _then(_value.copyWith(session: value));
    });
  }
}

/// @nodoc
abstract class _$$_LoginFormCopyWith<$Res> implements $LoginFormCopyWith<$Res> {
  factory _$$_LoginFormCopyWith(
          _$_LoginForm value, $Res Function(_$_LoginForm) then) =
      __$$_LoginFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailInput? email,
      SenhaInput? senha,
      FormzStatus? status,
      Session? session,
      String? erro});

  @override
  $SessionCopyWith<$Res>? get session;
}

/// @nodoc
class __$$_LoginFormCopyWithImpl<$Res> extends _$LoginFormCopyWithImpl<$Res>
    implements _$$_LoginFormCopyWith<$Res> {
  __$$_LoginFormCopyWithImpl(
      _$_LoginForm _value, $Res Function(_$_LoginForm) _then)
      : super(_value, (v) => _then(v as _$_LoginForm));

  @override
  _$_LoginForm get _value => super._value as _$_LoginForm;

  @override
  $Res call({
    Object? email = freezed,
    Object? senha = freezed,
    Object? status = freezed,
    Object? session = freezed,
    Object? erro = freezed,
  }) {
    return _then(_$_LoginForm(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailInput?,
      senha: senha == freezed
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as SenhaInput?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus?,
      session: session == freezed
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session?,
      erro: erro == freezed
          ? _value.erro
          : erro // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LoginForm implements _LoginForm {
  const _$_LoginForm(
      {this.email = const EmailInput.pure(),
      this.senha = const SenhaInput.pure(),
      this.status = FormzStatus.pure,
      this.session = null,
      this.erro = null});

  @override
  @JsonKey()
  final EmailInput? email;
  @override
  @JsonKey()
  final SenhaInput? senha;
  @override
  @JsonKey()
  final FormzStatus? status;
  @override
  @JsonKey()
  final Session? session;
  @override
  @JsonKey()
  final String? erro;

  @override
  String toString() {
    return 'LoginForm(email: $email, senha: $senha, status: $status, session: $session, erro: $erro)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginForm &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.senha, senha) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.session, session) &&
            const DeepCollectionEquality().equals(other.erro, erro));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(senha),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(session),
      const DeepCollectionEquality().hash(erro));

  @JsonKey(ignore: true)
  @override
  _$$_LoginFormCopyWith<_$_LoginForm> get copyWith =>
      __$$_LoginFormCopyWithImpl<_$_LoginForm>(this, _$identity);
}

abstract class _LoginForm implements LoginForm {
  const factory _LoginForm(
      {final EmailInput? email,
      final SenhaInput? senha,
      final FormzStatus? status,
      final Session? session,
      final String? erro}) = _$_LoginForm;

  @override
  EmailInput? get email;
  @override
  SenhaInput? get senha;
  @override
  FormzStatus? get status;
  @override
  Session? get session;
  @override
  String? get erro;
  @override
  @JsonKey(ignore: true)
  _$$_LoginFormCopyWith<_$_LoginForm> get copyWith =>
      throw _privateConstructorUsedError;
}
