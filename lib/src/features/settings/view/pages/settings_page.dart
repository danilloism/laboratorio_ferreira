import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';
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
    final contato = SettingsBloc.of(context).state.session?.contato;

    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
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
                                selectedItemBuilder: (context) =>
                                    ThemeMode.values
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
                                    .add(
                                        SettingsEvent.themeModeChanged(value!)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (contato == null ||
                          !contato
                              .temHierarquiaMaiorOuIgualQue(Roles.colaborador))
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
            if (AuthBloc.of(context).state is LoggedIn)
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 4),
                    onPressed: () {
                      context.goNamed(
                          Routes.welcome.name); //TODO: ta feio isso aqui
                      AuthBloc.of(context)
                          .add(const AuthEvent.logOutButtonPressed());
                    },
                    child: const Text('Sair'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
