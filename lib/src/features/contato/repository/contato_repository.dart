import 'package:dio/dio.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/models/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/network/models/api_response_model.dart';
import 'package:path/path.dart';

class ContatoRepository {
  final Dio _client;
  final _path = join(Config.apiUrl, 'contatos');

  ContatoRepository({required Dio client}) : _client = client;

  Future<ApiResponse<Contato?>> getOne(String uid) async {
    late final Response resposta;

    try {
      resposta = await _client.get(join(_path, uid));

      return ApiResponse<Contato>.fromJson(resposta.data, Contato.fromJson);
    } on DioError catch (e) {
      return ApiResponse<Contato?>.fromJson(e.response?.data, Contato.fromJson);
    }
  }

  Future<ApiResponse<Contato?>> update(Contato contato) async {
    if (contato.uid == null) {
      throw Exception('Uid do contato não deve ser nulo.');
    }

    late final Response resposta;

    try {
      final payload = contato.toJson();
      payload.remove('uid');
      payload.remove('account');
      payload.remove('telefones');
      payload.remove('criadoEm');
      payload.remove('atualizadoEm');

      resposta = await _client.put(join(_path, contato.uid), data: payload);

      return ApiResponse<Contato>.fromJson(resposta.data, Contato.fromJson);
    } on DioError catch (e) {
      return ApiResponse<Contato?>.fromJson(e.response?.data, Contato.fromJson);
    }
  }

  // Future<List<ContatoModel>?> getAll(
  //     {Map<String, dynamic>? queryParams}) async {
  //   final resposta = await _client.get<ApiResponse<ContatoModel>>(
  //     _path,
  //     queryParameters: queryParams,
  //   );
  //   return resposta.data?.dados;
  // }
}
