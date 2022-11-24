import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';

part '../../../../../generated/src/features/contato/presentation/states/contatos_store.freezed.dart';

@freezed
class ContatosStore with _$ContatosStore {
  const factory ContatosStore({
    @Default([]) List<Contato> contatos,
    @Default(true) bool isLoading,
  }) = _ContatosStore;

  const ContatosStore._();
}
