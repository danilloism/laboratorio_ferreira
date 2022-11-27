import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/controllers/contatos_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/view/widgets/contato_card.dart';

class ContatosList extends ConsumerWidget {
  const ContatosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ref.watch(contatoControllerProvider).when(
          data: (contatos) => ListView.builder(
                itemBuilder: (context, index) {
                  return ContatoCard(contato: contatos[index]);
                },
                itemCount: contatos.length,
              ),
          error: (error, _) => const Text('erro'),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
