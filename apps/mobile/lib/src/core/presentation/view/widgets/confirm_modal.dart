import 'dart:async';

import 'package:flutter/material.dart';

class ConfirmModal extends StatelessWidget {
  const ConfirmModal({
    super.key,
    required this.message,
    this.cancelLabel,
    this.confirmLabel,
    required this.onConfirm,
    this.popOnConfirm = true,
    this.awaitForConfirmThenPop = false,
  });
  final String message;
  final String? cancelLabel;
  final String? confirmLabel;
  final FutureOr<void> Function() onConfirm;
  final bool awaitForConfirmThenPop;
  final bool popOnConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(message),
      actions: [
        ElevatedButton(
          onPressed: () =>
              Navigator.of(context, rootNavigator: true).pop('dialog'),
          child: cancelLabel == null ? const Text('Não') : Text(cancelLabel!),
        ),
        TextButton(
          onPressed: popOnConfirm
              ? () async {
                  if (awaitForConfirmThenPop &&
                      onConfirm is Future<void> Function()) {
                    await (onConfirm as Future<void> Function())().whenComplete(
                        () => Navigator.of(context, rootNavigator: true)
                            .pop('dialog'));
                    return;
                  }
                  onConfirm();
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                }
              : onConfirm,
          child: confirmLabel != null ? Text(confirmLabel!) : const Text('Sim'),
        )
      ],
    );
  }
}
