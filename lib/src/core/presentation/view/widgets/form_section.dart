import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/extensions/build_context_extension.dart';

class FormSection extends StatelessWidget {
  final String? title;
  final Widget child;

  const FormSection({super.key, this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: context.theme.textTheme.headline6,
            textAlign: TextAlign.start,
          ),
        if (title != null) const SizedBox(height: 8),
        child,
      ],
    );
  }
}
