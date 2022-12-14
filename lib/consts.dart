// coverage:ignore-file
class Environment {
  const Environment._();

  static String get apiUrl => const String.fromEnvironment('API_URL',
      defaultValue: 'https://laboratorio-ferreira-api.onrender.com');

  static bool get isProduction => const bool.fromEnvironment('dart.vm.product');
}

class HiveConsts {
  const HiveConsts._();

  static String get settingsBoxName => 'settingsBox';
  static String get sessionKey => 'session';
  static String get themeModeKey => 'themeMode';
  static String get useMaterial3Key => 'useM3';
}
