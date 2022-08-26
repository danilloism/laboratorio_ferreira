import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loggy/loggy.dart';

class AppBlocObserver extends BlocObserver with UiLoggy {
  @override
  void onEvent(Bloc bloc, Object? event) {
    loggy.debug('''
  onEvent:
    = bloc: $bloc
    = event: {
      -  type: ${event.runtimeType}
      -  value: $event
    }
  ''');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    loggy.debug('''
  onTransition:
    = bloc: $bloc
    = transition: $transition
  ''');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    loggy.debug('Error: $error');
    super.onError(bloc, error, stackTrace);
  }
}
