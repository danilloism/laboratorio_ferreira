import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/generated/colors.gen.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart'
    show Logo;

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: ColoredBox(
          color: ColorName.branco,
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
