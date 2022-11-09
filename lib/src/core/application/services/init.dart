import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:laboratorio_ferreira_mobile/src/config/config.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class Init {
  const Init._();

  static void executeAfterAsyncCall() {
    Loggy.initLoggy(
      logPrinter: Constants.isProduction
          ? const DefaultPrinter()
          : const PrettyDeveloperPrinter(),
      logOptions: Constants.isProduction
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

  static Future<Database> database() async {
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = join(dir.path, 'lab_ferreira_sembast.db');
    return await databaseFactoryIo.openDatabase(dbPath);
  }

  static Future<SettingsRepository> settingsRepo(Database db) async {
    final settingsRepo = SettingsSembastRepository(db);
    await settingsRepo.init();
    return settingsRepo;
  }
}