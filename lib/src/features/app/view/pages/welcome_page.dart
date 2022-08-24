import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/colors.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/view/widgets/logo.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox.expand(
        child: ColoredBox(
          color: Cores.branco,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Logo(),
                SizedBox(height: 8),
                Text('Bem vindo!'),
                SizedBox(height: 8),
                CircularProgressIndicator(color: Cores.verdeEscuro),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
