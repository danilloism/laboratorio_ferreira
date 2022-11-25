import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/telefone_input.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../../../generated/src/features/contato/presentation/components/editor_contato/controllers/editor_telefone_notifier.g.dart';

@riverpod
class EditorTelefoneController extends _$EditorTelefoneController {
  @override
  TelefoneInput build([String? initialValue]) {
    return initialValue != null
        ? TelefoneInput.dirty(initialValue)
        : const TelefoneInput.pure();
  }

  void teveAlteracao(String value) => state = TelefoneInput.dirty(value);
}
