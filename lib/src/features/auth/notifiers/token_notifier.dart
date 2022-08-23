// ignore_for_file: use_super_parameters

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TokenNotifier extends StateNotifier<String?> {
  TokenNotifier([String? token]) : super(token);
  String? get value => state;

  void reset(String? token) => state = token;
}
