import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:flutter/material.dart';

Column sub(BuildContext context, String tittle, String content) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.only(left: context.lowRateWidth),
          child: Text(
            tittle,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Padding(
          padding: EdgeInsets.only(
            left: context.lowRateWidth,
            right: context.lowRateWidth,
          ),
          child: Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    ],
  );
}
