import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/email_input.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/senha_input.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/session.dart';

part '../../../../../generated/src/features/auth/data/models/login.freezed.dart';

@freezed
class Login with _$Login {
  const factory Login({
    @Default(EmailInput.pure()) EmailInput? email,
    @Default(SenhaInput.pure()) SenhaInput? senha,
    @Default(FormzStatus.pure) FormzStatus? status,
    @Default(null) Session? session,
    @Default(null) String? erro,
  }) = _Login;
}
