import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/build_context_extension.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/confirm_modal.dart';

class CustomChip extends StatelessWidget {
  final Widget label;
  final void Function()? onPressed;
  final void Function()? onDeleted;
  final bool confirmDeleteAction;
  final void Function(bool)? onSelected;
  final String? tooltip;
  final bool selected;

  const CustomChip({
    super.key,
    required this.label,
    this.onPressed,
    this.onDeleted,
    this.tooltip,
    this.onSelected,
    this.selected = false,
    this.confirmDeleteAction = true,
  });

  factory CustomChip.add(void Function()? onPressed) =>
      CustomChip.icon(Icons.add, onPressed: onPressed);

  CustomChip.icon(IconData icon, {this.onPressed, this.tooltip, super.key})
      : label = Icon(icon, size: 20),
        onSelected = null,
        onDeleted = null,
        selected = false,
        confirmDeleteAction = true;

  @override
  Widget build(BuildContext context) {
    assert(!(onPressed != null && onSelected != null));
    return RawChip(
      label: label,
      onPressed: onPressed,
      labelPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      deleteIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          VerticalDivider(
            thickness: 1,
            width: 5,
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
      onDeleted: onDeleted != null
          ? () {
              if (confirmDeleteAction) {
                context.openModal(
                  ConfirmModal(
                    message: 'Tem certeza que deseja deletar esse item?',
                    onConfirm: onDeleted!,
                  ),
                );
                return;
              }
              onDeleted?.call();
            }
          : null,
      tooltip: tooltip,
      onSelected: onSelected,
      selected: selected,
    );
  }
}
