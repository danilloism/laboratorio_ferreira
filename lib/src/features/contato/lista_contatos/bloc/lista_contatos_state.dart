import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';

part '../../../../../generated/src/features/contato/lista_contatos/bloc/lista_contatos_state.freezed.dart';

@freezed
class ListaContatosState with _$ListaContatosState {
  const factory ListaContatosState({
    @Default([]) List<Contato> contatos,
    @Default(true) bool isLoading,
  }) = _ListaContatosState;

  const ListaContatosState._();
}
