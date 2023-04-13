/// This file contains colors of app as an enum.
/// In project, almost every enum has get() method via extensions.
import 'package:flutter/material.dart';

enum ConstantColors {
  colorEntranceTheme,
  colorTextfield,
  colorLoginButton,
  colorSignupButton,
}

extension ConstantExtension on ConstantColors {
  Color get getColor {
    switch (index) {
      case 0:
        return const Color.fromARGB(255, 28, 72, 156);
      case 1:
        return Colors.black;
      case 2:
        return const Color.fromARGB(255, 99, 99, 99);
      case 3:
        return const Color.fromARGB(255, 99, 99, 99);
      default:
        return Colors.black;
    }
  }
}
