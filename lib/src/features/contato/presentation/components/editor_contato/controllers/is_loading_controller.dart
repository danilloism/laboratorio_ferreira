import 'package:flutter_riverpod/flutter_riverpod.dart';

class IsLoading extends AutoDisposeNotifier<bool> {
  @override
  bool build() => false;

  void switchValue() {
    state = !state;
  }
}

final isLoadingProvider = NotifierProvider.autoDispose(IsLoading.new);
