import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension BuildContextExtensions on BuildContext {
  void showErrorSnackBar({required String message}) =>
      showSnackbar(message: message, backgroundColor: Colors.red);

  void showSnackbar({required String message, Color? backgroundColor}) {
    scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ));
  }

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  ScaffoldState get scaffold => Scaffold.of(this);
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Color get textButtonColor => theme.colorScheme.primary;

  Future<T?> openModal<T>(Widget widget, {bool useProviderScope = true}) {
    if (useProviderScope) {
      final ctxContainer = ProviderScope.containerOf(this);
      return showDialog<T>(
        context: this,
        builder: (context) => ProviderScope(
          parent: ctxContainer,
          child: widget,
        ),
      );
    }

    return showDialog<T>(context: this, builder: (context) => widget);
  }
}
