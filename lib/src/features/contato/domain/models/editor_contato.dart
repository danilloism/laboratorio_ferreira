import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';

part '../../../../../generated/src/features/contato/domain/models/editor_contato.freezed.dart';

@freezed
class EditorContato with _$EditorContato {
  const factory EditorContato({
    @Default(NomeInput.pure()) NomeInput nome,
    @Default(TelefonesInputList.pure()) TelefonesInputList telefones,
    @Default({}) Set<Roles> categorias,
    @Default(FormzStatus.pure) FormzStatus status,
    String? error,
  }) = _EditorContato;
}
