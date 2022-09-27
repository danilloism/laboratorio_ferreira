import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String? label;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextInputAction? inputAction;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onFieldSubmitted;

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
    this.inputFormatters,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      decoration: label != null ? InputDecoration(label: Text(label!)) : null,
      onChanged: onChanged,
      textInputAction: inputAction,
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
