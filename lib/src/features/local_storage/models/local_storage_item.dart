import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/src/features/local_storage/models/local_storage_item.freezed.dart';

@freezed
class LocalStorageItem with _$LocalStorageItem {
  factory LocalStorageItem(dynamic key, dynamic value) = _LocalStorageItem;
}
