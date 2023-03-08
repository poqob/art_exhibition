import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/common/glassBox.dart';
import 'package:flutter/material.dart';

Expanded categories(BuildContext context, PageController pageController) {
  return Expanded(
    flex: 20,
    child: Row(
      children: [
        Expanded(
          child: _categoryButton("Museum", context, pageController),
        ),
        Expanded(
          child: _categoryButton("Arts", context, pageController),
        ),
        Expanded(
          child: _categoryButton("Artists", context, pageController),
        ),
      ],
    ),
  );
}

@Todo("i can make it look good.")
Widget _categoryButton(
    String text, BuildContext context, PageController pageController) {
  final BorderRadius borderRadius = BorderRadius.circular(20);
  return glassBox(
    context: context,
    width: 100,
    height: 100,
    border: borderRadius,
    blur: 5,
    child: ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.transparent,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius,
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
