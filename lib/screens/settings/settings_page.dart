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
      body: Center(
        child: Text(
          "Settings",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
