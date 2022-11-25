import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../../../generated/src/features/contato/presentation/components/editor_contato/controllers/is_loading_controller.g.dart';

@riverpod
class IsLoading extends _$IsLoading {
  @override
  bool build() => false;

  void switchValue() {
    state = !state;
  }
}
