import 'package:art_exhibition/widgets/common/glassBox.dart';
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

Widget _categoryButton(String text, BuildContext context) {
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
        _func(context, text);
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

void _func(BuildContext context, String route) async {
  var routes = {
    "Museum": '/museums',
    "Arts": '/arts',
    "Artists": '/artists',
  };
  Navigator.pushNamed(context, routes[route]!);
}
