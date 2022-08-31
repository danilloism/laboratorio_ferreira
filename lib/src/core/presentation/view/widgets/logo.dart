import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/assets.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.width = 150, this.height = 150});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        gradient: LinearGradient(
          colors: [
            Cores.verdeEscuro,
            Cores.verde,
            Cores.verdeClaro,
            Cores.marromClaro,
            Cores.marrom,
          ],
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomEnd,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 5,
            spreadRadius: 0.05,
            offset: Offset(-1, 3),
          ),
        ],
      ),
      child: Image.asset(
        Assets.laboratorioferreiraLogoTransparente,
        filterQuality: FilterQuality.high,
        isAntiAlias: true,
        semanticLabel: 'Logo',
      ),
    );
  }
}
