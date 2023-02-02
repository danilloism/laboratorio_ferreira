import 'package:laboratorio_ferreira_mobile/src/core/presentation/states/store.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/data/repositories/contato_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/store/contatos_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../generated/src/features/contato/application/services/contato_service.g.dart';

class ContatoService {
  const ContatoService({required this.repository, required this.store});

  final ContatoRepository repository;
  final Store<Contato> store;

  Future<Contato> create(Contato contato, {bool updateStore = true}) async {
    final createdContato = await repository.create(contato);

    if (updateStore) {
      store.add(createdContato);
    }

    return createdContato;
  }

  Future<Contato> update({
    Contato? oldValue,
    required Contato newValue,
    bool updateStore = true,
  }) async {
    assert((updateStore && oldValue != null) || !updateStore);
    final updatedContato = await repository.update(newValue);

    if (updateStore) {
      store.update(oldValue: oldValue!, newValue: updatedContato);
    }

    return updatedContato;
  }
}

@riverpod
ContatoService contatoService(ContatoServiceRef ref) {
  return ContatoService(
    repository: ref.watch(contatoRepositoryProvider),
    store: ref.watch(contatosStoreProvider.notifier),
  );
}
