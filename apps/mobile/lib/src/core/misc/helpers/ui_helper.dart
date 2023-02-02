import 'package:flutter/material.dart';

class UiHelper {
  const UiHelper._();

  static void closeKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
}
