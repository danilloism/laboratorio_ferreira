
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';

part '../../../../generated/src/features/settings/bloc/adicionar_telefones_state.freezed.dart';

@freezed
class AdicionarTelefonesState with _$AdicionarTelefonesState {
  const factory AdicionarTelefonesState({
    @Default([]) List<TelefoneInputWithKey> telefones,
    @Default([]) List<TelefoneInputError> errors,
    @Default(false) bool update,
  }) = _AdicionarTelefonesState;
}

@freezed
class TelefoneInputWithKey with _$TelefoneInputWithKey {
  const factory TelefoneInputWithKey(
      {required TelefoneInput input, required int key}) = _TelefoneInputWithKey;
}
