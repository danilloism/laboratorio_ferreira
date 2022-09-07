import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/common/data/models/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/editor_contato/data/models/editor_contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/editor_contato/data/models/nome_input.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/editor_contato/data/models/telefone_input.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/editor_contato/data/models/telefones_input_list.dart';

class EditorContatoCubit extends Cubit<EditorContato> {
  EditorContatoCubit([Contato? contato])
      : super(
          contato == null
              ? const EditorContato()
              : EditorContato(
                  nome: NomeInput.dirty(contato.nome),
                  telefones: TelefonesInputList.dirty(contato.telefones
                      .map((telefone) => TelefoneInput.dirty(telefone))
                      .toList()),
                  categorias: contato.categorias,
                ),
        );

  void nomeTeveAlteracao(String value) {
    final nome = NomeInput.dirty(value);
    emit(state.copyWith(
      nome: nome,
      status: Formz.validate([nome, ...state.telefones.value]),
    ));
  }

  void adicionarTelefone(String value) {
    final telefone =
        value.isEmpty ? const TelefoneInput.pure() : TelefoneInput.dirty(value);
    final telefonesNewValue =
        TelefonesInputList.dirty([telefone, ...state.telefones.value]);
    final status = Formz.validate([telefonesNewValue, state.nome]);
    emit(state.copyWith(
      telefones: telefonesNewValue,
      status: status,
    ));
  }

  void removerTelefoneAt(int index) {
    final telefonesNewValue =
        TelefonesInputList.dirty(state.telefones.value..removeAt(index));

    emit(state.copyWith(
      telefones: telefonesNewValue,
      status: Formz.validate([telefonesNewValue, state.nome]),
    ));
  }

  void telefoneTeveAlteracao({required int index, required String value}) {
    final telefone = TelefoneInput.dirty(value);
    final telefones = state.telefones.value;
    telefones[index] = telefone;
    final newValue = TelefonesInputList.dirty(telefones);
    emit(state.copyWith(
        telefones: newValue, status: Formz.validate([newValue, state.nome])));
  }

  static EditorContatoCubit of(BuildContext context) =>
      context.read<EditorContatoCubit>();
}
