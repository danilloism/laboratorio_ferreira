import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  void showErrorSnackBar({required String message}) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.redAccent,
    ));
  }
}
