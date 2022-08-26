import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/src/features/local_storage/models/local_storage_item.freezed.dart';

@Freezed(genericArgumentFactories: true)
class LocalStorageItem<T> with _$LocalStorageItem<T> {
  factory LocalStorageItem(dynamic key, T value) = _LocalStorageItem;
}
