import 'package:art_exhibition/data/db/api/authentication.dart';
import 'package:art_exhibition/screens/settings/screens/AccountSettingsView.dart';
import 'package:flutter/material.dart';

Widget accountSettings(BuildContext context) {
  return ListTile(
    title: Text(
      "Account Settings",
      style: Theme.of(context).textTheme.titleLarge,
    ),
    trailing: const Icon(Icons.person),
    subtitle: Text("logged as ${Authentication.instance.getUsername}"),
    hoverColor: Colors.white60,
    onTap: () {
      if (Authentication.instance.getAuthState == true) {
        showDialog(
            context: context,
            builder: (context) => const AccountSettingsView());
      }
    },
  );
}
