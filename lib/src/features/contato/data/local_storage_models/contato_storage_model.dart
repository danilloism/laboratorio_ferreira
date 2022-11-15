import 'package:isar/isar.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/local_storage_models/account_storage_model.dart';

part '../../../../../generated/src/features/contato/data/local_storage_models/contato_storage_model.g.dart';

@collection
class ContatoStorageModel {
  @Name('id')
  Id? localId;
  @Index()
  late String uid;
  late String nome;
  DateTime? criadoEm;
  DateTime? atualizadoEm;
  bool? ativo;
  late List<byte> categorias;
  late List<String> telefones;
  AccountStorageModel? account;
}
