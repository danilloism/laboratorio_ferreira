import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/build_context_extension.dart';

class UiHelper {
  static void closeKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  static Color textButtonColor(BuildContext context) =>
      context.theme.colorScheme.primary;
}
