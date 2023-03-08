import 'package:art_exhibition/constants/constant_colors.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:flutter/material.dart';

Expanded categories(BuildContext context) {
  return Expanded(
    flex: 20,
    child: Row(
      children: [
        Expanded(
          child: _categoryButton("Museum", context),
        ),
        Expanded(
          child: _categoryButton("Arts", context),
        ),
        Expanded(
          child: _categoryButton("Artists", context),
        ),
      ],
    ),
  );
}

@Todo("i can make it look good.")
Padding _categoryButton(String text, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          ConstantColors.colorLoginButton.getColor,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 300),
            content: Text("Navigate to $text"),
          ),
        );
      },
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    ),
  );
}
