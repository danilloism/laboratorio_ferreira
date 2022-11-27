import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/environment.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/application.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';
import 'package:path/path.dart';

class AuthRepository {
  final IHttpService _httpService;
  final Ref _ref;
  final _path = join(Environment.apiUrl, 'user');

  AuthRepository(Ref ref)
      : _httpService = ref.watch(httpServiceProvider),
        _ref = ref;

  Future<Session> login(Account account) async {
    Session? session;

    try {
      final Response resposta = await _httpService.post(
        join(_path, 'login'),
        data: account.toJson(),
      );

      final dto =
          ApiResponse<Session>.fromJson(resposta.data, Session.fromJson);
      if (dto.sucesso) {
        session = dto.dados!;
        return session;
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
    } finally {
      if (session != null) {
        _ref.read(settingsNotifierProvider.notifier).changeSession(session);
      }
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

  Future<void> logout() async {
    return await _ref.read(settingsNotifierProvider.notifier).changeSession();
  }
}

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(ref));
