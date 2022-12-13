import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/states/store.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/pagination.dart';

// part '../../../../generated/src/core/presentation/controllers/pagination_controller.freezed.dart';
// part '../../../../generated/src/core/presentation/controllers/pagination_controller.g.dart';
//
// @Freezed(copyWith: false)
// class PaginationControllerParams<T> with _$PaginationControllerParams<T> {
//   const factory PaginationControllerParams({
//     required Future<List<T>> Function({Pagination? pagination}) fetchItems,
//     @Default(20) int itemsPerBatch,
//     required Store<T> store,
//   }) = _PaginationControllerParams<T>;
// }

class AsyncPaginationController<T> extends StateNotifier<AsyncValue<void>> {
  AsyncPaginationController({
    required Future<List<T>> Function({Pagination? pagination}) fetchItems,
    int itemsPerBatch = 20,
    required Store<T> store,
  })  : _pagination = Pagination(skip: store.length, take: itemsPerBatch),
        _fetchItems = fetchItems,
        _store = store,
        super(const AsyncLoading()) {
    if (_store.isEmpty) {
      fetchData();
    }
  }

  final Future<List<T>> Function({Pagination? pagination}) _fetchItems;
  Pagination _pagination;
  final Store<T> _store;

  Future<void> fetchData() async {
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
      state = AsyncData(_store.addAll(newItems));
      _increasePagination();
      return;
    }

    state = result;
  }
}
//
// @riverpod
// class PaginationController<T extends Object?> extends _$PaginationController {
//   @override
//   Future<void> build(PaginationControllerParams arg) async {
//     _params = arg as PaginationControllerParams<T>;
//     _pagination =
//         Pagination(skip: _params.store.length, take: _params.itemsPerBatch);
//
//     if (_params.store.isEmpty) {
//       await _params.fetchItems();
//     }
//   }
//
//   late Pagination _pagination;
//   late final PaginationControllerParams<T> _params;
//
//   Future<void> fetchData() async {
//     final result = await AsyncValue.guard(
//         () => _params.fetchItems(pagination: _pagination));
//     _updateData(result);
//   }
//
//   void _increasePagination() {
//     _pagination = _pagination.copyWith(skip: _params.store.length);
//   }
//
//   void _updateData(AsyncValue<List<T>> result) {
//     if (result is AsyncData<List<T>>) {
//       final newItems = result.requireValue;
//       state = AsyncData(_params.store.addAll(newItems));
//       _increasePagination();
//       return;
//     }
//
//     state = result;
//   }
// }
