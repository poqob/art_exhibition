import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:art_exhibition/screens/museums/grid_view/show_single_page.dart';
import 'package:flutter/material.dart';

Widget gridview(List<Content> list) {
  return GridView.builder(
    itemCount: list.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      childAspectRatio: 3 / 4,
    ),
    itemBuilder: (BuildContext context, int index) {
      return _gridItem(list[index], context);
    },
  );
}

Widget _gridItem(Content content, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        showSinglePage(context, content);
      },
      child: gridTile(content, context),
    ),
  );
}

GridTile gridTile(Content content, BuildContext context) {
  return GridTile(
    footer: Padding(
      padding: const EdgeInsets.only(),
      child: Center(
        child: Text(
          content.heading,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
        ),
      ),
    ),
    child: CircleAvatar(
      backgroundImage: Image.network(content.imgPath).image,
    ),
  );
}
