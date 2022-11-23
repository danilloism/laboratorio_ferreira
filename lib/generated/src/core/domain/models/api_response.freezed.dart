// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../../src/core/domain/models/api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResponse<T> _$ApiResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ApiResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiResponse<T> {
  bool get sucesso => throw _privateConstructorUsedError;
  T? get dados => throw _privateConstructorUsedError;
  String? get mensagem => throw _privateConstructorUsedError;
  dynamic get erro => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class _$_ApiResponse<T> implements _ApiResponse<T> {
  const _$_ApiResponse(
      {required this.sucesso, this.dados, this.mensagem, this.erro});

  factory _$_ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_ApiResponseFromJson(json, fromJsonT);

  @override
  final bool sucesso;
  @override
  final T? dados;
  @override
  final String? mensagem;
  @override
  final dynamic erro;
}

abstract class _ApiResponse<T> implements ApiResponse<T> {
  const factory _ApiResponse(
      {required final bool sucesso,
      final T? dados,
      final String? mensagem,
      final dynamic erro}) = _$_ApiResponse<T>;

  factory _ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_ApiResponse<T>.fromJson;

  @override
  bool get sucesso;
  @override
  T? get dados;
  @override
  String? get mensagem;
  @override
  dynamic get erro;
}
