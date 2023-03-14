import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/common/glassBox.dart';
import 'package:flutter/material.dart';

@Todo("glass morphism will be aplied.")
Expanded bottomBar(BuildContext context) {
  return Expanded(
    flex: 10,
    child: glassBox(
      context: context,
      width: context.dynamicWidth(0.45),
      height: context.dynamicHeight(0.15),
      border: BorderRadius.circular(15),
      blur: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(milliseconds: 300),
                  content: Text("Navigate to Home (this page)"),
                ),
              );
            },
            icon: const Icon(Icons.home_outlined),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(milliseconds: 300),
                  content: Text("Navigate to Saved Content Page"),
                ),
              );
              Navigator.pushNamed(context, '/saved');
            },
            icon: const Icon(Icons.bookmark_outline_outlined),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
    ),
  );
}
