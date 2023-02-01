import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart'
    show InicioPageView, Logo;
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/contatos_list/view/pages/lista_contatos_page_view.dart';
import 'package:laboratorio_ferreira_mobile/src/features/servico/presentation/presentation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const SizedBox(child: Logo(height: 70)),
        actions: [
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: IndexedStack(
        index: _index,
        children: const [
          InicioPageView(),
          ContatosPageView(),
          ServicosPageView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        currentIndex: _index,
        onTap: (index) => setState(() => _index = index),
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
      ),
    );
  }
}
