import 'package:flutter/material.dart';

class CustomDropdownMenu<T> extends DropdownButton<T> {
  CustomDropdownMenu({
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
