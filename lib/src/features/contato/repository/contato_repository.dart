import 'package:dio/dio.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/models/contato_model.dart';
import 'package:laboratorio_ferreira_mobile/src/features/network/models/api_response_model.dart';
import 'package:path/path.dart';

class ContatoRepository {
  final Dio _client;
  final _path = join(Config.apiUrl, 'contatos');

  ContatoRepository({required Dio client}) : _client = client;

  Future<ContatoModel?> getOne(String id) async {
    final resposta = await _client.get<ApiResponse<ContatoModel>>(
      join(_path, id),
    );
    return resposta.data?.dados;
  }

  Future<List<ContatoModel>?> getAll(
      {Map<String, dynamic>? queryParams}) async {
    final resposta = await _client.get<ApiResponseWithDataAsList<ContatoModel>>(
      _path,
      queryParameters: queryParams,
    );
    return resposta.data?.dados;
  }
}
