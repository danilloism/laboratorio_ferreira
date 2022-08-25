import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/enums/roles_enum.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/models/contato.dart';

class EditorContatoNotifier extends StateNotifier<Contato> {
  EditorContatoNotifier(super.contato);

  void setOrReset(Contato contato) => state = contato;

  void addTelefone(String telefone) {
    final telefones = state.telefones.toSet();
    telefones.add(telefone);

    if (telefones.length == state.telefones.length) return;

    state = state.copyWith(telefones: telefones.toList());
  }

  void removeTelefone(String telefone) {
    final telefones = state.telefones.toSet();
    telefones.remove(telefone);

    if (telefones.length == state.telefones.length) return;

    state = state.copyWith(telefones: telefones.toList());
  }

  void atualizarNome(String nome) {
    if (nome == state.nome) return;

    state = state.copyWith(nome: nome);
  }

  void addCategoria(RolesEnum categoria) {
    final categorias = state.categorias.toSet();
    categorias.add(categoria);

    if (categorias.length == state.categorias.length) return;

    state = state.copyWith(categorias: categorias.toList());
  }

  void removeCategoria(RolesEnum categoria) {
    final categorias = state.categorias.toSet();
    categorias.remove(categoria);

    if (categorias.length == state.categorias.length) return;

    state = state.copyWith(categorias: categorias.toList());
  }
}
