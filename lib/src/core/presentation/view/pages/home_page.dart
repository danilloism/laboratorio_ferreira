import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/bloc/navigation_index_cubit.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/app_navigation_bar.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/lista_contatos/view/lista_contatos_page_view.dart';
import 'package:laboratorio_ferreira_mobile/src/features/servico/presentation/view/pages/servicos_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(child: Logo(height: 50)),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingsPage())),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: PageView(
          controller: _controller,
          onPageChanged: NavigationIndexCubit.of(context).goTo,
          children: const [
            InicioPageView(),
            ContatosPageView(),
            ServicosPageView()
          ],
        ),
      ),
      bottomNavigationBar: const AppNavigationBar(),
    );
  }
}
