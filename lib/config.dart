import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get apiUrl => _get('API_URL');
  static String get environment => _get('ENVIRONMENT');

  static String _get(String value) => dotenv.env[value] ?? '';
}
