import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';

class EditorContatoStepCubit extends Cubit<EditingContatoState> {
  EditorContatoStepCubit() : super(const EditingContatoState.editing());

  void setDone() {
    emit(const EditingContatoState.done());
  }

  void setEditing() {
    emit(const EditingContatoState.editing());
  }

  static EditorContatoStepCubit of(BuildContext context) =>
      context.read<EditorContatoStepCubit>();
}
