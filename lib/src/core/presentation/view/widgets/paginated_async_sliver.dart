import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/states/pagination_state.dart';

class PaginatedAsyncSliver<T> extends StatelessWidget {
  const PaginatedAsyncSliver({
    super.key,
    required this.value,
    required this.data,
  });
  final PaginationState<T> value;
  final Widget Function(List<T>) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator())),
      error: (e, __) => SliverToBoxAdapter(
        child: Center(
          child: Text(
            e.toString(),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.red),
          ),
        ),
      ),
      onGoingError: (items, _, __) => data(items),
      onGoingLoading: (items) => data(items),
    );
  }
}
