import 'package:flutter/material.dart';

AlertDialog errorView(BuildContext context) {
  return AlertDialog(
    content: const Text("log in failed"),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/login");
          },
          child: const Text("re-try"))
    ],
  );
}
