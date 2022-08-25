import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/enums/routes.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/providers/theme_mode_notifier_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/auth_notifier_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/enums/roles_enum.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref
        .watch(authNotifierProvider.notifier.select((value) => value.session));
    final themeNotifier = ref.read(themeModeNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olá, ${session?.contato.nome.split(' ')[0]}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const Divider(thickness: 1.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => context
                              .push('${Routes.detalhesContato.fullPath}/me'),
                          child: Text(
                            'Ver meu contato',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Editar conta',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tema',
                                style: Theme.of(context).textTheme.bodyLarge),
                            DropdownButton<ThemeMode>(
                              underline: const SizedBox(),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              dropdownColor:
                                  Theme.of(context).appBarTheme.backgroundColor,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Theme.of(context).primaryColorLight,
                                    fontWeight: FontWeight.bold,
                                  ),
                              value: ref.watch(themeModeNotifierProvider),
                              selectedItemBuilder: (context) => ThemeMode.values
                                  .map(
                                    (mode) => Center(
                                      child: Text(
                                        themeNotifier.themeModeMap[mode]!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              items: ThemeMode.values
                                  .map(
                                    (mode) => DropdownMenuItem(
                                      value: mode,
                                      child: Text(
                                        themeNotifier.themeModeMap[mode]!,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) =>
                                  themeNotifier.setMode(value!),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  session!.contato.categorias.contains(RolesEnum.admin) ||
                          session.contato.categorias.contains(RolesEnum.gerente)
                      ? ElevatedButton(
                          onPressed: () {},
                          child: const Text('Criar nova conta'),
                        )
                      : const SizedBox.expand(),
                  ElevatedButton(
                    onPressed: () =>
                        ref.read(authNotifierProvider.notifier).logout(),
                    child: const Text('Sair'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
