import 'package:flutter/material.dart';

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
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.start,
          ),
        if (title != null) const SizedBox(height: 8),
        child,
      ],
    );
  }
}
