import 'package:flutter/material.dart';

class InicioPageView extends StatelessWidget {
  const InicioPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(color: Colors.red),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Contatos'),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Ver todos'),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
