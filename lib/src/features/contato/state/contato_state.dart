import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/models/contato_model.dart';

part '../../../../generated/src/features/contato/state/contato_state.freezed.dart';

@freezed
class ContatoState with _$ContatoState {
  const factory ContatoState({
    @Default([]) List<ContatoModel> contatos,
    @Default(true) bool isLoading,
  }) = _ContatoState;

  const ContatoState._();
}
