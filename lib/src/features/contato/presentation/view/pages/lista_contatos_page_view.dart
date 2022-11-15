import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/widgets.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/view/widgets/criar_contato_button.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';

class ContatosPageView extends ConsumerWidget {
  const ContatosPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuarioLogado =
        ref.watch(settingsNotifierProvider).session?.contato ?? Contato.empty;
    final podeCriarContato =
        usuarioLogado.temHierarquiaMaiorOuIgualQue(Roles.gerente) ||
            usuarioLogado.isDentistaEspacoOdontologico;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SearchBar(),
            const SizedBox(height: 8),
            Row(
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
    );
  }
}
