import 'package:art_exhibition/constants/constant_colors.dart';
import 'package:art_exhibition/constants/constant_url.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

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
            //_slider(),
            FanCarouselImageSlider(
              imageFitMode: BoxFit.cover,
              imagesLink: Uris.list,
              sliderHeight: context.dynamicHeight(0.6),
              sliderWidth: context.dynamicWidth(1),
              showArrowNav: false,
              expandImageHeight: context.dynamicHeight(0.6),
              expandImageWidth: context.dynamicWidth(0.6),
              userCanDrag: true,
              autoPlay: true,
              isAssets: false,
            ),
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
                fontSize: context.dynamicWidth(0.065),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Expanded _slider() {
    return Expanded(
      flex: 90,
      child: FanCarouselImageSlider(
        imageFitMode: BoxFit.cover,
        imagesLink: Uris.list,
        isAssets: false,
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

  Padding _categoryButton(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: ConstantColors.colorTextfield.getColor,
          borderRadius: BorderRadius.circular(21),
        ),
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
  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "aa"),
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined), label: "hh"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "bb"),
      ],
    );
  }
}
