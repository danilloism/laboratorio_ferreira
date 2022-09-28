import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NetworkStatus { on, off, unknown }

class NetworkStatusNotifier extends StateNotifier<NetworkStatus> {
  NetworkStatusNotifier() : super(NetworkStatus.unknown) {
    Connectivity().onConnectivityChanged.listen((event) {
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
    });
  }

  void init() {}
}

final networkStatusProvider =
    StateNotifierProvider<NetworkStatusNotifier, NetworkStatus>(
        (ref) => NetworkStatusNotifier());
