import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityCubit extends Cubit<ConnectivityResult> {
  late final StreamSubscription<ConnectivityResult> _streamSub;

  ConnectivityCubit(super.initialState) {
    _streamSub =
        Connectivity().onConnectivityChanged.listen((result) => emit(result));
  }

  bool get isConnected =>
      state != ConnectivityResult.none && state != ConnectivityResult.bluetooth;

  @override
  Future<void> close() {
    _streamSub.cancel();
    return super.close();
  }

  static ConnectivityCubit of(BuildContext context) =>
      context.read<ConnectivityCubit>();
}
