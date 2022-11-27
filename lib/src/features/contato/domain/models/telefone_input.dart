import 'package:formz/formz.dart';

enum TelefoneInputError {
  empty('Campo vazio.'),
  minLengthRequired('Telefone inválido, verifique se ddd foi informado.'),
  lengthOverflow('Telefone possui mais números que o permitido.');

  final String message;

  const TelefoneInputError(this.message);
}

class TelefoneInput extends FormzInput<String, TelefoneInputError> {
  const TelefoneInput.pure() : super.pure('');

  const TelefoneInput.dirty([super.value = '']) : super.dirty();

  @override
  TelefoneInputError? validator(String value) {
    if (value.isEmpty) return TelefoneInputError.empty;
    if (value.length > 11) return TelefoneInputError.lengthOverflow;
    if (value.length < 11) return TelefoneInputError.minLengthRequired;

    return null;
  }
}
