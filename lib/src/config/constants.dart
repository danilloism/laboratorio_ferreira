class Constants {
  Constants._();

  static String get apiUrl => const String.fromEnvironment('API_URL',
      defaultValue: 'https://laboratorio-ferreira-api.onrender.com');

  static bool get isProduction => const bool.fromEnvironment('dart.vm.product');

  static String get initialConnectivityInstanceName => 'initialConnectivity';
}
