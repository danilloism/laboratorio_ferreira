enum SenhaInputError {
  empty('Por favor, informe a senha.'),
  minLengthRequired('Senha inválida.'),
  lengthOverflow('Senha inválida.');

  final String name;

  const SenhaInputError(this.name);
}

enum EmailInputError {
  empty('Por favor, informe um email.'),
  invalid('Email inválido.');

  final String name;

  const EmailInputError(this.name);
}
