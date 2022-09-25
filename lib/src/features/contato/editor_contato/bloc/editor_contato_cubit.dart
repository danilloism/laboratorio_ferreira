import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';

enum _EditorContatoCubitErrors {
  nomeVazio('Campo "Nome" deve ser preenchido.'),
  telefonesVazio('O contato deve ter no mínimo 1 telefone.'),
  categoriasVazio('O contato deve ter no mínimo 1 categoria.');

  final String message;

  const _EditorContatoCubitErrors(this.message);
}

class EditorContatoCubit extends Cubit<Contato> {
  EditorContatoCubit([Contato? contato]) : super(contato ?? Contato.empty) {
    if (state.isEmpty) {
      _errors.addAll([
        _EditorContatoCubitErrors.nomeVazio,
        _EditorContatoCubitErrors.telefonesVazio
      ]);
      if (state.categorias.isEmpty) {
        _errors.add(_EditorContatoCubitErrors.categoriasVazio);
      }
    }
  }

  final _errors = <_EditorContatoCubitErrors>{};

  List<String> get errors =>
      UnmodifiableListView(_errors.map((error) => error.message));

  void nomeTeveAlteracao(String value) {
    if (value.trim().isEmpty) {
      _errors.add(_EditorContatoCubitErrors.nomeVazio);
    } else if (_errors.contains(_EditorContatoCubitErrors.nomeVazio)) {
      _errors.remove(_EditorContatoCubitErrors.nomeVazio);
    }
    emit(state.copyWith(nome: value));
  }

  void adicionarTelefone(String telefone) {
    if (_errors.contains(_EditorContatoCubitErrors.telefonesVazio)) {
      _errors.remove(_EditorContatoCubitErrors.telefonesVazio);
    }

    telefone = Formatter.unmaskPhone(telefone);
    emit(state.copyWith(telefones: {...state.telefones}..add(telefone)));
  }

  void removerTelefone(String telefone) {
    telefone = Formatter.unmaskPhone(telefone);
    final listaTelefones = {...state.telefones};
    final removeu = listaTelefones.remove(telefone);
    if (removeu && listaTelefones.isEmpty) {
      _errors.add(_EditorContatoCubitErrors.telefonesVazio);
    }
    emit(state.copyWith(telefones: listaTelefones));
  }

  static EditorContatoCubit of(BuildContext context) =>
      context.read<EditorContatoCubit>();
}
