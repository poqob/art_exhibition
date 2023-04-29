import 'package:art_exhibition/screens/settings/screens/ChangeUsernameView.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:flutter/material.dart';

@Todo(
    "go and open a form page that sets and controls new name via authentatication static class")
Widget changeUsername(BuildContext context) {
  return ListTile(
    title: Text(
      "Change Username",
      style: Theme.of(context).textTheme.titleLarge,
    ),
    hoverColor: Colors.white60,
    onTap: () {
      showDialog(
        context: context,
        builder: (context) => const ChangeNameView(),
      );
    },
  );
}
