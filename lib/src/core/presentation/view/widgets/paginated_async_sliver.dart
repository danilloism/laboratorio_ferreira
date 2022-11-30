import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/states/pagination_state.dart';

class PaginatedAsyncSliver<T> extends StatelessWidget {
  const PaginatedAsyncSliver({
    super.key,
    required this.value,
    required this.data,
    required this.onTryAgainClicked,
  });
  final PaginationState<T> value;
  final Widget Function(List<T>) data;
  final FutureOr<void> Function() onTryAgainClicked;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator())),
      error: (e, __) => SliverToBoxAdapter(
        child: Center(
          child: Column(
            children: [
              Text(
                'Ops... parece que aconteceu um erro.',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.red),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: onTryAgainClicked,
                child: const Text('Tentar novamente'),
              ),
            ],
          ),
        ),
      ),
      onGoingError: (items, _, __) => data(items),
      onGoingLoading: (items) => data(items),
    );
  }
}
