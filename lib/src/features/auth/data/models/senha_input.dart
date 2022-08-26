import 'package:formz/formz.dart';

enum SenhaInputError { empty }

class SenhaInput extends FormzInput<String, SenhaInputError> {
  const SenhaInput.pure() : super.pure('');
  const SenhaInput.dirty([super.value = '']) : super.dirty();

  @override
  SenhaInputError? validator(String value) {
    if (value.isEmpty) return SenhaInputError.empty;

    return null;
  }
}
