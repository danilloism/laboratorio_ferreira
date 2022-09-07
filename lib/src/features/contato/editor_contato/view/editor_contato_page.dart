import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';

class EditorContatoPage<T> extends StatelessWidget {
  const EditorContatoPage({super.key});

  _podeEditarCategorias(Contato contato) {
    if (contato.categorias.any((categoria) =>
        categoria == Roles.admin ||
        categoria == Roles.gerente ||
        categoria == Roles.colaborador)) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    // final contato = ref.watch(_contatoProvider);
    // final contatoNotifier = ref.read(_contatoProvider.notifier);
    // final userSession =
    //     ref.read(authNotifierProvider.notifier).session!.contato;
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(contato.uid == null ? 'Criar Contato' : 'Editar Contato'),
    //     leading: IconButton(
    //         icon: const Icon(Icons.arrow_back),
    //         onPressed: () {
    //           if (contato != _contatoOriginal) {
    //             showDialog(
    //               context: context,
    //               builder: (context) {
    //                 return AlertDialog(
    //                   title: const Text(
    //                       'Há alterações não salvas, deseja mesmo voltar?'),
    //                   actions: [
    //                     ElevatedButton(
    //                         onPressed: () =>
    //                             Navigator.of(context, rootNavigator: true)
    //                                 .pop('dialog'),
    //                         child: const Text('Não')),
    //                     TextButton(
    //                         onPressed: () => context.pop(),
    //                         child: const Text('Sim'))
    //                   ],
    //                 );
    //               },
    //             );
    //           } else {
    //             context.pop();
    //           }
    //         }),
    //     actions: [
    //       IconButton(
    //         onPressed: ref.watch(_editorContatoStateProvider).when(
    //             done: () => null,
    //             editing: () => () async {
    //                   ref.read(_editorContatoStateProvider.state).state =
    //                       const EditingContatoState.done();
    //
    //                   if (_formKey.currentState!.validate()) {
    //                     // contatoNotifier.atualizarNome(_nomeController.text);
    //                     if (contato == _contatoOriginal) {
    //                       context.pop();
    //                       return;
    //                     }
    //
    //                     final contatoAtualizado = await ref
    //                         .read(contatoRepositoryProvider)
    //                         .update(contato);
    //                     if (contato.uid == userSession.uid &&
    //                         contatoAtualizado.sucesso) {
    //                       final session = ref
    //                           .read(authNotifierProvider.notifier)
    //                           .resetContatoSession(contatoAtualizado.dados!);
    //                     }
    //
    //                     Future.value().whenComplete(() => context.pop());
    //                     return;
    //                   }
    //
    //                   ref.read(_editorContatoStateProvider.state).state =
    //                       const EditingContatoState.editing();
    //                 }),
    //         icon: const Icon(Icons.done),
    //       ),
    //     ],
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Form(
    //       key: _formKey,
    //       child: ListView(
    //         children: [
    //           const SizedBox(height: 8),
    //           FormSection(
    //             title: 'Nome',
    //             child: CustomTextFormField(
    //               controller: _nomeController,
    //               validator: (value) {
    //                 if (value == null || value.isEmpty) {
    //                   return 'Campo obrigatório.';
    //                 }
    //
    //                 return null;
    //               },
    //             ),
    //           ),
    //           if (_podeEditarCategorias(userSession))
    //             Padding(
    //               padding: const EdgeInsets.symmetric(vertical: 20),
    //               child: FormSection(
    //                 title: 'Categorias',
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Wrap(
    //                       spacing: 10,
    //                       children: contato.categorias
    //                           .map((categoria) => Chip(
    //                                 label: Text(categoria.capitalized),
    //                               ))
    //                           .toList(),
    //                     ),
    //                     if (_podeEditarCategorias(userSession))
    //                       EditarCategoriasButton(
    //                           ref: ref, notifierProvider: _contatoProvider),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           FormSection(
    //               title: 'Telefones',
    //               child: Column(
    //                 children: _telefonesControllers
    //                     .map((controller) => CustomTextFormField(
    //                           keyboardType: TextInputType.phone,
    //                           controller: controller,
    //                         ))
    //                     .toList(),
    //               )),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return const Center();
  }
}
