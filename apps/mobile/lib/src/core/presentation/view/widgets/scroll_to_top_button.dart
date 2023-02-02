import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/build_context_extension.dart';

class ScrollToTopButton extends StatelessWidget {
  const ScrollToTopButton({super.key, required this.controller});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final scrollOffset = controller.offset;
        return Visibility(
          visible: scrollOffset < context.mediaQuery.size.height * 0.5,
          child: FloatingActionButton(
            tooltip: 'Ir para o topo',
            child: const Icon(Icons.arrow_upward),
            onPressed: () async {
              controller.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        );
      },
    );
  }
}
