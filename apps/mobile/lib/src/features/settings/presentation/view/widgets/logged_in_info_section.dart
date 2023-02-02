import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/misc.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/view/widgets/widgets.dart';

class LoggedInInfoSection extends ConsumerWidget {
  const LoggedInInfoSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.read(settingsControllerProvider);
    final contato = settings.session!.contato;
    return Column(
      children: [
        Text(
          'Olá, ${contato.nome.split(' ')[0]}',
          textAlign: TextAlign.center,
          style: context.theme.textTheme.headlineSmall,
        ),
        const Divider(thickness: 1.5),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Meu contato',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    IconButton(
                        onPressed: () {
                          context.push('/settings/editar_contato');
                        },
                        icon: const Icon(Icons.edit_note_outlined))
                  ],
                ),
                const Text('Telefones:'),
                Consumer(builder: (context, ref, _) {
                  final contatoRef = ref.watch(settingsControllerProvider
                      .select((value) => value.session!.contato));
                  return Wrap(
                    spacing: 10,
                    children: [
                      ...contatoRef.telefones.map((telefone) => Chip(
                            label: Text(
                              Formatter.applyPhoneMask(telefone),
                              style: context.theme.textTheme.bodyMedium,
                            ),
                          )),
                    ],
                  );
                }),
                const Divider(thickness: 1.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Minha conta',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    IconButton(
                        onPressed: () {
                          context.push('/settings/editar_contato');
                        },
                        icon: const Icon(Icons.edit_note_outlined))
                  ],
                ),
                const Text('Email:'),
                Text(contato.account!.email),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
        if (ref
            .read(settingsControllerProvider)
            .session!
            .contato
            .temHierarquiaMaiorOuIgualQue(Roles.gerente))
          const GerenciarContasSection(),
      ],
    );
  }
}
