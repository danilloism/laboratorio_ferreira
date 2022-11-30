import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

PagingController usePagingController<PageKeyType, ItemType>({
  required PageKeyType firstPageKey,
  int? invisibleItemsThreshold,
}) {
  return use(_PagingControllerHook(
    firstPageKey: firstPageKey,
    invisibleItemsThreshold: invisibleItemsThreshold,
  ));
}

class _PagingControllerHook<PageKeyType, ItemType>
    extends Hook<PagingController> {
  const _PagingControllerHook({
    required this.firstPageKey,
    // ignore: unused_element
    super.keys,
    this.invisibleItemsThreshold,
  });
  final PageKeyType firstPageKey;
  final int? invisibleItemsThreshold;

  @override
  HookState<PagingController, Hook<PagingController>> createState() =>
      _PagingControllerHookState();
}

class _PagingControllerHookState<PageKeyType, ItemType>
    extends HookState<PagingController, _PagingControllerHook> {
  late final controller = PagingController<PageKeyType, ItemType>(
    firstPageKey: hook.firstPageKey,
    invisibleItemsThreshold: hook.invisibleItemsThreshold,
  );

  @override
  PagingController build(BuildContext context) => controller;

  @override
  void dispose() => controller.dispose();

  @override
  String get debugLabel => 'usePagingController';
}
