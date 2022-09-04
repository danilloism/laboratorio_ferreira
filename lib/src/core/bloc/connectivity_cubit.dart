import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityCubit extends Cubit<ConnectivityResult> {
  late final StreamSubscription<ConnectivityResult> _streamSub;

  ConnectivityCubit(super.initialState) {
    _streamSub =
        Connectivity().onConnectivityChanged.listen((result) => emit(result));
  }

  bool get isConnected => state != ConnectivityResult.none;

  @override
  Future<void> close() {
    _streamSub.cancel();
    return super.close();
  }
}
