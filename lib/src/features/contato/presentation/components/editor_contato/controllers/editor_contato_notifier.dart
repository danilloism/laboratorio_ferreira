import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/enums/roles.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/helpers/formatter.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/application/managers/editor_contato_error_manager.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';

class EditorContatoNotifier extends StateNotifier<Contato> {
  late final EditorContatoErrorManager _errorManager;

  EditorContatoNotifier(super.state) {
    if (state.isEmpty) {
      _errorManager = EditorContatoErrorManager.nomeVazioTelefonesVazio();
      if (state.categorias.isEmpty) {
        _errorManager.addCategoriaVazio();
      }
      return;
    }

    _errorManager = EditorContatoErrorManager();
  }

  List<String> get errors => _errorManager.errors;

  void nomeTeveAlteracao(String value) {
    _errorManager.handleAlteracaoNome(value);
    state = state.copyWith(nome: value);
  }

  void adicionarTelefone(String telefone) {
    _errorManager.handleAdicionarTelefone();

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
    _errorManager.handleRemoverTelefone(telefones.length);
    state = state.copyWith(telefones: telefones);
  }

  void removerCategoria(Roles categoria) {
    final categorias = {...state.categorias}..remove(categoria);
    _errorManager.handleRemoverCategoria(categorias.length);
    state = state.copyWith(categorias: {...categorias});
  }

  void adicionarCategorias(Iterable<Roles> categorias) {
    _errorManager.handleAdicionarCategoria();
    final categoriasAtualizado = {...state.categorias}..addAll(categorias);
    state = state.copyWith(categorias: {...categoriasAtualizado});
  }
}

final editorContatoNotifierProvider =
    StateNotifierProvider<EditorContatoNotifier, Contato>(
        (ref) => throw UnimplementedError());
