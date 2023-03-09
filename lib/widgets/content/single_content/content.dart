import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:flutter/material.dart';

Widget content(
  BuildContext context,
  String? heading,
  String? text,
  String? imagePath,
) {
  return SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          heading!,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white),
        ),
        //will change this.
        Padding(
          padding: EdgeInsets.symmetric(vertical: context.lowRateHeight),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(imagePath!)),
        ),
        Text(
          text!,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white.withOpacity(0.7)),
        ),
        SizedBox(
          height: context.dynamicHeight(0.1),
        ),
      ],
    ),
  );
}
