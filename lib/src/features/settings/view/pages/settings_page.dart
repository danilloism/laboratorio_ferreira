import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/extensions/build_context_extension.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';

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
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (AuthBloc.of(context).state is LoggedIn)
                    const LoggedInInfoSection(),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tema',
                              style: context.theme.textTheme.bodyLarge),
                          DropdownButton<ThemeMode>(
                            underline: const SizedBox(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            dropdownColor:
                                context.theme.appBarTheme.backgroundColor,
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
                                    child: Text(themeModeMap[mode]!),
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
                  Card(
                    child: Column(
                      children: const [
                        Text('Entrar em contato:'),
                        TextField(),
                      ],
                    ),
                  ),
                ],
              ),
              // if (AuthBloc.of(context).state is LoggedIn)
              //   const LoggedInSettingsButtons()
            ],
          ),
        ),
      ),
    );
  }
}
