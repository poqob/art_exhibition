// ignore_for_file: invalid_use_of_protected_member

import 'package:art_exhibition/constants/constant_backround_color.dart';
import 'package:art_exhibition/constants/constant_colors.dart';
import 'package:art_exhibition/screens/content_page/single_content_page.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:flutter/material.dart';

@Todo("Create an content model and connect it to db. Then call here asnycly")
Padding homeContentWidget(BuildContext context, State state, dynamic widget) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: context.lowRateWidth),
    child: SingleChildScrollView(
      child: ElevatedButton(
        onPressed: () {
          state.setState(() {
            widget.current = widget.contents[3]; //i'm going to change it.
          });
          showDialog(
              context: context,
              builder: (context) => Scaffold(
                    appBar: AppBar(
                      backgroundColor:
                          ConstantBackroundColors.colorContentPage.getColor,
                      leading: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                    body: SingleContentPage(
                      id: [widget.current!.artName, widget.current!.artId],
                      heading: widget.current!.artName,
                      imagePath: widget.current!.imgPath,
                      text: widget.current!.content,
                    ),
                  ));
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.transparent,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        child: Column(
          children: [
            Text(
              widget.current!.artName!,
              style:
                  TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 40),
            ),
            Text(
              widget.current!.content!,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
              ),
              textDirection: TextDirection.ltr,
            ),
          ],
        ),
      ),
    ),
  );
}
