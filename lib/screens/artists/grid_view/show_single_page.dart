import 'package:art_exhibition/constants/constant_backround_color.dart';
import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:art_exhibition/screens/content_page/single_content_page.dart';
import 'package:flutter/material.dart';

Future<dynamic> showSinglePage(BuildContext context, Content content) {
  return showDialog(
    context: context,
    builder: (context) => Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantBackroundColors.colorContentPage.getColor,
      ),
      body: SingleContentPage(
        heading: content.heading,
        id: content.id,
        imagePath: content.imgPath,
        text: content.contentText,
      ),
    ),
  );
}
