// ignore_for_file: file_names

import 'dart:ui';
import 'package:flutter/material.dart';

Widget glassBox({
  required BuildContext context,
  BorderRadiusGeometry border = BorderRadius.zero,
  double borderOpacity = 0.2,
  required double width,
  required double height,
  Widget? child,
  Alignment alignment = Alignment.center,
  double blur = 1.0,
}) {
  return ClipRRect(
    clipBehavior: Clip.antiAlias,
    borderRadius: border,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: border,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          //filter

          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blur,
              sigmaY: blur,
            ),
            child: Container(),
          ),

          //gradiant effect
          Container(
            alignment: alignment,
            width: width,
            height: height,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.white.withOpacity(borderOpacity)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.1)
                ],
              ),
              borderRadius: border,
            ),
            child: child,
          ),
        ],
      ),
    ),
  );
}
