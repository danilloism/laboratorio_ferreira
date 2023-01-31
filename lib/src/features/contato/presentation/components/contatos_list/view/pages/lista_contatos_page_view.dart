import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/controllers/pagination_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/widgets.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/data/repositories/contato_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/contatos_list/view/widgets/contato_card.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/contatos_list/view/widgets/criar_contato_button.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/store/contatos_store.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

final contatosListController = StateNotifierProvider.autoDispose<
    AsyncPaginationController<Contato>, AsyncValue<void>>(
  (ref) => AsyncPaginationController<Contato>(
    fetchItems: ref.watch(contatoRepositoryProvider).getMany,
    store: ref.watch(contatosStoreProvider.notifier),
    itemsPerBatch: 10,
  ),
);

class ContatosPageView extends ConsumerWidget {
  const ContatosPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuarioLogado = ref.watch(usuarioLogadoProvider) ?? Contato.empty;
    final podeCriarContato =
        usuarioLogado.temHierarquiaMaiorOuIgualQue(Roles.gerente) ||
            usuarioLogado.isDentistaEspacoOdontologico;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Column(
            children: [
              const SearchBar(),
              const SizedBox(height: 8),
              Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: podeCriarContato
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.end,
                children: [
                  if (podeCriarContato) const CriarContatoButton(),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Icon(Icons.filter_list_rounded),
                        SizedBox(width: 8),
                        Text('Filtrar'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Consumer(builder: (context, ref, _) {
              final contatosList = ref.watch(contatosListController);

              final contatosListNotifier =
                  ref.read(contatosListController.notifier);
              return InfiniteList(
                hasReachedMax: contatosListNotifier.hasReachedMax,
                itemCount: ref.watch(contatosStoreProvider).length,
                itemBuilder: (context, index) => ContatoCard(
                    contato: ref.read(contatosStoreProvider)[index]),
                onFetchData: contatosListNotifier.fetchData,
                emptyBuilder: (_) => const Text('Nada por aqui...'),
                isLoading: contatosList.isLoading,
                debounceDuration: const Duration(seconds: 3),
                hasError: contatosList.hasError,
                errorBuilder: (context) {
                  return Center(
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Ops, parece que aconteceu um erro...'),
                          TextButton(
                              onPressed: contatosListNotifier.fetchData,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('Recarregar'),
                                  SizedBox(width: 8),
                                  Icon(Icons.refresh),
                                ],
                              )),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
