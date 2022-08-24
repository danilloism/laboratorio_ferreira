import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/repository/contato_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/network/providers/dio_provider.dart';

final contatoRepositoryProvider =
    Provider((ref) => ContatoRepository(client: ref.watch(dioProvider)));
