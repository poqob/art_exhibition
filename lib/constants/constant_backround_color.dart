/// This file contains backgroundcolors of app as an enum.
/// In project, almost every enum has get() method via extensions.
import 'package:flutter/material.dart';

enum ConstantBackroundColors {
  colorLogin,
  colorSignup,
  colorContentPage,
}

extension ExtensionConstantBackroundColors on ConstantBackroundColors {
  Color get getColor {
    switch (index) {
      case 0:
        return const Color.fromARGB(255, 222, 222, 222);
      case 1:
        return const Color.fromARGB(255, 222, 222, 222);
      case 2:
        return const Color.fromARGB(255, 29, 28, 28);
      default:
        return Colors.black;
    }
  }
}
