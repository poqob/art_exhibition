import 'package:art_exhibition/constants/constant_colors.dart';
import 'package:art_exhibition/screens/entrance/entrance_route.dart';
import 'package:flutter/material.dart';

FloatingActionButton nextButton(BuildContext context, State state,
    PageController controller, int msDuration) {
  return FloatingActionButton(
    onPressed: () {
      state.setState(
        () {
          switch (entranceInstance) {
            case EntrancePages.entrance0:
              controller.animateToPage(1,
                  duration: Duration(milliseconds: msDuration),
                  curve: Curves.linear);
              entranceInstance = EntrancePages.entrance1;

              break;
            case EntrancePages.entrance1:
              controller.animateToPage(2,
                  duration: Duration(milliseconds: msDuration),
                  curve: Curves.linear);
              entranceInstance = EntrancePages.entrance2;
              break;
            case EntrancePages.entrance2:
              //animated push
              isLastPage = true;
              controller.animateToPage(3,
                  duration: Duration(milliseconds: msDuration),
                  curve: Curves.linear);
              //Navigator.popAndPushNamed(context, "/login");
              break;
            default:

            //route to logIn screen
          }
        },
      );
    },
    backgroundColor: ConstantColors.colorEntranceTheme.getColor,
    elevation: 20,
    tooltip: "next",
    child: Center(
      child: Icon(
        entranceInstance != EntrancePages.entrance2
            ? Icons.arrow_forward_outlined
            : Icons.done,
        //size: context.lowRateWidth * 2,
      ),
    ),
  );
}
