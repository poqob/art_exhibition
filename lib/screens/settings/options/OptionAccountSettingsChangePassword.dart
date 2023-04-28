import 'package:art_exhibition/data/db/api/authentication.dart';
import 'package:flutter/material.dart';

Widget changePassword(BuildContext context) {
  return ListTile(
    title: Text(
      "Change Password",
      style: Theme.of(context).textTheme.titleLarge,
    ),
    subtitle: Text("logged as ${Authentication.instance.getUsername}"),
    hoverColor: Colors.white60,
    onTap: () {},
  );
}
