import 'package:art_exhibition/constants/constant_colors.dart';
import 'package:art_exhibition/screens/entrance/entrance_route.dart';
import 'package:flutter/material.dart';

FloatingActionButton nextButton(BuildContext context, State state,
    PageController controller, int msDuration) {
  int nextPage;
  try {
    nextPage = (controller.page!.toInt() + 1);
  } catch (e) {
    nextPage = 1;
  }
  return FloatingActionButton(
    onPressed: () {
      state.setState(
        () {
          nextPage = (controller.page!.toInt() + 1);
          if (nextPage != EntrancePages.values.length) {
            controller.animateToPage(nextPage,
                duration: Duration(milliseconds: msDuration),
                curve: Curves.linear);
            nextPage + 1 == EntrancePages.values.length
                ? isLastPage = true
                : isLastPage = false;
          } else {
            Navigator.popAndPushNamed(context, '/login');
          }
          isLastPage;
        },
      );
    },
    backgroundColor: ConstantColors.colorEntranceTheme.getColor,
    elevation: 20,
    tooltip: "next",
    child: Center(
      child: Icon(
        !isLastPage ? Icons.arrow_forward_outlined : Icons.done,
        //size: context.lowRateWidth * 2,
      ),
    ),
  );
}
