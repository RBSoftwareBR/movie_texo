
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {
        // Some code to undo the change if necessary.
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
