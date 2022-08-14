class Config {
  static Uri get apiUri =>
      Uri.parse(const String.fromEnvironment('API_URL', defaultValue: ''));

  static bool envIsProduction() =>
      const bool.fromEnvironment('dart.vm.product');
}
