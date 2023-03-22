import 'package:art_exhibition/constants/constant_colors.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
          color: ConstantColors.colorEntranceTheme.getColor),
    );
  }
}
