import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/build_context_extension.dart';

class CriarContatoButton extends StatelessWidget {
  const CriarContatoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
            context.push('/contatos/create');
          },
          child: Row(
            children: const [
              Icon(Icons.person_add),
              SizedBox(width: 8),
              Text('Adicionar contato'),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_drop_down_circle_outlined),
          color: context.textButtonColor,
        ),
      ],
    );
  }
}
