import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/widgets/common/glassBox.dart';
import 'package:art_exhibition/widgets/content/single_content/content.dart';
import 'package:flutter/material.dart';

class SingleContentPage extends StatefulWidget {
  SingleContentPage({super.key, this.heading, this.imagePath, this.text});
  String? heading;
  String? imagePath;
  String? text;

  @override
  State<SingleContentPage> createState() => SingleContentPageState();
}

class SingleContentPageState extends State<SingleContentPage> {
  //we will bind this to a logic.
  bool clicked = false;
  Color backgroundColor = const Color.fromARGB(255, 29, 28, 28);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      backgroundColor: backgroundColor,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.lowRateWidth),
      child: Stack(
        alignment: Alignment.center,
        children: [
          content(context, widget.heading, widget.text, widget.imagePath),
          _likeButton(context),
        ],
      ),
    );
  }

  Positioned _likeButton(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: context.lowRateHeight / 4,
      child: glassBox(
        context: context,
        border: BorderRadius.circular(15),
        width: context.dynamicHeight(0.07),
        height: context.dynamicHeight(0.07),
        blur: 2,
        child: IconButton(
          onPressed: () {
            setState(() {
              clicked = !clicked;
            });
          },
          icon: clicked != true
              ? const Icon(
                  Icons.favorite_outline,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
        ),
      ),
    );
  }
}
