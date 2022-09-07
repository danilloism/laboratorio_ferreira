import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/editor_contato/data/models/nome_input.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/editor_contato/data/models/telefones_input_list.dart';

part '../../../../../../generated/src/features/contato/editor_contato/data/models/editor_contato.freezed.dart';

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
