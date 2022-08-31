import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              // Expanded(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Olá, ${session?.contato.nome.split(' ')[0]}',
              //         textAlign: TextAlign.center,
              //         style: Theme.of(context).textTheme.headline5,
              //       ),
              //       const Divider(thickness: 1.5),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           ElevatedButton(
              //             onPressed: () {},
              //             child: Text(
              //               'Ver meu contato',
              //               style: Theme.of(context).textTheme.bodyLarge,
              //             ),
              //           ),
              //           ElevatedButton(
              //             onPressed: () {},
              //             child: Text(
              //               'Editar conta',
              //               style: Theme.of(context).textTheme.bodyLarge,
              //             ),
              //           ),
              //         ],
              //       ),
              //       const SizedBox(height: 16),
              //       Card(
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text('Tema',
              //                   style: Theme.of(context).textTheme.bodyLarge),
              //               DropdownButton<ThemeMode>(
              //                 underline: const SizedBox(),
              //                 borderRadius:
              //                     const BorderRadius.all(Radius.circular(10)),
              //                 dropdownColor:
              //                     Theme.of(context).appBarTheme.backgroundColor,
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .bodyLarge!
              //                     .copyWith(
              //                       color: Theme.of(context).primaryColorLight,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                 value: ref.watch(themeModeNotifierProvider),
              //                 selectedItemBuilder: (context) => ThemeMode.values
              //                     .map(
              //                       (mode) => Center(
              //                         child: Text(
              //                           themeNotifier.themeModeMap[mode]!,
              //                           style: const TextStyle(
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                       ),
              //                     )
              //                     .toList(),
              //                 items: ThemeMode.values
              //                     .map(
              //                       (mode) => DropdownMenuItem(
              //                         value: mode,
              //                         child: Text(
              //                           themeNotifier.themeModeMap[mode]!,
              //                           style: const TextStyle(
              //                               color: Colors.white),
              //                         ),
              //                       ),
              //                     )
              //                     .toList(),
              //                 onChanged: (value) =>
              //                     themeNotifier.setMode(value!),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       const SizedBox(height: 16),
              //       Card(
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           ),
              //         ),
              //       ),
              //       const SizedBox(height: 16),
              //     ],
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     session!.contato.categorias.contains(RolesEnum.admin) ||
              //             session.contato.categorias.contains(RolesEnum.gerente)
              //         ? ElevatedButton(
              //             onPressed: () {},
              //             child: const Text('Criar nova conta'),
              //           )
              //         : const SizedBox.expand(),
              //     ElevatedButton(
              //       onPressed: () => ref
              //           .read(authNotifierProvider.notifier)
              //           .resetHttpClientToken(),
              //       child: const Text('Sair'),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
