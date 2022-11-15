import 'package:formz/formz.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/helpers/formatter.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/telefone_input.dart';

enum TelefonesInputListError { empty, hasDuplicates, individualItemError }

class TelefonesInputList extends FormzInput<List<TelefoneInput>, String> {
  const TelefonesInputList.pure() : super.pure(const []);

  const TelefonesInputList.dirty([super.telefones = const []]) : super.dirty();

  @override
  String? validator(List<TelefoneInput> value) {
    final errors = <String?>[];

    if (value.isEmpty) errors.add(TelefonesInputListError.empty.name);
    if (value.any((element) => element.error == null)) {
      errors.add(TelefonesInputListError.individualItemError.name);
    }
    if (value.toSet().length != value.length) {
      errors.add(TelefonesInputListError.hasDuplicates.name);
    }

    return Formatter.fromErrorList(errors);
  }
}
