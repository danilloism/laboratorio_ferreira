import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/src/core/presentation/states/pagination_state.freezed.dart';

@freezed
class PaginationState<T> with _$PaginationState<T> {
  const factory PaginationState.data(List<T> items) = PaginationData;
  const factory PaginationState.loading() = PaginationLoading;
  const factory PaginationState.error(Object? e, [StackTrace? stackTrace]) =
      PaginationError;
  const factory PaginationState.onGoingLoading(List<T> items) =
      PaginationOnGoingLoading;
  const factory PaginationState.onGoingError(List<T> items, Object? e,
      [StackTrace? stackTrace]) = PaginationOnGoingError;

  static Future<PaginationState<T>> guard<T>(Future<List<T>> Function() future,
      {List<T>? onGoingItems}) async {
    try {
      return PaginationData(await future());
    } catch (err, stack) {
      return onGoingItems != null
          ? PaginationOnGoingError(onGoingItems, err, stack)
          : PaginationError(err, stack);
    }
  }
}
