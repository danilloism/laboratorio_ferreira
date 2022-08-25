import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/auth_notifier_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/enums/roles_enum.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/view/widgets/custom_text_form_field.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/view/widgets/form_section.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/models/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/notifiers/editor_contato_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/providers/contato_repository_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/state/editing_contato_state.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/view/widgets/editar_categorias_button.dart';

class EditorContatoPage<T> extends ConsumerStatefulWidget {
  final StateNotifierProvider<EditorContatoNotifier, Contato>
      editorNotifierProvider;

  EditorContatoPage({super.key, Contato? contato})
      : editorNotifierProvider = StateNotifierProvider((ref) =>
            EditorContatoNotifier(contato ??
                const Contato(nome: '', telefones: [], categorias: [])));

  @override
  ConsumerState<EditorContatoPage> createState() =>
      _DetalhesContatoPageState<T>();
}

class _DetalhesContatoPageState<T> extends ConsumerState<EditorContatoPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _telefonesControllers = <TextEditingController>[];
  final _telefonesFormFieldCounter = StateProvider((ref) => 0);
  StateNotifierProvider<EditorContatoNotifier, Contato> get _contatoProvider =>
      widget.editorNotifierProvider;
  late final void Function() _nomeListener;
  late final Contato _contatoOriginal;
  final _editorContatoStateProvider = StateProvider<EditingContatoState>(
      (ref) => const EditingContatoState.editing());

  @override
  void initState() {
    final contato = ref.read(_contatoProvider);
    _contatoOriginal = contato;
    _nomeController.text = contato.nome;
    _nomeListener = () {
      ref.read(_contatoProvider.notifier).atualizarNome(_nomeController.text);
    };
    _nomeController.addListener(_nomeListener);
    for (final telefone in contato.telefones) {
      final controller = TextEditingController()..text = telefone;
      _telefonesControllers.add(controller);
    }
    ref.read(_telefonesFormFieldCounter.notifier).state =
        contato.telefones.length;
    super.initState();
  }

  @override
  void dispose() {
    _nomeController.removeListener(_nomeListener);
    _nomeController.dispose();
    for (final controller in _telefonesControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  _podeEditarCategorias(Contato contato) {
    if (contato.categorias.any((categoria) =>
        categoria == RolesEnum.admin ||
        categoria == RolesEnum.gerente ||
        categoria == RolesEnum.colaborador)) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final contato = ref.watch(_contatoProvider);
    final contatoNotifier = ref.read(_contatoProvider.notifier);
    final userSession =
        ref.read(authNotifierProvider.notifier).session!.contato;
    return Scaffold(
      appBar: AppBar(
        title: Text(contato.uid == null ? 'Criar Contato' : 'Editar Contato'),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (contato != _contatoOriginal) {
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
          IconButton(
            onPressed: ref.watch(_editorContatoStateProvider).when(
                done: () => null,
                editing: () => () async {
                      ref.read(_editorContatoStateProvider.state).state =
                          const EditingContatoState.done();

                      if (_formKey.currentState!.validate()) {
                        // contatoNotifier.atualizarNome(_nomeController.text);
                        if (contato == _contatoOriginal) {
                          context.pop();
                          return;
                        }

                        final contatoAtualizado = await ref
                            .read(contatoRepositoryProvider)
                            .update(contato);
                        if (contato.uid == userSession.uid &&
                            contatoAtualizado.sucesso) {
                          final session = ref
                              .read(authNotifierProvider.notifier)
                              .resetContatoSession(contatoAtualizado.dados!);
                        }

                        Future.value().whenComplete(() => context.pop());
                        return;
                      }

                      ref.read(_editorContatoStateProvider.state).state =
                          const EditingContatoState.editing();
                    }),
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 8),
              FormSection(
                title: 'Nome',
                child: CustomTextFormField(
                  controller: _nomeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório.';
                    }

                    return null;
                  },
                ),
              ),
              if (_podeEditarCategorias(userSession))
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: FormSection(
                    title: 'Categorias',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 10,
                          children: contato.categorias
                              .map((categoria) => Chip(
                                    label: Text(categoria.capitalized),
                                  ))
                              .toList(),
                        ),
                        if (_podeEditarCategorias(userSession))
                          EditarCategoriasButton(
                              ref: ref, notifierProvider: _contatoProvider),
                      ],
                    ),
                  ),
                ),
              FormSection(
                  title: 'Telefones',
                  child: Column(
                    children: _telefonesControllers
                        .map((controller) => CustomTextFormField(
                              keyboardType: TextInputType.phone,
                              controller: controller,
                            ))
                        .toList(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
