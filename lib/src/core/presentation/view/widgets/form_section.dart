import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/extensions.dart';

class FormSection extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Widget child;

  const FormSection(
      {super.key, this.title, this.titleStyle, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: titleStyle ?? context.theme.textTheme.titleLarge,
            textAlign: TextAlign.start,
          ),
        if (title != null) const SizedBox(height: 8),
        child,
      ],
    );
  }
}
