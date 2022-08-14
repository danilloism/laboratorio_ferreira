class Config {
  static String get apiUrl =>
      const String.fromEnvironment('API_URL', defaultValue: '');
  static String get environment =>
      const String.fromEnvironment('ENVIRONMENT', defaultValue: 'development');
}
