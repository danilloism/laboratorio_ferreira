import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/build_context_extension.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/widgets.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/contatos_list/view/widgets/criar_contato_button.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/contatos_list/view/widgets/on_going_bottom.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/contatos_list/view/widgets/contatos_list.dart';

class ContatosPageView extends HookConsumerWidget {
  const ContatosPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    useEffect(() {
      void listener() {
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.position.pixels;
        final delta = context.mediaQuery.size.width * 0.1;

        if (maxScroll - currentScroll <= delta &&
            scrollController.position.axisDirection == AxisDirection.down) {
          ref.read(contatosFetchProvider.notifier).fetchNext();
        }
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    final usuarioLogado = ref.watch(usuarioLogadoProvider) ?? Contato.empty;
    final podeCriarContato =
        usuarioLogado.temHierarquiaMaiorOuIgualQue(Roles.gerente) ||
            usuarioLogado.isDentistaEspacoOdontologico;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          controller: scrollController,
          restorationId: 'ContatosList',
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
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
            ),
            const ContatosList(),
            // const OnGoingBottom(),
          ],
        ),
      ),
    );
  }
}
