import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension RiverpodExtension on Ref {
  CancelToken get cancelToken {
    final token = CancelToken();

    onDispose(token.cancel);

    return token;
  }

  Future<void> debounce(Duration delay) {
    final completer = Completer<void>();

    final timer = Timer(delay, () {
      if (!completer.isCompleted) completer.complete();
    });

    onDispose(() {
      timer.cancel();
      if (!completer.isCompleted) {
        completer.completeError(StateError('cancelled'));
      }
    });

    return completer.future;
  }
}
