import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/contatos_list/view/widgets/contatos_list.dart';

class OnGoingBottom extends StatelessWidget {
  const OnGoingBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer(
        builder: (context, ref, child) {
          final paginationState = ref.watch(contatosFetchProvider);

          return Padding(
            padding: const EdgeInsets.all(30),
            child: paginationState.maybeWhen(
              onGoingLoading: (_) {
                return const Center(child: CircularProgressIndicator());
              },
              onGoingError: (_, __, ___) => Center(
                child: Column(
                  children: const [
                    Icon(Icons.info),
                    SizedBox(height: 20),
                    Text('Algo deu errado :('),
                  ],
                ),
              ),
              orElse: () => const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
