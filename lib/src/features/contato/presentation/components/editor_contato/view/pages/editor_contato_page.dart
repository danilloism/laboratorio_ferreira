import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/extensions.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/helpers/helpers.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/confirm_modal.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/data/repositories/repositories.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/controllers/editor_contato_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/controllers/is_loading_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/view/widgets/categorias_form_section.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/view/widgets/criar_account_section.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/view/widgets/name_form_section.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/view/widgets/telefones_form_section.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';

class EditorContatoPage extends ConsumerWidget {
  EditorContatoPage({super.key, Contato? contato})
      : _contatoInicial = contato ?? Contato.empty;
  final Contato _contatoInicial;
  final _formKey = GlobalKey<FormBuilderState>();
  bool get isCriar => _contatoInicial.isEmpty;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        editorContatoNotifierProvider
            .overrideWith((ref) => EditorContatoController(_contatoInicial))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(isCriar ? 'Criar Contato' : 'Editar Contato'),
          leading: Consumer(builder: (context, ref, _) {
            return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (_contatoInicial !=
                      ref.read(editorContatoNotifierProvider)) {
                    context.openModal(
                      ConfirmModal(
                        message:
                            'Há alterações não salvas, deseja mesmo voltar?',
                        onConfirm: context.pop,
                        popOnConfirm: false,
                      ),
                      useProviderScope: false,
                    );
                  } else {
                    context.pop();
                  }
                });
          }),
          actions: [
            Consumer(
              builder: (context, ref, _) {
                final loading = ref.watch(isLoadingControllerProvider);

                if (loading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return IconButton(
                  onPressed: () async {
                    UiHelper.closeKeyboard();
                    final isLoadingController =
                        ref.read(isLoadingControllerProvider.notifier);
                    if (_formKey.currentState!.validate()) {
                      isLoadingController.switchValue();

                      final contatoFinal =
                          ref.read(editorContatoNotifierProvider);

                      if (contatoFinal.nome.isEmpty) {
                        _formKey.currentState
                            ?.invalidateField(name: 'telefones');
                        return;
                      }

                      if (_contatoInicial == contatoFinal) {
                        context.pop();
                        return;
                      }

                      try {
                        final repository = ref.read(contatoRepositoryProvider);

                        if (isCriar) {
                          await ref
                              .read(contatoRepositoryProvider)
                              .create(contatoFinal)
                              .whenComplete(() => context.pop());
                          return;
                        }
                        final settings = ref.read(settingsControllerProvider);
                        final contatoAtualizado =
                            await repository.update(contatoFinal);
                        final itsMe = _contatoInicial.uid ==
                            settings.session?.contato.uid;
                        if (itsMe) {
                          final session = settings.session;
                          ref
                              .read(settingsControllerProvider.notifier)
                              .changeSession(session?.copyWith(
                                  contato: contatoAtualizado));
                        }

                        // ignore: use_build_context_synchronously
                        context.pop();
                      } on RepositoryException catch (e) {
                        final erro = e.object?['data']['erro'];

                        if (erro is List) {
                          final erroCasted =
                              List<String?>.from(erro, growable: false);

                          context.showErrorSnackBar(
                              message: Formatter.fromErrorList(erroCasted)!);
                        }

                        if (erro is String?) {
                          context.showErrorSnackBar(
                              message: '${erro ?? e.message}');
                        }

                        isLoadingController.switchValue();
                      } catch (e) {
                        isLoadingController.switchValue();
                        context.showErrorSnackBar(message: e.toString());
                        return;
                      }
                    }
                  },
                  icon: const Icon(Icons.done),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormBuilder(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 8),
                const NameFormSection(),
                const SizedBox(height: 20),
                const TelefonesFormSection(),
                const SizedBox(height: 20),
                const CategoriasFormSection(),
                if (isCriar) ...[
                  const SizedBox(height: 20),
                  const CriarAccountSection(),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
