import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/build_context_extension.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/confirm_modal.dart';

class CustomChip extends StatelessWidget {
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

  final Widget label;
  final void Function()? onPressed;
  final void Function()? onDeleted;
  final bool confirmDeleteAction;
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
      onDeleted: onDeleted != null
          ? () {
              if (confirmDeleteAction) {
                context.openModal(
                  ConfirmModal(
                      message: 'Tem certeza que deseja deletar esse item?',
                      onConfirm: onDeleted!),
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
