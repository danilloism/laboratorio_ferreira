import 'package:flutter/material.dart';

class CustomWrap extends StatelessWidget {
  const CustomWrap({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 10,
      children: children,
    );
  }
}
