import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/build_context_extension.dart';

class DropdownMenu<T> extends StatelessWidget {
  const DropdownMenu({
    super.key,
    required this.value,
    this.selectedItemBuilder,
    required this.items,
    required this.onChanged,
  });
  final T value;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: const SizedBox(),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      dropdownColor: context.theme.appBarTheme.backgroundColor,
      selectedItemBuilder: selectedItemBuilder,
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }
}
