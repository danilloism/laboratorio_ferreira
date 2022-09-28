import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.child});

  final Widget child;

  int _getIndex(BuildContext context) {
    final route = GoRouter.of(context);
    final String location = route.location;

    switch (location) {
      case '/inicio':
        return 0;
      case '/contatos':
        return 1;
      case '/servicos':
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(child: Logo(height: 70)),
        actions: [
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocListener<ConnectivityCubit, ConnectivityResult>(
        listener: (context, state) {
          if (!ConnectivityCubit.of(context).isConnected) {
            context.showErrorSnackBar(
                message:
                    'Você está offline. Algumas funcionalidades serão limitadas.');
          }
        },
        child: child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        currentIndex: _getIndex(context),
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/inicio');
              break;
            case 1:
              context.go('/contatos');
              break;
            case 2:
              context.go('/servicos');
          }
        },
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
