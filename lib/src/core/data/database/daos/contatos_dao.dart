import 'package:drift/drift.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/database/database.dart';

part '../../../../../generated/src/core/data/database/daos/contatos_dao.g.dart';

@DriftAccessor(include: {'../sql/tabelas.drift'})
class ContatosDao extends DatabaseAccessor<Database> with _$ContatosDaoMixin {
  ContatosDao(super.db);
}
