import 'package:envied/envied.dart';

part 'generated/env.g.dart';

@Envied(
  path: './env/.env.development',
  obfuscate: true,
  requireEnvFile: true,
)
abstract class Env {
  @EnviedField(varName: 'FIREBASE_PROJECT_ID')
  static final firebaseProjectId = _Env.firebaseProjectId;

  @EnviedField(varName: 'FIREBASE_MESSAGING_SENDER_ID')
  static final firebaseMessagingSenderId = _Env.firebaseMessagingSenderId;

  @EnviedField(varName: 'FIREBASE_STORAGE_BUCKET')
  static final firebaseStorageBucket = _Env.firebaseStorageBucket;

  @EnviedField(varName: 'FIREBASE_ANDROID_API_KEY')
  static final firebaseAndroidApiKey = _Env.firebaseAndroidApiKey;

  @EnviedField(varName: 'FIREBASE_ANDROID_APP_ID')
  static final firebaseAndroidAppId = _Env.firebaseAndroidAppId;

  @EnviedField(varName: 'FIREBASE_IOS_API_KEY')
  static final firebaseIosApiKey = _Env.firebaseIosApiKey;

  @EnviedField(varName: 'FIREBASE_IOS_APP_ID')
  static final firebaseIosAppId = _Env.firebaseIosAppId;

  @EnviedField(varName: 'FIREBASE_IOS_CLIENT_ID')
  static final firebaseIosClientId = _Env.firebaseIosClientId;

  @EnviedField(
    varName: 'FIREBASE_IOS_BUNDLE_ID',
    defaultValue: 'com.dnn.laboratorioFerreiraMobile',
  )
  static final firebaseIosBundleId = _Env.firebaseIosBundleId;

  @EnviedField(
    varName: 'API_URL',
    defaultValue: 'https://laboratorio-ferreira-api.onrender.com',
  )
  static final apiUrl = _Env.apiUrl;

  @EnviedField(
    varName: 'LOCAL_DB_SETTINGS_BOX_NAME',
    defaultValue: 'settingsBox',
  )
  static final localDbSettingsBoxName = _Env.localDbSettingsBoxName;

  @EnviedField(
    varName: 'LOCAL_DB_SESSION_KEY',
    defaultValue: 'session',
  )
  static final localDbSessionKey = _Env.localDbSessionKey;

  @EnviedField(
    varName: 'LOCAL_DB_THEMEMODE_KEY',
    defaultValue: 'themeMode',
  )
  static final localDbThemeModeKey = _Env.localDbThemeModeKey;

  @EnviedField(
    varName: 'LOCAL_DB_USE_M3_KEY',
    defaultValue: 'useM3',
  )
  static final localDbUseM3Key = _Env.localDbUseM3Key;
}
