import 'package:flutter/material.dart';

enum TextFieldDialogButtonType { cancel, confirm }

typedef DialogOptionBuilder = Map<TextFieldDialogButtonType, String> Function();

Future<bool?> showDeleteReminderDialog(BuildContext context) {
  final alertDialog = AlertDialog(
    title: const Text("Do you want to delete the Reminder"),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context, false),
        child: const Text("Cancel"),
      ),
      TextButton(
        onPressed: () => Navigator.pop(context, true),
        child: const Text("Confirm"),
      ),
    ],
  );

  return showDialog<bool?>(
    context: context,
    builder: (context) => alertDialog,
  );
}
