import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends TextFormField {
  CustomTextFormField({
    super.key,
    this.label,
    super.keyboardType,
    super.onChanged,
    super.textInputAction,
    super.obscureText,
    super.onFieldSubmitted,
    super.initialValue,
  }) : super(
            decoration:
                label != null ? InputDecoration(label: Text(label)) : null);
  final String? label;
}
