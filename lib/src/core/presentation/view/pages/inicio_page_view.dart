import 'package:flutter/material.dart';

class InicioPageView extends StatelessWidget {
  const InicioPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: ColoredBox(
          color: Colors.red,
        ),
      ),
    );
  }
}
