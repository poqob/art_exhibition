import 'package:flutter/material.dart';

// throws error to user and goes back sign up page back.
Widget showErrorDialog(BuildContext context) {
  return AlertDialog(
    content: const Text("sign up failed"),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/signup");
          },
          child: const Text("re-try"))
    ],
  );
}
