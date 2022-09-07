import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/config/config.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart' show Logo;

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
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
