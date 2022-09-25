import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String? label;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextInputAction? inputAction;
  final String? initialValue;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.label,
    this.keyboardType,
    this.onChanged,
    this.inputAction,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(label: label != null ? Text(label!) : null),
      onChanged: onChanged,
      textInputAction: inputAction,
      initialValue: initialValue,
    );
  }
}
