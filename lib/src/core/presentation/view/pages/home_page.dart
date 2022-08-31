import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/logo.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
            height: Theme.of(context).appBarTheme.toolbarHeight! - 15,
            child: const Logo()),
        actions: [
          IconButton(
            onPressed: () => context
                .read<AuthBloc>()
                .add(const AuthEvent.logOutButtonPressed()),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const SafeArea(
        child: SizedBox.expand(),
      ),
    );
  }
}
