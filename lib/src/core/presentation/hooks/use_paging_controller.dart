import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

PagingController usePagingController<PageKeyType, ItemType>({
  required PageKeyType firstPageKey,
  int? invisibleItemsThreshold,
}) {
  return use<PagingController>(_PagingControllerHook<PageKeyType, ItemType>(
    firstPageKey: firstPageKey,
    invisibleItemsThreshold: invisibleItemsThreshold,
  ));
}

class _PagingControllerHook<PageKeyType, ItemType>
    extends Hook<PagingController> {
  const _PagingControllerHook({
    required this.firstPageKey,
    this.invisibleItemsThreshold,
  });
  final PageKeyType firstPageKey;
  final int? invisibleItemsThreshold;

  @override
  _PagingControllerHookState<PageKeyType, ItemType> createState() =>
      _PagingControllerHookState<PageKeyType, ItemType>();
}

class _PagingControllerHookState<PageKeyType, ItemType> extends HookState<
    PagingController, _PagingControllerHook<PageKeyType, ItemType>> {
  late final controller = PagingController<PageKeyType, ItemType>(
      firstPageKey: hook.firstPageKey,
      invisibleItemsThreshold: hook.invisibleItemsThreshold);

  @override
  PagingController<PageKeyType, ItemType> build(BuildContext context) =>
      controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
