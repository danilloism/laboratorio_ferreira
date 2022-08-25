import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String? label;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.label,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(label: label != null ? Text(label!) : null),
    );
  }
}
