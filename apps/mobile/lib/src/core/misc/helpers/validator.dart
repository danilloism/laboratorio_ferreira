import 'package:form_builder_validators/form_builder_validators.dart';

class Validator {
  const Validator._();

  static String? Function(T?) senha<T>() {
    return FormBuilderValidators.compose(
      [
        FormBuilderValidators.minLength(4),
        FormBuilderValidators.maxLength(20),
        FormBuilderValidators.required(),
      ],
    );
  }

  static String? Function(T?) email<T extends String>() {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormBuilderValidators.email(),
    ]);
  }
}
