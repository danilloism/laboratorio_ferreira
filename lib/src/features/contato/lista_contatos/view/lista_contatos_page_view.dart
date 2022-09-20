import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/search_bar.dart';

class ContatosPageView extends StatelessWidget {
  const ContatosPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SearchBar(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.person_add),
                      SizedBox(width: 8),
                      Text('Adicionar contato'),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.filter_list_rounded),
                      SizedBox(width: 8),
                      Text('Filtrar contatos'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
