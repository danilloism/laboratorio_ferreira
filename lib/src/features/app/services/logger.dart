import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer';

class LoggerService extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) =>
      log('[${provider.name ?? provider.runtimeType}] value: $newValue');
}
