// coverage:ignore-file
import 'dart:collection';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:laboratorio_ferreira_mobile/firebase_options.dart';
import 'package:laboratorio_ferreira_mobile/src/config/config.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

enum InitializationItem {
  database,
  settingsRepo,
  firebaseApp,
}

typedef InitializationItemsMap = Map<InitializationItem, dynamic>;

class Init {
  const Init._();

  static Future<InitializationItemsMap> execute() async {
    final InitializationItemsMap itemsMap = {};

    WidgetsFlutterBinding.ensureInitialized();

    final chamadasAssincronas = await Future.wait([
      Init._database(),
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    ]);

    itemsMap[InitializationItem.database] = chamadasAssincronas[0];
    itemsMap[InitializationItem.firebaseApp] = chamadasAssincronas[1];

    final settingsRepo =
        await _settingsRepo(itemsMap[InitializationItem.database]);
    itemsMap[InitializationItem.settingsRepo] = settingsRepo;

    _executeAfterAsyncCall();

    return UnmodifiableMapView(itemsMap);
  }

  static void _executeAfterAsyncCall() {
    Loggy.initLoggy(
      logPrinter: Environment.isProduction
          ? const DefaultPrinter()
          : const PrettyDeveloperPrinter(),
      logOptions: Environment.isProduction
          ? const LogOptions(LogLevel.error)
          : const LogOptions(
              LogLevel.all,
              includeCallerInfo: true,
              stackTraceLevel: LogLevel.warning,
            ),
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
    );
  }

  static Future<Database> _database() async {
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = join(dir.path, 'lab_ferreira_sembast.db');

    return await databaseFactoryIo.openDatabase(dbPath);
  }

  static Future<SettingsRepository> _settingsRepo(Database db) async {
    final settingsRepo = SettingsSembastRepository(db);
    await settingsRepo.init();
    return settingsRepo;
  }
}
