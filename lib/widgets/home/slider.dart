import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/common/glassBox.dart';
import 'package:flutter/material.dart';

@Todo("Slider package will be added or write one.")
Expanded slider(BuildContext context) {
  return Expanded(
    flex: 80,
    child: glassBox(
      blur: 1.0,
      context: context,
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(1),
      border: BorderRadius.circular(25),
    ),
  );
}
