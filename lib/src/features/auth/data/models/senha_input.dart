import 'package:formz/formz.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/enums/enums.dart';

class SenhaInput extends FormzInput<String, SenhaInputError> {
  const SenhaInput.pure() : super.pure('');
  const SenhaInput.dirty([super.value = '']) : super.dirty();

  @override
  SenhaInputError? validator(String value) {
    if (value.isEmpty) return SenhaInputError.empty;
    if (value.length < 4) return SenhaInputError.minLengthRequired;
    if (value.length > 20) return SenhaInputError.lengthOverflow;

    return null;
  }
}
