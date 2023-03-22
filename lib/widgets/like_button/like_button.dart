// ignore_for_file: empty_catches

import 'package:art_exhibition/data/saved_data/bloc.dart';
import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:art_exhibition/data/saved_data/states.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/widgets/common/glassBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//this widget position itselfs right bottom of the page,
//i recommend, use this widget in stack widget as last child.

//heart centered,glass looked widget with _logic function.
/*
_logic: every time we press the like button, function controls that if SavedState's
        content list has related pages content.
        if there is -it means user liked related content before and like button color is red which means yes i like- 
        funtion removes it in list.
        Otherwise adds to list and calls one of state function from SavedCubit class that named as saveContent with changed list
        of content parameters.  
*/

Positioned likeButton(
    BuildContext context, SavedStates state, bool? like, Content content) {
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
          _logic(state, content, context);
        },
        icon: like != true
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

void _logic(SavedStates state, Content content, BuildContext context) {
  if (state is SavedLoaded) {
    try {
      List<Content> list = state.content;
      //state.content;
      if (list.contains(content)) {
        list.remove(content);
      } else {
        list.add(content);
      }

      context.read<SavedCubit>().saveContent(list);
    } catch (e) {}
  }
}
