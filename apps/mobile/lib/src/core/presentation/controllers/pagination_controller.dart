import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/states/store.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/pagination.dart';

class AsyncPaginationController<T> extends StateNotifier<AsyncValue<void>> {
  AsyncPaginationController({
    required Future<List<T>> Function({Pagination? pagination}) fetchItems,
    this.itemsPerBatch = 20,
    required Store<T> storeNotifier,
  })  : _pagination =
            Pagination(skip: storeNotifier.length, take: itemsPerBatch),
        _fetchItems = fetchItems,
        _storeNotifier = storeNotifier,
        super(const AsyncLoading()) {
    if (_storeNotifier.isEmpty) {
      fetchData();
    }
  }

  final int itemsPerBatch;
  bool _hasReachedMax = false;

  bool get hasReachedMax => _hasReachedMax;
  List<T> get items => _storeNotifier.items;

  final Future<List<T>> Function({Pagination? pagination}) _fetchItems;
  Pagination _pagination;
  final Store<T> _storeNotifier;

  Future<void> fetchData() async {
    state = const AsyncLoading();

    final result =
        await AsyncValue.guard(() => _fetchItems(pagination: _pagination));
    _updateData(result);
  }

  void _increasePagination() {
    _pagination = _pagination.copyWith(skip: _storeNotifier.length);
  }

  void _updateData(AsyncValue<List<T>> result) {
    if (result is AsyncData<List<T>>) {
      final newItems = result.requireValue;

      if (newItems.length < itemsPerBatch) {
        _hasReachedMax = true;
      }

      state = AsyncData(_storeNotifier.addAll(newItems));
      _increasePagination();
      return;
    }

    state = result;
  }
}
