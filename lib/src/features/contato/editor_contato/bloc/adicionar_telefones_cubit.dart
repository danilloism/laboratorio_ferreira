import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';

class AdicionarTelefoneCubit extends Cubit<TelefoneInput> {
  AdicionarTelefoneCubit([TelefoneInput? telefone])
      : super(telefone ?? const TelefoneInput.pure());

  void teveAlteracao(String value) {
    final telefone = TelefoneInput.dirty(value);
    emit(telefone);
  }

  static AdicionarTelefoneCubit of(BuildContext context) =>
      context.read<AdicionarTelefoneCubit>();
}
