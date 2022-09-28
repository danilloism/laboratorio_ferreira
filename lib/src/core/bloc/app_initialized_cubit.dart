import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/bloc/bloc.dart';

class RefreshTokenOnAppInitializationCubit extends Cubit<bool> {
  RefreshTokenOnAppInitializationCubit({
    required ConnectivityCubit connectivityCubit,
    required bool appInitializedLoggedIn,
  }) : super(false) {
    _sub = connectivityCubit.stream.listen((event) {
      if (connectivityCubit.isConnected && appInitializedLoggedIn) {
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
