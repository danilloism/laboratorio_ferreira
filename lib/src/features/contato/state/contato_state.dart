import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/data/models/contato.dart';

part '../../../../generated/src/features/contato/state/contato_state.freezed.dart';

@freezed
class ContatoState with _$ContatoState {
  const factory ContatoState({
    @Default([]) List<Contato> contatos,
    @Default(true) bool isLoading,
  }) = _ContatoState;

  const ContatoState._();
}
