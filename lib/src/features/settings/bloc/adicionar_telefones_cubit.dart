import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/bloc/adicionar_telefones_state.dart';

class AdicionarTelefonesCubit extends Cubit<AdicionarTelefonesState> {
  AdicionarTelefonesCubit()
      : super(
          AdicionarTelefonesState(
            telefones: [
              TelefoneInputWithKey(
                  input: const TelefoneInput.pure(),
                  key: DateTime.now().microsecondsSinceEpoch)
            ],
            update: false,
          ),
        );

  bool telefoneAtIndexHasError(int index) =>
      state.telefones[index].input.error != null;

  List<TelefoneInputError> _errors([List<TelefoneInputWithKey>? telefones]) {
    if (telefones == null) {
      return state.telefones
          .map((e) => e.input.error)
          .whereType<TelefoneInputError>()
          .toList(growable: false);
    }

    return telefones
        .map((e) => e.input.error)
        .whereType<TelefoneInputError>()
        .toList(growable: false);
  }

  void adicionar() {
    final currentStateErrors = _errors();
    if (currentStateErrors.isNotEmpty) {
      return emit(state.copyWith(errors: currentStateErrors, update: true));
    }
    final telefone = TelefoneInputWithKey(
      input: const TelefoneInput.pure(),
      key: DateTime.now().microsecondsSinceEpoch,
    );
    final novaLista = [...state.telefones, telefone];
    emit(
      state.copyWith(
        update: true,
        telefones: novaLista,
        errors: _errors(state.telefones),
      ),
    );
  }

  void removerNoIndice(int index) {
    final novaLista = [...state.telefones];
    novaLista.removeAt(index);
    emit(state.copyWith(
        update: true, telefones: novaLista, errors: _errors(novaLista)));
  }

  void telefoneTeveAlteracaoNoIndice(int index, {required String value}) {
    final novaLista = [...state.telefones];
    novaLista[index] =
        novaLista[index].copyWith(input: TelefoneInput.dirty(value));
    emit(
      state.copyWith(
        telefones: novaLista,
        errors: _errors(novaLista),
        update: Formz.validate([novaLista[index].input]).isValid,
      ),
    );
  }

  static AdicionarTelefonesCubit of(BuildContext context) =>
      context.read<AdicionarTelefonesCubit>();
}
