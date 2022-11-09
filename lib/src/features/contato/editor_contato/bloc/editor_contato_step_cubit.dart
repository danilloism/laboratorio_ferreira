import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';

class EditorContatoStepCubit extends Cubit<EditorContatoPageState> {
  EditorContatoStepCubit() : super(EditorContatoPageState.editing);

  void setDone() {
    emit(EditorContatoPageState.done);
  }

  void setEditing() {
    emit(EditorContatoPageState.editing);
  }

  static EditorContatoStepCubit of(BuildContext context) =>
      context.read<EditorContatoStepCubit>();
}
