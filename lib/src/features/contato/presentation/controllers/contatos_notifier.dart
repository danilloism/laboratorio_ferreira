import 'package:laboratorio_ferreira_mobile/src/features/contato/data/repositories/contato_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../generated/src/features/contato/presentation/controllers/contatos_notifier.g.dart';

@riverpod
class ContatoController extends _$ContatoController {
  @override
  AsyncValue<List<Contato>> build() {
    return const AsyncValue.loading();
  }

  Future<void> loadContatos() async {
    _setLoading();
    _executeGetMany();
  }

  Future<void> createContato(Contato contato) async {
    await ref.read(contatoRepositoryProvider).create(contato);
    loadContatos();
  }

  void _setLoading() {
    state = const AsyncLoading();
  }

  Future _executeGetMany() async {
    state = await AsyncValue.guard(
        () => ref.read(contatoRepositoryProvider).getMany());
  }
}
