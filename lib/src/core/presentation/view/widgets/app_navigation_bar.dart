import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/bloc/navigation_index_cubit.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: NavigationIndexCubit.watcherOf(context).state,
      onTap: NavigationIndexCubit.of(context).goTo,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Contatos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cases_rounded),
          label: 'Serviços',
        ),
      ],
    );
  }
}
