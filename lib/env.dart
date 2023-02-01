import 'package:envied/envied.dart';

part 'generated/env.g.dart';

const _defaultValue = 'default';

@Envied(obfuscate: true, requireEnvFile: true)
abstract class Env {
  @EnviedField(varName: 'FIREBASE_PROJECT_ID', defaultValue: _defaultValue)
  static final firebaseProjectId = _Env.firebaseProjectId;

  @EnviedField(
      varName: 'FIREBASE_MESSAGING_SENDER_ID', defaultValue: _defaultValue)
  static final firebaseMessagingSenderId = _Env.firebaseMessagingSenderId;

  @EnviedField(varName: 'FIREBASE_STORAGE_BUCKET', defaultValue: _defaultValue)
  static final firebaseStorageBucket = _Env.firebaseStorageBucket;

  @EnviedField(varName: 'FIREBASE_ANDROID_API_KEY', defaultValue: _defaultValue)
  static final firebaseAndroidApiKey = _Env.firebaseAndroidApiKey;

  @EnviedField(varName: 'FIREBASE_ANDROID_APP_ID', defaultValue: _defaultValue)
  static final firebaseAndroidAppId = _Env.firebaseAndroidAppId;

  @EnviedField(varName: 'FIREBASE_IOS_API_KEY', defaultValue: _defaultValue)
  static final firebaseIosApiKey = _Env.firebaseIosApiKey;

  @EnviedField(varName: 'FIREBASE_IOS_APP_ID', defaultValue: _defaultValue)
  static final firebaseIosAppId = _Env.firebaseIosAppId;

  @EnviedField(varName: 'FIREBASE_IOS_CLIENT_ID', defaultValue: _defaultValue)
  static final firebaseIosClientId = _Env.firebaseIosClientId;

  @EnviedField(varName: 'FIREBASE_IOS_BUNDLE_ID', defaultValue: _defaultValue)
  static final firebaseIosBundleId = _Env.firebaseIosBundleId;
}
