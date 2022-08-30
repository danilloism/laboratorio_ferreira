import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loggy/loggy.dart';

class AppObserver extends BlocObserver with UiLoggy {
  @override
  void onEvent(Bloc bloc, Object? event) {
    loggy.debug('${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    loggy.debug('${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    loggy.debug('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
