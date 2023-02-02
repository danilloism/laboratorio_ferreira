import 'package:flutter/material.dart';

import 'package:laboratorio_ferreira_mobile/generated/assets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        gradient: LinearGradient(
          colors: [
            ColorName.verdeClaro,
            ColorName.marmore,
            ColorName.marmore,
            ColorName.branco,
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
      child: Assets.images.laboratorioferreiraLogoSemFundo.image(
        fit: BoxFit.contain,
        height: height,
        filterQuality: FilterQuality.high,
        isAntiAlias: true,
        semanticLabel: 'Logo',
      ),
    );
  }
}
