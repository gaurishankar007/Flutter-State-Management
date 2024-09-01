import 'package:flutter/material.dart';

enum TextFieldDialogButtonType { cancel, confirm }

typedef DialogOptionBuilder = Map<TextFieldDialogButtonType, String> Function();

Future<String?> showTextFieldDialog(
  BuildContext context, {
  required String title,
  String? hintText,
  required DialogOptionBuilder optionsBuilder,
}) {
  String text = '';
  final options = optionsBuilder();

  final alertDialog = AlertDialog(
    title: Text(title),
    content: TextField(
      autofocus: true,
      onChanged: (value) => text = value,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
      ),
    ),
    actions: options.entries.map((option) {
      return TextButton(
        onPressed: () {
          if (option.key == TextFieldDialogButtonType.cancel) {
            return Navigator.pop(context);
          } else {
            Navigator.pop(context, text);
          }
        },
        child: Text(option.value),
      );
    }).toList(),
  );

  return showDialog<String?>(
    context: context,
    builder: (context) => alertDialog,
  );
}
