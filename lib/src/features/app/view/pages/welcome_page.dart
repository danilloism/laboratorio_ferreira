import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/colors.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/view/widgets/logo.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
