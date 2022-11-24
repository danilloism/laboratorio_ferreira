import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/data/repositories/contato_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';

class ContatoNotifier extends StateNotifier<AsyncValue<List<Contato>>> {
  ContatoNotifier(this._repo) : super(const AsyncValue.loading());

  final ContatoRepository _repo;

  Future loadContatos() async {
    _setLoading();
    _executeGetMany();
  }

  Future createContato(Contato contato) async {
    await _repo.create(contato);
    loadContatos();
  }

  void _setLoading() {
    state = const AsyncLoading();
  }

  Future _executeGetMany() async {
    state = await AsyncValue.guard(() => _repo.getMany());
  }
}

final contatoNotifierProvider =
    StateNotifierProvider<ContatoNotifier, AsyncValue<List<Contato>>>(
  (ref) => ContatoNotifier(ref.watch(contatoRepositoryProvider)),
);
