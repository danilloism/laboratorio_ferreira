import 'dart:async';

import 'package:dio/dio.dart';
import 'package:laboratorio_ferreira_mobile/env.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/application.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/models.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../generated/src/features/auth/data/repositories/auth_repository.g.dart';

class AuthRepository {
  final IHttpService _httpService;
  final _path = join(Env.apiUrl, 'user');

  AuthRepository({
    required IHttpService httpService,
  }) : _httpService = httpService;

  Future<Session> login(Login login) async {
    try {
      final Response resposta = await _httpService.post(
        join(_path, 'login'),
        data: login.toJson(),
      );

      final dto =
          ApiResponse<Session>.fromJson(resposta.data, Session.fromJson);
      if (dto.sucesso) {
        return dto.dados!;
      }

      throw RepositoryException(
        object: resposta.data,
        whichRepository: AuthRepository,
      );
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        rethrow;
      }

      throw RepositoryException(
        object: {
          'data': e.response?.data,
          'statusCode': e.response?.statusCode,
        },
        whichRepository: AuthRepository,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<RefreshToken> refreshToken() async {
    try {
      final Response resposta = await _httpService.patch(
        join(_path, 'refresh'),
      );

      final dto = ApiResponse<RefreshToken>.fromJson(
          resposta.data, RefreshToken.fromJson);
      if (dto.sucesso) {
        final refreshToken = dto.dados!;

        return refreshToken;
      }

      throw RepositoryException(
        object: resposta.data,
        whichRepository: AuthRepository,
      );
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        rethrow;
      }

      throw RepositoryException(
        object: {
          'data': e.response?.data,
          'statusCode': e.response?.statusCode,
        },
        whichRepository: AuthRepository,
      );
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepository(httpService: ref.watch(httpServiceProvider));
