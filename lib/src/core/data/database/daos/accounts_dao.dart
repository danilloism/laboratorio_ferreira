import 'package:drift/drift.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/database/database.dart';

part '../../../../../generated/src/core/data/database/daos/accounts_dao.g.dart';

@DriftAccessor(include: {'../sql/tabelas.drift'})
class AccountsDao extends DatabaseAccessor<Database> with _$AccountsDaoMixin {
  AccountsDao(super.db);
}
