import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/states/pagination_state.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/pagination.dart';

class PaginationController<T> extends StateNotifier<PaginationState<T>> {
  PaginationController({
    required Future<List<T>> Function({Pagination? pagination}) fetchItems,
    required int itemsPerBatch,
  })  : _pagination = Pagination(skip: 0, take: itemsPerBatch),
        _fetchItems = fetchItems,
        super(const PaginationLoading()) {
    _init();
  }

  final Future<List<T>> Function({Pagination? pagination}) _fetchItems;
  final List<T> _items = [];
  Pagination _pagination;

  var _timer = Timer(const Duration(microseconds: 0), () {});

  void _init() {
    if (_items.isEmpty) {
      fetchFirstBatch();
    }
  }

  Future<void> fetchFirstBatch() async {
    assert(_items.isEmpty);
    state = const PaginationLoading();
    final result = await PaginationState.guard(() => _fetchItems());
    _updateData(result);
  }

  Future<void> fetchNext() async {
    if (state is PaginationLoading || state is PaginationOnGoingLoading) return;
    state = PaginationOnGoingLoading(_items);
    if (_timer.isActive) {
      Timer(const Duration(seconds: 2), () => state = PaginationData(_items));
      return;
    }
    _timer = Timer(const Duration(seconds: 3), () {});

    final result = await PaginationState.guard(
      () => _fetchItems(pagination: _pagination),
      onGoingItems: _items,
    );
    _updateData(result);
  }

  void _increasePagination() {
    _pagination = _pagination.copyWith(skip: _pagination.skip + _items.length);
  }

  void _updateData(PaginationState<T> result) {
    if (result is PaginationData<T>) {
      final newItems = result.items;
      state = PaginationData([..._items..addAll(newItems)]);
      _increasePagination();
      return;
    }

    state = result;
  }
}
