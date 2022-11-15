import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NetworkStatus { on, off, unknown }

class NetworkStatusNotifier extends StateNotifier<NetworkStatus> {
  late final StreamSubscription _sub;

  NetworkStatusNotifier() : super(NetworkStatus.unknown) {
    _sub = Connectivity().onConnectivityChanged.listen((event) {
      switch (event) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.mobile:
        case ConnectivityResult.ethernet:
          state = NetworkStatus.on;
          break;
        default:
          state = NetworkStatus.off;
          break;
      }
    }, cancelOnError: true);
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

final networkStatusProvider =
    StateNotifierProvider<NetworkStatusNotifier, NetworkStatus>(
        (ref) => NetworkStatusNotifier());
