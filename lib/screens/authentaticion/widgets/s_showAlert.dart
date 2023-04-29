import 'package:art_exhibition/data/db/api/authentication.dart';
import 'package:flutter/material.dart';

// navigate to home page, sign up succesfull.
Widget showSuccessAlert(BuildContext context) {
  return AlertDialog(
    content: Text(Authentication.instance.getAuthState.toString()),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, '/home');
        },
        child: const Text("okey"),
      ),
    ],
  );
}
