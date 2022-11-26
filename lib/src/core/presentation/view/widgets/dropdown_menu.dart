import 'package:flutter/material.dart';

class DropdownMenu<T> extends DropdownButton<T> {
  DropdownMenu({
    super.key,
    required super.items,
    required super.onChanged,
    required super.value,
    super.selectedItemBuilder,
  }) : super(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          underline: const SizedBox(),
        );
}
