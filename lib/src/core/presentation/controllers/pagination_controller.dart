import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/states/store.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/pagination.dart';

class AsyncPaginationController<T> extends StateNotifier<AsyncValue<void>> {
  AsyncPaginationController({
    required Future<List<T>> Function({Pagination? pagination}) fetchItems,
    this.itemsPerBatch = 20,
    required Store<T> store,
  })  : _pagination = Pagination(skip: store.length, take: itemsPerBatch),
        _fetchItems = fetchItems,
        _store = store,
        super(const AsyncLoading()) {
    if (_store.isEmpty) {
      fetchData();
    }
  }

  final int itemsPerBatch;
  bool _hasReachedMax = false;

  bool get hasReachedMax => _hasReachedMax;
  List<T> get items => _store.items;

  final Future<List<T>> Function({Pagination? pagination}) _fetchItems;
  Pagination _pagination;
  final Store<T> _store;

  Future<void> fetchData() async {
    state = const AsyncLoading();

    final result =
        await AsyncValue.guard(() => _fetchItems(pagination: _pagination));
    _updateData(result);
  }

  void _increasePagination() {
    _pagination = _pagination.copyWith(skip: _store.length);
  }

  void _updateData(AsyncValue<List<T>> result) {
    if (result is AsyncData<List<T>>) {
      final newItems = result.requireValue;

      if (newItems.length < itemsPerBatch) {
        _hasReachedMax = true;
      }

      state = AsyncData(_store.addAll(newItems));
      _increasePagination();
      return;
    }

    state = result;
  }
}
