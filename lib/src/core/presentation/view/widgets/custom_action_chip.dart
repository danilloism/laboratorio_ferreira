import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/build_context_extension.dart';

class CustomActionChip extends StatelessWidget {
  const CustomActionChip({
    super.key,
    required this.label,
    this.onPressed,
    this.onDeleted,
    this.tooltip,
  });

  final Widget label;
  final void Function()? onPressed;
  final void Function()? onDeleted;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: label,
      onPressed: onPressed,
      deleteIcon: const Padding(
        padding: EdgeInsets.only(left: 4),
        child: Icon(CupertinoIcons.trash,
            size: 22, semanticLabel: 'Ícone de lixeira'),
      ),
      deleteIconColor: Colors.red,
      deleteButtonTooltipMessage: 'Deletar item',
      onDeleted: onDeleted,
      tooltip: tooltip,
    );
  }
}
