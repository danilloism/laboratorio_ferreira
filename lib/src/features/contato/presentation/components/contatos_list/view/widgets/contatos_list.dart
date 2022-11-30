import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/controllers/pagination_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/states/pagination_state.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/paginated_async_sliver.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/data/repositories/contato_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/contatos_list/view/widgets/contato_card.dart';

final contatosFetchProvider = StateNotifierProvider.autoDispose<
    PaginationController<Contato>, PaginationState<Contato>>(
  (ref) => PaginationController(
    itemsPerBatch: 20,
    fetchItems: ref.watch(contatoRepositoryProvider).getMany,
  ),
);

class ContatosList extends ConsumerWidget {
  const ContatosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(contatosFetchProvider);
    return PaginatedAsyncSliver(
      value: value,
      data: (contatos) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ContatoCard(contato: contatos[index]);
          },
          childCount: contatos.length,
        ),
      ),
      onTryAgainClicked:
          ref.read(contatosFetchProvider.notifier).fetchFirstBatch,
    );
  }
}
