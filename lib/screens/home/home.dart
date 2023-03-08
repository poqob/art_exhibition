import 'package:art_exhibition/constants/constant_colors.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            _bottomBar(),
            const Spacer(
              flex: 3,
            ),
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
                fontSize: context.dynamicWidth(0.07),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @Todo("Slider package will be added or write one.")
  Expanded _slider() {
    return Expanded(
      flex: 80,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ConstantColors.colorEntranceTheme.getColor),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Expanded _categories() {
    return Expanded(
      flex: 20,
      child: Row(
        children: [
          Expanded(
            child: _categoryButton("Museum"),
          ),
          Expanded(
            child: _categoryButton("Arts"),
          ),
          Expanded(
            child: _categoryButton("Artists"),
          ),
        ],
      ),
    );
  }

  @Todo("i can make it look good.")
  Padding _categoryButton(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            ConstantColors.colorLoginButton.getColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: () {},
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }

  @Todo("glass morphism will be aplied.")
  Expanded _bottomBar() {
    return Expanded(
      flex: 10,
      child: Container(
        width: context.dynamicWidth(0.5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.green),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_outline_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
