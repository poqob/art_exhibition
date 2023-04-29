import 'package:flutter/material.dart';

class ChangeNameView extends StatefulWidget {
  const ChangeNameView({super.key});

  @override
  State<ChangeNameView> createState() => _ChangeNameView();
}

class _ChangeNameView extends State<ChangeNameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: Center(
        child: Text(
          "change username",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      title: Text(
        "Change username",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      ),
    );
  }
}
