import 'package:dio/dio.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/auth_response.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/models/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/network/models/api_response_model.dart';
import 'package:path/path.dart';

class AuthRepository {
  final Dio _client;
  final _path = join(Config.apiUrl, 'user');

  AuthRepository({required Dio client}) : _client = client;

  Future<ApiResponse<AuthResponse?>> login(Account account) async {
    late final Response resposta;

    try {
      resposta = await _client.post(
        join(_path, 'login'),
        data: account.toJson(),
      );

      return ApiResponse<AuthResponse>.fromJson(
          resposta.data, AuthResponse.fromJson);
    } on DioError catch (e) {
      return ApiResponse<AuthResponse?>.fromJson(
          e.response?.data, AuthResponse.fromJson);
    }
  }

  Future<ApiResponse<Contato?>> getMyContato() async {
    late final Response resposta;

    try {
      resposta = await _client.get(join(_path, 'me'));

      return ApiResponse<Contato>.fromJson(resposta.data, Contato.fromJson);
    } on DioError catch (e) {
      return ApiResponse<Contato?>.fromJson(e.response?.data, Contato.fromJson);
    }
  }
  // Future<Token?> refresh(Account account) async {
  //   final res = await _client.patch(join(_path, 'refresh'));
  //
  //   return res.data?.dados;
  // }
}
