import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loggy/loggy.dart';

class AppObserver extends BlocObserver with UiLoggy {
  @override
  void onEvent(Bloc bloc, Object? event) {
    loggy.debug('\n${bloc.runtimeType}\n$event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    loggy.debug('\n${bloc.runtimeType}\n$transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    loggy.error('\n${bloc.runtimeType}\n$error\n$stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
