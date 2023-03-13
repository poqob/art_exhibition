import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/common/glassBox.dart';
import 'package:art_exhibition/widgets/content/single_content/content.dart';
import 'package:flutter/material.dart';

@Todo('''like button logic will be codded, depending on that what i'll do?
1. store liked datas in file as entire? -picked 
2. store liked datas in files as only db ids? -unnecessary db operations.

*- file format-json.
*- single json covers all content or create json for every content?
*- single json picked.

   single json contains related content and 'like:' property.

   alg:
   open json
   read-fetch all content to an saved content class'es data list
   close json
   record any changes in ui to saved content class'es data list.

   #actions
   -like
   -dislike

   override new content list into json file when ui disposed.

*- json file:
   contains all type datas with only that fields.

   -heading : String
   -catgory name,id : Array[2]
   -image path : String
   -content text : String
   -like situation : bool

*- Json class:  

*- methods: 
   readJson(),
   writeJson(Content content)=>overrides Content classes List into json file.
   writes only 


*- Content class: static List<dynamic> contents; methods: content.add(dynamic)
   ui works on this classes list.
   to prevent any wrong addition operations like adding already added content to json file
   i'll controll every add() operations according to category name and id number of only array parameter.


  ''')
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
