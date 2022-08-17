class Config {
  Config._();

  static Uri get apiUri =>
      Uri.parse(const String.fromEnvironment('API_URL', defaultValue: ''));

  static bool get isProduction => const bool.fromEnvironment('dart.vm.product');

  static String get hiveBoxName =>
      const String.fromEnvironment('HIVE_BOX_NAME', defaultValue: 'HiveBox');
}
