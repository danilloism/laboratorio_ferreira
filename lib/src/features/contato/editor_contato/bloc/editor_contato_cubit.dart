import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';

class EditorContatoCubit extends Cubit<Contato> {
  EditorContatoCubit([Contato? contato]) : super(contato ?? Contato.empty);
  final errors = <String>[];

  void nomeTeveAlteracao(String value) {
    const erroVazio = 'Campo "Nome" deve ser preenchido.';

    if (value.isEmpty) {
      errors.add(erroVazio);
    } else {
      errors.removeWhere((element) => element == erroVazio);
    }
    emit(state.copyWith(nome: value));
  }

  void adicionarTelefone(String telefone) {
    telefone = Formatter.unmaskPhone(telefone);
    emit(state.copyWith(telefones: {...state.telefones}..add(telefone)));
  }

  void removerTelefone(String telefone) {
    telefone = Formatter.unmaskPhone(telefone);
    emit(state.copyWith(telefones: {...state.telefones}..remove(telefone)));
  }

  // void telefoneTeveAlteracao({required int index, required String value}) {
  //   final telefone = TelefoneInput.dirty(value);
  //   final telefones = state.telefones.value;
  //   telefones[index] = telefone;
  //   final newValue = TelefonesInputList.dirty(telefones);
  //   emit(state.copyWith(
  //       telefones: newValue, status: Formz.validate([newValue, state.nome])));
  // }

  static EditorContatoCubit of(BuildContext context) =>
      context.read<EditorContatoCubit>();
}
