import 'package:art_exhibition/data/db/api/authentication.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      )),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.dynamicWidth(0.05),
                vertical: context.dynamicWidth(0.05)),
            child: ListTile(
              title: Text(
                "Account Setting",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing:
                  Text("logged as ${Authentication.instance.getUsername}"),
              subtitle: const Text("account info..."),
              hoverColor: Colors.white60,
              leading: const Icon(Icons.person),
              onTap: () {},
            ),
          ),
          Center(
            child: Text(
              "Settings",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ],
      ),
    );
  }
}
