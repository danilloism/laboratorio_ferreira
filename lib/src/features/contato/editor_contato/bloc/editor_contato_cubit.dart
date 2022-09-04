import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/common/data/models/contato.dart';

class EditorContatoCubit extends Cubit<Contato> {
  EditorContatoCubit(Contato? contato) : super(contato ?? Contato.empty);

  static EditorContatoCubit of(BuildContext context) =>
      context.read<EditorContatoCubit>();
}
