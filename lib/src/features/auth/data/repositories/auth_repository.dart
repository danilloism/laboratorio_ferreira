import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/config/constants.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/application.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/models.dart';
import 'package:path/path.dart';

class AuthRepository {
  late final IHttpService _httpService;
  final _path = join(Constants.apiUrl, 'user');

  late String? _authToken;

  AuthRepository({required IHttpService httpService})
      : _httpService = httpService {
    _authToken = _httpService.authorizationToken;
  }

  Future<Session> login(Account account) async {
    try {
      final Response resposta = await _httpService.post(
        join(_path, 'login'),
        data: account.toJson(),
      );

      final dto =
          ApiResponse<Session>.fromJson(resposta.data, Session.fromJson);
      if (dto.sucesso) {
        final session = dto.dados!;
        return session;
      }

      throw RepositoryException(
        object: resposta.data,
        whichRepository: AuthRepository,
      );
    } on DioError catch (e) {
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

final authRepositoryProvider = Provider<AuthRepository>(
    (ref) => AuthRepository(httpService: ref.watch(httpServiceProvider)));
