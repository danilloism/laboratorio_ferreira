import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';

class CustomActionChip extends StatelessWidget {
  const CustomActionChip({
    super.key,
    required this.label,
    this.onPressed,
    this.padding,
  });

  final Widget label;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: label,
      onPressed: onPressed ?? () {},
      disabledColor: context.theme.chipTheme.backgroundColor,
      padding: padding,
    );
  }
}
