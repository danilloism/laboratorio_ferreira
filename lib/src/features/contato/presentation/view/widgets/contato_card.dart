import 'package:flutter/material.dart';

import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';

class ContatoCard extends StatelessWidget {
  const ContatoCard({super.key, required this.contato});
  final Contato contato;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              children: [Text(contato.nome)],
            ),
          ]),
        ),
      ),
    );
  }
}
