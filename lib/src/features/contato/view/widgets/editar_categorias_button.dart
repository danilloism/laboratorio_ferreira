// class EditarCategoriasButton extends StatelessWidget {
//   // final WidgetRef ref;
//   // final StateNotifierProvider<EditorContatoNotifier, Contato> notifierProvider;
//
//   const EditarCategoriasButton(
//       {super.key, required this.ref, required this.notifierProvider});
//
//   @override
//   Widget build(BuildContext context) {
//     final userSession =
//         ref.read(authNotifierProvider.notifier).session!.contato;
//     return TextButton(
//       onPressed: () {
//         showDialog(
//           context: context,
//           barrierDismissible: true,
//           builder: (context) {
//             return Consumer(
//               builder: (context, ref, _) {
//                 final contato = ref.watch(notifierProvider);
//                 final notifier = ref.read(notifierProvider.notifier);
//                 return Dialog(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Wrap(
//                       spacing: 10,
//                       children: RolesEnum.values
//                           .skipWhile((value) => value == RolesEnum.admin)
//                           .map(
//                             (role) => RawChip(
//                               isEnabled: role != RolesEnum.admin ||
//                                   (userSession.uid == contato.uid &&
//                                       !userSession.categorias
//                                           .contains(RolesEnum.admin) &&
//                                       role != RolesEnum.gerente),
//                               label: Text(role.capitalized),
//                               selected: contato.categorias.contains(role),
//                               tapEnabled: true,
//                               onSelected: (selected) {
//                                 if (selected) {
//                                   notifier.addCategoria(role);
//                                   return;
//                                 }
//
//                                 notifier.removeCategoria(role);
//                               },
//                             ),
//                           )
//                           .toList(),
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         );
//       },
//       child: const Text('Editar categorias'),
//     );
//   }
// }
