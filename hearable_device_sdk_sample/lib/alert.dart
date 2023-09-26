
import 'package:flutter/material.dart';

class Alert {
  static void showAlert(BuildContext context, String text) {
    showDialog(context: context,builder: (_) {
      return AlertDialog(
        title: const Text("Error"),
        content: Text(text),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    });
  }
}