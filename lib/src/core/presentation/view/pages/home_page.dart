import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/bloc/navigation_index_cubit.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/app_navigation_bar.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/view/pages/contatos_page_view.dart';
import 'package:laboratorio_ferreira_mobile/src/features/servico/presentation/view/pages/servicos_page_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        child: BlocBuilder<NavigationIndexCubit, int>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) => IndexedStack(
            index: state,
            children: const [
              InicioPageView(),
              ContatosPageView(),
              ServicosPageView()
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppNavigationBar(),
    );
  }
}
