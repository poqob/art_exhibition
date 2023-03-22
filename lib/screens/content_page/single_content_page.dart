// ignore_for_file: must_be_immutable, empty_catches, camel_case_types

import 'package:art_exhibition/data/saved_data/bloc.dart';
import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:art_exhibition/data/saved_data/states.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/content/single_content/content_widget.dart';
import 'package:art_exhibition/widgets/like_button/like_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
Single content page  shows only one content.
like button works can store content in saved.json file or remove content from there.
it's logic codded in 'lib/data/saved_data/'.
*/

@Todo('''
in later updates, i'll expect from myself to code 
*catagorized multi_content_page
*new saved contents page 
*renovating saved content screen which located in lib/screens/saved/saved.dart
*maybe i can tidy the code. it'd look better.
''')
class SingleContentPage extends StatelessWidget {
  final String heading;

  final List id; //name,id

  final String imagePath;

  final String text;

  SingleContentPage({
    super.key,
    required this.heading,
    required this.imagePath,
    required this.text,
    required this.id,
  });
  Color backgroundColor = const Color.fromARGB(255, 29, 28, 28);
  bool? like;

  @override
  Widget build(BuildContext context) {
    Content content = Content(
      heading,
      id,
      imagePath,
      text,
    );

    return BlocProvider(
      create: (context) => SavedCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        backgroundColor: backgroundColor,
        body: _body(context, content),
      ),
    );
  }

  Widget _body(BuildContext context, Content content) {
    return BlocConsumer<SavedCubit, SavedStates>(
      listener: (context, state) {
        //Logger().d("$state, $like");
      },
      builder: (context, state) {
        if (state is SavedInitial) {
          context.read<SavedCubit>().getSavedContents();
          return const _loading();
        } else if (state is SavedLoaded) {
          _likeLogic(state, content);

          return _page(
            heading: heading,
            text: text,
            imagePath: imagePath,
            like: like,
            id: id,
            state: state,
          );
        } else {
          return const _loading();
        }
      },
    );
  }

  void _likeLogic(SavedLoaded state, Content content) {
    try {
      var list = state.content;

      if (list.contains(content)) {
        like = true;
      } else {
        like = false;
      }
    } catch (e) {}
  }
}

class _page extends StatelessWidget {
  const _page({
    super.key,
    required this.heading,
    required this.text,
    required this.imagePath,
    required this.like,
    required this.id,
    required this.state,
  });

  final String heading;
  final String text;
  final String imagePath;
  final bool? like;
  final List id;
  final SavedStates state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.lowRateWidth),
      child: Stack(
        alignment: Alignment.center,
        children: [
          contentWidget(context, heading, text, imagePath),
          likeButton(
            context,
            state,
            like,
            Content(
              heading,
              id,
              imagePath,
              text,
            ),
          ),
        ],
      ),
    );
  }
}

class _loading extends StatelessWidget {
  const _loading();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
