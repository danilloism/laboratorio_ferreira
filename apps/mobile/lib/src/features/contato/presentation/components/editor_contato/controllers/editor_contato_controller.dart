import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/enums/roles.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/helpers/formatter.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';

class EditorContatoController extends StateNotifier<Contato> {
  EditorContatoController(super.state);

  void nomeTeveAlteracao(String value) {
    state = state.copyWith(nome: value);
  }

  void adicionarTelefone(String telefone) {
    telefone = Formatter.unmaskPhone(telefone);
    state = state.copyWith(telefones: {...state.telefones}..add(telefone));
  }

  void alterarTelefone(
      {required String currentValue, required String newValue}) {
    newValue = Formatter.unmaskPhone(newValue);
    if (currentValue == newValue) return;

    final telefones = state.telefones.toList(growable: false);
    final index = telefones.indexOf(currentValue);
    telefones[index] = newValue;
    state = state.copyWith(telefones: telefones.toSet());
  }

  void removerTelefone(String telefone) {
    telefone = Formatter.unmaskPhone(telefone);
    final telefones = {...state.telefones}..remove(telefone);
    state = state.copyWith(telefones: telefones);
  }

  void removerCategoria(Roles categoria) {
    final categorias = {...state.categorias}..remove(categoria);
    state = state.copyWith(categorias: categorias);
  }

  void adicionarCategorias(Iterable<Roles> categorias) {
    final categoriasAtualizado = {...state.categorias}..addAll(categorias);
    state = state.copyWith(categorias: categoriasAtualizado);
  }

  void emailTeveAlteracao(String value) {
    if (value.trim().isEmpty && (state.account?.senha ?? '').isEmpty) {
      removerAccount();
    }

    if (state.account == null) {
      state = state.copyWith(account: Account(email: value));
      return;
    }

    state = state.copyWith.account!(email: value);
  }

  void senhaTeveAlteracao(String value) {
    if (value.trim().isEmpty && (state.account?.email ?? '').isEmpty) {
      removerAccount();
    }

    if (state.account == null) {
      state = state.copyWith(account: Account(senha: value, email: ''));
      return;
    }

    state = state.copyWith.account!(senha: value);
  }

  void removerAccount() {
    state = state.copyWith(account: null);
  }
}

final editorContatoNotifierProvider =
    StateNotifierProvider<EditorContatoController, Contato>(
        (ref) => throw UnimplementedError());
