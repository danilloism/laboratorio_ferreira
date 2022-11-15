import 'package:isar/isar.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/data/local_storage_models/contato_storage_model.dart';
part '../../../../../generated/src/features/auth/data/local_storage_models/account_storage_model.g.dart';

@collection
class AccountStorageModel {
  Id get localId => fastHash(email);

  @Index()
  late String email;
  DateTime? criadoEm;
  DateTime? atualizadoEm;
  final contato = IsarLink<ContatoStorageModel>();
}
