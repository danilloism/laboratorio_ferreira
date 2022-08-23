import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/notifiers/token_notifier.dart';

final tokenNotifierProvider =
    StateNotifierProvider<TokenNotifier, String?>((ref) => TokenNotifier());
