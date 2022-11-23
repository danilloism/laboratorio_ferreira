import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/enums/roles.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/helpers/formatter.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';

enum _EditorContatoNotifierErrors {
  nomeVazio('Campo "Nome" deve ser preenchido.'),
  telefonesVazio('O contato deve ter no mínimo 1 telefone.'),
  categoriasVazio('O contato deve ter no mínimo 1 categoria.'),
  nomeMaiorQue80('O campo "Contato" deve ter no máximo 80 caracteres.');

  final String message;

  const _EditorContatoNotifierErrors(this.message);
}

class EditorContatoNotifier extends StateNotifier<Contato> {
  EditorContatoNotifier(super.state) {
    if (state.isEmpty) {
      _errors.addAll([
        _EditorContatoNotifierErrors.nomeVazio,
        _EditorContatoNotifierErrors.telefonesVazio
      ]);
      if (state.categorias.isEmpty) {
        _errors.add(_EditorContatoNotifierErrors.categoriasVazio);
      }
    }
  }

  final _errors = <_EditorContatoNotifierErrors>{};

  List<String> get errors =>
      UnmodifiableListView(_errors.map((error) => error.message));

  void nomeTeveAlteracao(String value) {
    if (value.trim().isEmpty) {
      _errors.add(_EditorContatoNotifierErrors.nomeVazio);
    } else if (_errors.contains(_EditorContatoNotifierErrors.nomeVazio)) {
      _errors.remove(_EditorContatoNotifierErrors.nomeVazio);
    }

    if (value.length > 80) {
      _errors.add(_EditorContatoNotifierErrors.nomeMaiorQue80);
    } else if (_errors.contains(_EditorContatoNotifierErrors.nomeMaiorQue80)) {
      _errors.remove(_EditorContatoNotifierErrors.nomeMaiorQue80);
    }

    state = state.copyWith(nome: value);
  }

  void adicionarTelefone(String telefone) {
    if (_errors.contains(_EditorContatoNotifierErrors.telefonesVazio)) {
      _errors.remove(_EditorContatoNotifierErrors.telefonesVazio);
    }

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
    final listaTelefones = {...state.telefones}..remove(telefone);
    if (listaTelefones.isEmpty) {
      _errors.add(_EditorContatoNotifierErrors.telefonesVazio);
    }
    state = state.copyWith(telefones: listaTelefones);
  }

  void removerCategoria(Roles categoria) {
    final categorias = {...state.categorias}..remove(categoria);
    state = state.copyWith(categorias: {...categorias});
  }

  void adicionarCategorias(Iterable<Roles> categorias) {
    final categoriasAtualizado = {...state.categorias}..addAll(categorias);
    state = state.copyWith(categorias: {...categoriasAtualizado});
  }
}

final editorContatoNotifierProvider =
    StateNotifierProvider<EditorContatoNotifier, Contato>(
        (ref) => throw UnimplementedError());
