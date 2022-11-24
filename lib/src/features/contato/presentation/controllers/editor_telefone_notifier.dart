import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/telefone_input.dart';

class EditorTelefoneNotifier extends StateNotifier<TelefoneInput> {
  EditorTelefoneNotifier([String? telefone])
      : super(telefone != null
            ? TelefoneInput.dirty(telefone)
            : const TelefoneInput.pure());

  void teveAlteracao(String value) {
    final telefone = TelefoneInput.dirty(value);
    state = telefone;
  }
}

final telefoneNotifierProvider = StateNotifierProvider.family
    .autoDispose<EditorTelefoneNotifier, TelefoneInput, String?>(
        (ref, telefone) => EditorTelefoneNotifier(telefone));
