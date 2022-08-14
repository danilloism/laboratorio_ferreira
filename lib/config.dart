class Config {
  static Uri get apiUri =>
      Uri.parse(const String.fromEnvironment('API_URL', defaultValue: ''));

  static String get environment =>
      const String.fromEnvironment('ENVIRONMENT', defaultValue: 'development');
}
