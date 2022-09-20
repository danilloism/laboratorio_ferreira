import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/config/config.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';

class LoggedInInfoSection extends StatelessWidget {
  const LoggedInInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = SettingsBloc.of(context).state;
    final contato = settings.session!.contato;
    return Column(
      children: [
        Text(
          'Olá, ${contato.nome.split(' ')[0]}',
          textAlign: TextAlign.center,
          style: context.theme.textTheme.headline5,
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
                        onPressed: () => context.pushNamed(
                            Routes.editarContato.name,
                            params: {'uid': 'me'}),
                        icon: const Icon(Icons.edit_note_outlined))
                  ],
                ),
                const Text('Telefones:'),
                Wrap(
                  spacing: 10,
                  children: [
                    ...contato.telefones.map((telefone) =>
                        Chip(label: Text(Formatter.applyPhoneMask(telefone)))),
                    ActionChip(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      label: const Icon(Icons.add, size: 15),
                      onPressed: () {
                        showDialog(
                          barrierDismissible: !Constants.isProduction,
                          context: context,
                          builder: (context) =>
                              const AdicionarTelefonesDialog(),
                        );
                      },
                    ),
                  ],
                ),
                const Divider(thickness: 1.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Minha conta',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    IconButton(
                        onPressed: () => context.pushNamed(
                            Routes.editarContato.name,
                            params: {'uid': 'me'}),
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
        if (SettingsBloc.of(context)
            .state
            .session!
            .contato
            .temHierarquiaMaiorOuIgualQue(Roles.gerente))
          const GerenciarContasSection(),
      ],
    );
  }
}
