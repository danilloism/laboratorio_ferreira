import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';

class EditorTelefoneCubit extends Cubit<TelefoneInput> {
  EditorTelefoneCubit([String? telefone])
      : super(telefone != null
            ? TelefoneInput.dirty(telefone)
            : const TelefoneInput.pure());

  void teveAlteracao(String value) {
    final telefone = TelefoneInput.dirty(value);
    emit(telefone);
  }

  static EditorTelefoneCubit of(BuildContext context) =>
      context.read<EditorTelefoneCubit>();
}
