import 'package:flutter/material.dart';

class LoadingErrorWidget extends StatelessWidget {
  final String route;
  const LoadingErrorWidget({
    super.key,
    this.route = "/home",
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text("load error."),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, route);
            },
            child: const Text("back"))
      ],
    );
  }
}
