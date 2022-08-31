import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/database/daos/daos.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/database/helpers/helpers.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/models/models.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

part '../../../../generated/src/core/data/database/database.g.dart';

@DriftDatabase(
  include: {'sql/tabelas.drift', 'sql/triggers.drift'},
  daos: [
    AccountsDao,
    ContatosDao,
    SettingsDao,
    SessionsDao,
  ],
)
class Database extends _$Database {
  Database([QueryExecutor? queryExec]) : super(queryExec ?? _lazyConnection());
  // Database.connect() : super.connect(_isolateConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(onCreate: (m) async => await m.createAll());

  // @override
  // Future<void> close() async {
  //   // DriftIsolate.shutDownAll();
  //   super.close();
  // }
}

LazyDatabase _lazyConnection() => LazyDatabase(
      () async {
        final dir = await getApplicationDocumentsDirectory();
        final file = File(
          join(dir.path, 'lab_ferreira.sqlite'),
        );
        return NativeDatabase(file, logStatements: !Config.isProduction);
      },
    );

// DatabaseConnection _isolateConnection() {
//   return DatabaseConnection.delayed(Future.sync(() async {
//     final database = _lazyConnection();
//     final isolate =
//         await DriftIsolate.spawn(() => DatabaseConnection(database));
//     return isolate.connect(isolateDebugLog: !Config.isProduction);
//   }));
// }
