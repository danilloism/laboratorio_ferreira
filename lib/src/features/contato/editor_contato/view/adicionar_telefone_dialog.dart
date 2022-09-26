import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';
import 'package:mask/mask.dart';

class AdicionarTelefoneDialog extends StatelessWidget {
  const AdicionarTelefoneDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdicionarTelefoneCubit>(
      create: (_) => AdicionarTelefoneCubit(),
      child: Builder(
        builder: (context) {
          return AlertDialog(
            title: const Text('Adicionar telefone'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar')),
              BlocBuilder<AdicionarTelefoneCubit, TelefoneInput>(
                  buildWhen: (previous, current) =>
                      current.valid || previous.valid && !current.valid,
                  builder: (_, state) => ElevatedButton(
                      onPressed: !state.valid ? null : () {},
                      child: const Text('Adicionar')))
            ],
            content: BlocBuilder<AdicionarTelefoneCubit, TelefoneInput>(
              builder: (ctx, state) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      Mask.generic(masks: ['(##) #####-####'])
                    ],
                    onChanged: (value) {
                      AdicionarTelefoneCubit.of(context)
                          .teveAlteracao(Formatter.unmaskPhone(value));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Visibility(
                      visible: state.error != null && !state.pure,
                      child: Text(state.error?.name ?? '',
                          style: const TextStyle(color: Colors.red)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
