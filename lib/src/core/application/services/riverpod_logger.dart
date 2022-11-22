// coverage:ignore-file
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loggy/loggy.dart';

class RiverpodLogger extends ProviderObserver with UiLoggy {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    loggy.debug('''
update {
  "provider": "${provider.name ?? provider.runtimeType}",
  "previousValue": "$previousValue",
  "newValue": "$newValue"    
}''');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    loggy.debug('''
add {
  "provider": "${provider.name ?? provider.runtimeType}",
  "value": "$value"
}''');
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    loggy.debug('''
dispose {
  "provider": "${provider.name ?? provider.runtimeType}" 
}''');
    super.didDisposeProvider(provider, container);
  }

  @override
  void providerDidFail(ProviderBase provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    loggy.debug('''
fail {
  "provider": "${provider.name ?? provider.runtimeType}",
  "error": "$error",
  "stackTrace": "$stackTrace"    
}''');
    super.providerDidFail(provider, error, stackTrace, container);
  }
}
