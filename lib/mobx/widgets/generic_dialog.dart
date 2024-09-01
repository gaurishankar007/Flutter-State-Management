import 'package:flutter/material.dart';

enum TextFieldDialogButtonType { cancel, confirm }

typedef DialogOptionBuilder = Map<TextFieldDialogButtonType, String> Function();

Future<String?> showGenericDialog(
  BuildContext context, {
  required String title,
  String? description,
}) {
  final alertDialog = AlertDialog(
    title: Text(title),
    content: description != null ? Text(description) : null,
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text("Ok"),
      )
    ],
  );

  return showDialog<String?>(
    context: context,
    builder: (context) => alertDialog,
  );
}
