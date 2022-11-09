import 'package:email_validator/email_validator.dart';
import 'package:formz/formz.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/models.dart';

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([super.value = '']) : super.dirty();

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty) return EmailInputError.empty;
    if (!EmailValidator.validate(value)) return EmailInputError.invalid;

    return null;
  }
}
