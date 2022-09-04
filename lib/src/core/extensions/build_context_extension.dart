import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  void showErrorSnackBar({required String message}) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.redAccent,
    ));
  }

  ThemeData get theme => Theme.of(this);
}
