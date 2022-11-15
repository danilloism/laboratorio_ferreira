import 'package:flutter/material.dart';

class GerenciarContasSection extends StatelessWidget {
  const GerenciarContasSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gerenciar contas de usuário',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 4),
            TextButton(
              onPressed: () {},
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.person_add),
                  SizedBox(width: 12),
                  Text('Cadastrar novo usuário'),
                ],
              ),
            ),
            const SizedBox(height: 4),
            TextButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Icon(Icons.queue_rounded),
                    SizedBox(width: 12),
                    Text('Visualizar solicitações'),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
