import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Container top(Color color, String path) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(90.0),
        bottomRight: Radius.circular(225.0),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Spacer(),
        Expanded(
          flex: 6,
          child: Center(
            child: SvgPicture.asset(
              path,
              alignment: Alignment.topCenter,
              semanticsLabel: "entrance0",
            ),
          ),
        ),
        const Spacer(),
      ],
    ),
  );
}
