import 'package:art_exhibition/constants/constant_colors.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 13, 13),
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.lowRateWidth * 2),
        child: Column(
          children: [
            _tittle(context),
            _slider(),
            _categories(),
            _bottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Row _tittle(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: context.lowRateWidth),
          child: Text(
            "DailyContent",
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

  Expanded _slider() {
    return Expanded(
      flex: 70,
      child: Container(
        color: ConstantColors.colorLoginButton.getColor,
      ),
    );
  }

  Expanded _categories() {
    return Expanded(
      flex: 20,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: ConstantColors.colorTextfield.getColor,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: ConstantColors.colorTextfield.getColor,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: ConstantColors.colorTextfield.getColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _bottomNavigationBar() {
    return Expanded(
      flex: 15,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
