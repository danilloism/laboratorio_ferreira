import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/local_storage_models/account_storage_model.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/data/local_storage_models/contato_storage_model.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';

class AccountTransformer {
  const AccountTransformer._();

  static Account? storageToDomain(AccountStorageModel? model) {
    if (model == null) return null;
    return Account(
      email: model.email,
      atualizadoEm: model.atualizadoEm,
      criadoEm: model.criadoEm,
    );
  }

  static AccountStorageModel? domainToStorage(Account? model) {
    if (model == null) return null;
    return AccountStorageModel()
      ..email = model.email
      ..atualizadoEm = model.atualizadoEm
      ..criadoEm = model.criadoEm;
  }
}
