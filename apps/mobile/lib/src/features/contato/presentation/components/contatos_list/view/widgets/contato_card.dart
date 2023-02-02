import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/build_context_extension.dart';

import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';

class ContatoCard extends StatelessWidget {
  const ContatoCard({super.key, required this.contato});
  final Contato contato;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/contatos/view/${contato.uid}'),
      child: Card(
        child: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    contato.nome,
                    style: context.theme.textTheme.titleMedium,
                  ),
                ],
              ),
              const Divider(),
            ]),
          ),
        ),
      ),
    );
  }
}
