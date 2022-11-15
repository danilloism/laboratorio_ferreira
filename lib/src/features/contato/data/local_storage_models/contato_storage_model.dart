import 'package:isar/isar.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/local_storage_models/account_storage_model.dart';

part '../../../../../generated/src/features/contato/data/local_storage_models/contato_storage_model.g.dart';

@collection
class ContatoStorageModel {
  Id get localId => fastHash(uid);
  @Index()
  late String uid;
  late String nome;
  DateTime? criadoEm;
  DateTime? atualizadoEm;
  bool? ativo;
  late List<byte> categorias;
  late List<String> telefones;
  final account = IsarLink<AccountStorageModel>();
}

int fastHash(String string) {
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}
