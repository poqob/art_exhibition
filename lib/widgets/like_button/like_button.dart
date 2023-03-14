// ignore_for_file: empty_catches

import 'package:art_exhibition/data/saved_data/bloc.dart';
import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:art_exhibition/data/saved_data/states.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/widgets/common/glassBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          if (state is SavedLoaded) {
            try {
              var list = state.content;
              list.any((element) {
                if (element.hashCode == content.hashCode) {
                  like = false;
                  list.remove(element);
                  return like!;
                } else {
                  like = true;
                  list.add(content);
                  return like!;
                }
              });
              context.read<SavedCubit>().saveContent(list);
            } catch (e) {}
          }
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
