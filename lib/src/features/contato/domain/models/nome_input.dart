import 'package:formz/formz.dart';

enum NomeInputError { empty }

class NomeInput extends FormzInput<String, NomeInputError> {
  const NomeInput.pure() : super.pure('');

  const NomeInput.dirty([super.value = '']) : super.dirty();

  @override
  NomeInputError? validator(String value) {
    // TODO: implement validator
    throw UnimplementedError();
  }
}
