import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomActionChip extends StatelessWidget {
  const CustomActionChip({
    super.key,
    required this.label,
    this.onPressed,
    this.onDeleted,
    this.tooltip,
    this.onSelected,
    this.selected = false,
  });

  final Widget label;
  final void Function()? onPressed;
  final void Function()? onDeleted;
  final void Function(bool)? onSelected;
  final String? tooltip;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    assert(!(onPressed != null && onSelected != null));
    return RawChip(
      label: label,
      onPressed: onPressed,
      deleteIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          VerticalDivider(
            thickness: 2,
            width: 3,
          ),
          SizedBox(width: 1),
          Icon(
            CupertinoIcons.trash,
            size: 20,
            semanticLabel: 'Ícone de lixeira',
          ),
        ],
      ),
      deleteIconColor: Colors.red,
      deleteButtonTooltipMessage: 'Deletar item',
      onDeleted: onDeleted,
      tooltip: tooltip,
      onSelected: onSelected,
      selected: selected,
    );
  }
}
