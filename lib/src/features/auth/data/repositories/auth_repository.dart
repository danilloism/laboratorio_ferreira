import 'dart:async';

import 'package:dio/dio.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/models/api_response.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/models/repository_exception.dart';
import 'package:laboratorio_ferreira_mobile/src/core/services/i_http_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/session.dart';
import 'package:path/path.dart';

class AuthRepository {
  final IHttpService _httpService;
  final _path = join(Config.apiUrl, 'user');
  Session? _session;
  Session? get session => _session;
  set session(Session? value) {
    if (value?.accessToken != _httpService.authorizationToken) {
      _httpService.resetInterceptorsWithTokenOrNull(value?.accessToken);
    }

    _session = value;
  }

  AuthRepository({required IHttpService httpService})
      : _httpService = httpService;

  // resetHttpClientToken([String? token]) {
  //   _httpService.resetInterceptorsWithTokenOrNull(token);
  // }

  resetSession([Session? session]) {}

  Future<Session> login(Account account) async {
    late final Response resposta;

    try {
      resposta = await _httpService.post(
        join(_path, 'login'),
        data: account.toJson(),
      );

      final dto =
          ApiResponse<Session>.fromJson(resposta.data, Session.fromJson);
      if (dto.sucesso) {
        final session = dto.dados!;
        this.session = session;
        return session;
      }

      throw RepositoryException(erro: dto.erro, mensagem: dto.mensagem);
    } on DioError catch (e) {
      final dto =
          ApiResponse<Session?>.fromJson(e.response?.data, Session.fromJson);

      throw RepositoryException(
        statusCode: e.response?.statusCode,
        mensagem: dto.mensagem,
        erro: dto.erro,
      );
    } catch (e) {
      rethrow;
    }
  }
}