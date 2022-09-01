import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/bloc/settings_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/bloc/settings_event.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/logged_in_settings_buttons.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

const themeModeMap = {
  ThemeMode.system: 'Sistema',
  ThemeMode.dark: 'Escuro',
  ThemeMode.light: 'Claro',
};

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (context.read<AuthBloc>().state is LoggedIn)
                      Text(
                        'Olá, ${SettingsBloc.of(context).state.session?.contato.nome.split(' ')[0]}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    const Divider(thickness: 1.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
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
                              value: context.select<SettingsBloc, ThemeMode>(
                                  (value) => value.state.themeMode),
                              selectedItemBuilder: (context) => ThemeMode.values
                                  .map(
                                    (mode) => Center(
                                      child: Text(
                                        themeModeMap[mode]!,
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
                                        themeModeMap[mode]!,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) => SettingsBloc.of(context)
                                  .add(SettingsEvent.themeModeChanged(value!)),
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
              if (SettingsBloc.of(context).state.session != null)
                const LoggedInSettingsButtons()
            ],
          ),
        ),
      ),
    );
  }
}
