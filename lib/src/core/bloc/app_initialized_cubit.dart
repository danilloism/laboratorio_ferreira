import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefreshTokenOnAppInitializationCubit extends Cubit<bool> {
  RefreshTokenOnAppInitializationCubit({
    required Stream<ConnectivityResult> connectivityResultStream,
    required bool appInitializedLoggedIn,
  }) : super(false) {
    _sub = connectivityResultStream.listen((event) {
      if (event != ConnectivityResult.none &&
          event != ConnectivityResult.bluetooth &&
          appInitializedLoggedIn) {
        emit(true);
      }
    });
  }

  late final StreamSubscription<ConnectivityResult> _sub;

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
