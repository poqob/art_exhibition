import 'package:art_exhibition/screens/entrance/entrance_route.dart';
import 'package:flutter/material.dart';

FloatingActionButton nextButton(
    Color color, BuildContext context, State state) {
  return FloatingActionButton(
    onPressed: () {
      state.setState(() {
        switch (entranceInstance) {
          case EntrancePages.entrance0:
            entranceInstance = EntrancePages.entrance1;
            break;
          case EntrancePages.entrance1:
            entranceInstance = EntrancePages.entrance2;
            break;
          case EntrancePages.entrance2:
            //animated push
            Navigator.popAndPushNamed(context, "/auth");
            break;
          default:

          //route to logIn screen
        }
      });
    },
    backgroundColor: color,
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
