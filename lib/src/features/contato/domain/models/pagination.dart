import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../../generated/src/features/contato/domain/models/pagination.freezed.dart';

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    @Default(0) int skip,
    @Default(20) int take,
  }) = _Pagination;
}
