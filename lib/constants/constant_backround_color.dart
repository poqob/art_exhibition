import 'package:flutter/material.dart';

enum ConstantBackroundColors {
  colorLogin,
  colorSignup,
}

extension ExtensionConstantBackroundColors on ConstantBackroundColors {
  Color get getColor {
    switch (index) {
      case 0:
        return const Color.fromARGB(255, 222, 222, 222);
      case 1:
        return const Color.fromARGB(255, 222, 222, 222);
      default:
        return Colors.black;
    }
  }
}
