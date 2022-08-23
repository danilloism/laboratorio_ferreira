import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/assets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) => Image.asset(
        Assets.laboratorioferreiraLogoTransparente,
        height: 150,
      );
}
