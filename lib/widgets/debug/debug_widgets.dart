import 'package:flutter/material.dart';

List<Widget> debugButtons(BuildContext context, PageController controller) {
  return <Widget>[
    Positioned(
      left: 5,
      bottom: 10,
      child: ElevatedButton(
        onPressed: () {
          controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        },
        child: const Text("debug next"),
      ),
    ),
    Positioned(
      left: 5,
      bottom: 45,
      child: ElevatedButton(
        onPressed: () {
          controller.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        },
        child: const Text("debug prev"),
      ),
    ),
    Positioned(
      left: 5,
      bottom: 80,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("debug back"),
      ),
    ),
  ];
}
