import 'package:dio/dio.dart';
import 'package:laboratorio_ferreira_mobile/env.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/application.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/pagination.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../generated/src/features/contato/data/repositories/contato_repository.g.dart';

class ContatoRepository {
  final IHttpService _httpService;
  final _path = join(Env.apiUrl, 'contatos');

  ContatoRepository({required IHttpService httpService})
      : _httpService = httpService;

  Future<Contato> getOne(String uid) async {
    try {
      final path = join(_path, uid);
      final Response resposta = await _httpService.get(path);

      final dto =
          ApiResponse<Contato>.fromJson(resposta.data, Contato.fromJson);

      if (dto.sucesso) {
        return dto.dados!;
      }

      throw RepositoryException(
        object: resposta.data,
        whichRepository: ContatoRepository,
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
        whichRepository: ContatoRepository,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Contato> update(Contato contato) async {
    try {
      final payload = contato.toJsonPutMethod();

      final Response resposta =
          await _httpService.put(join(_path, contato.uid), data: payload);

      final dto =
          ApiResponse<Contato>.fromJson(resposta.data, Contato.fromJson);
      if (dto.sucesso) {
        return dto.dados!;
      }

      throw RepositoryException(
        object: resposta.data,
        whichRepository: ContatoRepository,
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
        whichRepository: ContatoRepository,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Contato>> getMany(
      {Map<String, dynamic>? queryParams, Pagination? pagination}) async {
    try {
      queryParams ??= {};
      if (pagination != null) {
        queryParams['take'] = pagination.take;
        queryParams['skip'] = pagination.skip;
      }

      final Response resposta = await _httpService.get(
        _path,
        queryParams: queryParams.isEmpty ? null : queryParams,
      );
      final dto = ApiResponse<List<Contato>>.fromJson(
          resposta.data, Contato.fromJsonList);

      if (dto.sucesso) {
        return dto.dados!;
      }

      throw RepositoryException(
        object: resposta.data,
        whichRepository: ContatoRepository,
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
        whichRepository: ContatoRepository,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Contato> create(Contato contato) async {
    try {
      final Response resposta =
          await _httpService.post(_path, data: contato.toJsonPostMethod());

      final dto =
          ApiResponse<Contato>.fromJson(resposta.data, Contato.fromJson);

      if (dto.sucesso) {
        return dto.dados!;
      }

      throw RepositoryException(
        object: resposta.data,
        whichRepository: ContatoRepository,
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
        whichRepository: ContatoRepository,
      );
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
ContatoRepository contatoRepository(ContatoRepositoryRef ref) =>
    ContatoRepository(httpService: ref.watch(httpServiceProvider));

@riverpod
Future<Contato> getOneContato(GetOneContatoRef ref, String id) {
  return ref.watch(contatoRepositoryProvider).getOne(id);
}

@riverpod
Future<List<Contato>> getManyContatos(GetManyContatosRef ref,
    {Map<String, dynamic>? queryParams, Pagination? pagination}) {
  return ref
      .watch(contatoRepositoryProvider)
      .getMany(queryParams: queryParams, pagination: pagination);
}

@riverpod
Future<Contato> updateContato(UpdateContatoRef ref, Contato contato) {
  return ref.watch(contatoRepositoryProvider).update(contato);
}

@riverpod
Future<Contato> createContato(CreateContatoRef ref, Contato contato) {
  return ref.watch(contatoRepositoryProvider).create(contato);
}
