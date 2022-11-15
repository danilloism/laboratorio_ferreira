import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/misc/helpers/account_transformer.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/data/local_storage_models/contato_storage_model.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';

class ContatoTransformer {
  const ContatoTransformer._();

  static Contato storageToDomain(ContatoStorageModel model) {
    return Contato(
      nome: model.nome,
      telefones: model.telefones.toSet(),
      categorias: model.categorias.map((index) => Roles.values[index]).toSet(),
      uid: model.uid,
      ativo: model.ativo,
      atualizadoEm: model.atualizadoEm,
      criadoEm: model.criadoEm,
      account: AccountTransformer.storageToDomain(model.account.value),
    );
  }

  static ContatoStorageModel domainToStorage(Contato model) {
    return ContatoStorageModel()
      ..nome = model.nome
      ..telefones = model.telefones.toList()
      ..categorias =
          model.categorias.map((categoria) => categoria.index).toList()
      ..uid = model.uid
      ..ativo = model.ativo
      ..atualizadoEm = model.atualizadoEm
      ..criadoEm = model.criadoEm
      ..account.value = AccountTransformer.domainToStorage(model.account);
  }
}
