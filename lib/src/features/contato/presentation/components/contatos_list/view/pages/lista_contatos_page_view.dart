import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/hooks/use_paging_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/widgets.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/data/repositories/contato_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/pagination.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/contatos_list/view/widgets/contato_card.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/contatos_list/view/widgets/criar_contato_button.dart';

const itemsPerPage = 10;

class ContatosPageView extends HookConsumerWidget {
  const ContatosPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingController =
        usePagingController(firstPageKey: 0) as PagingController<int, Contato>;

    Future<void> listener(pageKey) async {
      try {
        final contatos = await ref.read(contatoRepositoryProvider).getMany(
                pagination: Pagination(
              take: itemsPerPage,
              skip: pageKey * itemsPerPage,
            ));

        final isLastPage = contatos.length < itemsPerPage;
        if (isLastPage) {
          pagingController.appendLastPage(contatos);
        } else {
          final nextPageKey = pageKey + contatos.length;
          pagingController.appendPage(contatos, nextPageKey);
        }
      } catch (e) {
        pagingController.error = e;
      }
    }

    useEffect(() {
      pagingController.addPageRequestListener(listener);

      return () {
        pagingController.removePageRequestListener(listener);
      };
    }, []);

    final usuarioLogado = ref.watch(usuarioLogadoProvider) ?? Contato.empty;
    final podeCriarContato =
        usuarioLogado.temHierarquiaMaiorOuIgualQue(Roles.gerente) ||
            usuarioLogado.isDentistaEspacoOdontologico;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => Future.sync(
                () => pagingController.refresh(),
              ),
              child: PagedListView<int, Contato>(
                pagingController: pagingController,
                builderDelegate: PagedChildBuilderDelegate(
                  itemBuilder: (context, contato, index) {
                    return ContatoCard(contato: contato);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
