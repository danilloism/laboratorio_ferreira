// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/editor_contato/view/categorias_form_section.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/editor_contato/view/name_form_section.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/editor_contato/view/telefones_form_section.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/bloc/bloc.dart';

class EditorContatoPage extends StatelessWidget {
  EditorContatoPage({super.key, Contato? contato})
      : _contato = contato ?? Contato.empty;
  final Contato _contato;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => EditorContatoCubit(_contato)),
        BlocProvider(create: (_) => EditorContatoStepCubit()),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(_contato.isEmpty ? 'Criar Contato' : 'Editar Contato'),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (_contato != EditorContatoCubit.of(context).state) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              'Há alterações não salvas, deseja mesmo voltar?'),
                          actions: [
                            ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context, rootNavigator: true)
                                        .pop('dialog'),
                                child: const Text('Não')),
                            TextButton(
                                onPressed: () => context.pop(),
                                child: const Text('Sim'))
                          ],
                        );
                      },
                    );
                  } else {
                    context.pop();
                  }
                }),
            actions: [
              BlocBuilder<EditorContatoStepCubit, EditingContatoState>(
                builder: (context, state) => state.when(
                    done: () => const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    editing: () => IconButton(
                          onPressed: () async {
                            UiHelper.closeKeyboard();
                            EditorContatoStepCubit.of(context).setDone();

                            final cubit = EditorContatoCubit.of(context);

                            if (cubit.errors.isNotEmpty) {
                              context.showErrorSnackBar(
                                  message:
                                      Formatter.fromErrorList(cubit.errors) ??
                                          'Erro desconhecido.');
                              EditorContatoStepCubit.of(context).setEditing();
                              return;
                            }

                            if (_contato == cubit.state) {
                              context.pop();
                              return;
                            }

                            try {
                              final repository =
                                  context.read<ContatoRepository>();

                              if (_contato.isEmpty) {
                                //TODO
                                // ignore: unused_local_variable
                                final contatoCriado =
                                    await repository.create(cubit.state);
                                context.pop();
                                return;
                              }
                              final settings = SettingsBloc.of(context).state;
                              final contatoAtualizado =
                                  await repository.update(cubit.state);
                              final itsMe =
                                  _contato.uid == settings.session?.contato.uid;
                              if (itsMe) {
                                final session = settings.session;
                                SettingsBloc.of(context).add(
                                    SettingsEvent.sessionChanged(
                                        session?.copyWith(
                                            contato: contatoAtualizado)));
                              }

                              context.pop();
                            } on RepositoryException catch (e) {
                              final erro = e.object?['data']['erro'];

                              if (erro is List) {
                                final erroCasted =
                                    List<String?>.from(erro, growable: false);

                                context.showErrorSnackBar(
                                    message:
                                        Formatter.fromErrorList(erroCasted)!);
                              }

                              if (erro is String?) {
                                context.showErrorSnackBar(
                                    message: '${erro ?? e.message}');
                              }

                              EditorContatoStepCubit.of(context).setEditing();
                            } catch (e) {
                              EditorContatoStepCubit.of(context).setEditing();
                              context.showErrorSnackBar(message: e.toString());
                              return;
                            }
                          },
                          icon: const Icon(Icons.done),
                        )),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              // key: _formKey,
              child: ListView(
                children: const [
                  SizedBox(height: 8),
                  NameFormSection(),
                  SizedBox(height: 20),
                  TelefonesFormSection(),
                  SizedBox(height: 4),
                  CategoriasFormSection(),
                  // if (_podeEditarCategorias(userSession))
                  //   Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 20),
                  //     child: FormSection(
                  //       title: 'Categorias',
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Wrap(
                  //             spacing: 10,
                  //             children: contato.categorias
                  //                 .map((categoria) => Chip(
                  //                       label: Text(categoria.capitalized),
                  //                     ))
                  //                 .toList(),
                  //           ),
                  //           if (_podeEditarCategorias(userSession))
                  //             EditarCategoriasButton(
                  //                 ref: ref, notifierProvider: _contatoProvider),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // FormSection(
                  //     title: 'Telefones',
                  //     child: Column(
                  //       children: _telefonesControllers
                  //           .map((controller) => CustomTextFormField(
                  //                 keyboardType: TextInputType.phone,
                  //                 controller: controller,
                  //               ))
                  //           .toList(),
                  //     )),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
