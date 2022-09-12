import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/bloc/adicionar_telefones_cubit.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/bloc/adicionar_telefones_state.dart';
import 'package:mask/mask.dart';

class AdicionarTelefonesDialog extends StatelessWidget {
  const AdicionarTelefonesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdicionarTelefonesCubit>(
      create: (_) => AdicionarTelefonesCubit(),
      child: Builder(
        builder: (context) {
          return AlertDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Adicionar telefone(s)'),
                Text(
                  'Para adicionar mais telefones, o último telefone informado deve ser válido.',
                  style: context.theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar')),
              ElevatedButton(onPressed: () {}, child: const Text('Adicionar'))
            ],
            content: SingleChildScrollView(
              child:
                  BlocBuilder<AdicionarTelefonesCubit, AdicionarTelefonesState>(
                buildWhen: (_, current) => current.update,
                builder: (ctx, state) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...state.telefones.asMap().entries.map(
                      (entry) {
                        final index = entry.key;
                        final telefone = entry.value;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      key: ValueKey(telefone.key),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        Mask.generic(
                                            masks: ['(##) #####-####']),
                                      ],
                                      onChanged: (value) {
                                        AdicionarTelefonesCubit.of(context)
                                            .telefoneTeveAlteracaoNoIndice(
                                          index,
                                          value: Formatter.unmaskPhone(value),
                                        );
                                      },
                                    ),
                                  ),
                                  if (index == state.telefones.length - 1 &&
                                      ((state.errors.isEmpty &&
                                              state.telefones.length > 1 &&
                                              !telefone.input.pure) ||
                                          (state.telefones.length == 1 &&
                                              telefone.input.valid)))
                                    IconButton(
                                      onPressed: () =>
                                          AdicionarTelefonesCubit.of(context)
                                              .adicionar(),
                                      icon: const Icon(Icons.add),
                                    ),
                                  if (index != state.telefones.length - 1 ||
                                      state.telefones.length > 1)
                                    IconButton(
                                      onPressed: () =>
                                          AdicionarTelefonesCubit.of(context)
                                              .removerNoIndice(index),
                                      icon: const Icon(Icons.remove),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
