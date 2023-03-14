import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Row tittle(BuildContext context) {
  return Row(
    children: [
      Padding(
        padding: EdgeInsets.only(
            bottom: context.lowRateWidth, top: context.lowRateHeight),
        child: Text(
          "Daily Content",
          style: GoogleFonts.oxygen(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: context.dynamicWidth(0.08),
            ),
          ),
        ),
      ),
    ],
  );
}
