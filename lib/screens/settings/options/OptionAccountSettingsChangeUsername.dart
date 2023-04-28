import 'package:art_exhibition/data/db/api/authentication.dart';
import 'package:flutter/material.dart';

Widget changeUsername(BuildContext context) {
  return ListTile(
    title: Text(
      "Change Username",
      style: Theme.of(context).textTheme.titleLarge,
    ),
    subtitle: Text("logged as ${Authentication.instance.getUsername}"),
    hoverColor: Colors.white60,
    onTap: () {},
  );
}
