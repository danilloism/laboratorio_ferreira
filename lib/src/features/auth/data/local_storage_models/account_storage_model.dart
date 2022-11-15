import 'package:isar/isar.dart';

part '../../../../../generated/src/features/auth/data/local_storage_models/account_storage_model.g.dart';

@embedded
class AccountStorageModel {
  late String email;
  DateTime? criadoEm;
  DateTime? atualizadoEm;
}
