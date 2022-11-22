import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';

const themeModeMap = {
  ThemeMode.system: 'Sistema',
  ThemeMode.dark: 'Escuro',
  ThemeMode.light: 'Claro',
};

class ThemeDropdowns extends StatelessWidget {
  const ThemeDropdowns({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer(
          builder: (context, ref, _) {
            return DropdownMenu<bool>(
              value: ref.watch(settingsNotifierProvider
                  .select((value) => value.useMaterial3)),
              selectedItemBuilder: (context) => const [
                Center(
                  child: Text(
                    'Clássico',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Moderno',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              items: const [
                DropdownMenuItem(
                  value: false,
                  child: Text('Clássico'),
                ),
                DropdownMenuItem(
                  value: true,
                  child: Text('Moderno'),
                )
              ],
              onChanged: (value) => ref
                  .read(settingsNotifierProvider.notifier)
                  .changeUseMaterial3(value!),
            );
          },
        ),
        const SizedBox(width: 12),
        Consumer(builder: (context, ref, _) {
          return DropdownMenu<ThemeMode>(
            value: ref.watch(
                settingsNotifierProvider.select((value) => value.themeMode)),
            selectedItemBuilder: (context) => ThemeMode.values
                .map(
                  (mode) => Center(
                    child: Text(
                      themeModeMap[mode]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
            onChanged: (value) =>
                ref.read(settingsNotifierProvider.notifier).changeTheme(value!),
          );
        }),
      ],
    );
  }
}
