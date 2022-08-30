import 'package:drift/drift.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/database/database.dart';

part '../../../../../generated/src/core/data/database/daos/sessions_dao.g.dart';

@DriftAccessor(include: {'../sql/tabelas.drift'})
class SessionsDao extends DatabaseAccessor<Database> with _$SessionsDaoMixin {
  SessionsDao(super.db);
}
