import 'package:art_exhibition/constants/constants.dart';
import 'package:art_exhibition/screens/entrance/entrance_route.dart';
import 'package:art_exhibition/widgets/entrance/next.dart';
import 'package:art_exhibition/widgets/entrance/sub.dart';
import 'package:art_exhibition/widgets/entrance/top.dart';
import 'package:flutter/material.dart';

//responsive entrance page.
class EntranceScreen extends StatefulWidget {
  const EntranceScreen({super.key});

  @override
  State<EntranceScreen> createState() => _EntranceScreenState();
}

class _EntranceScreenState extends State<EntranceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 65,
            child: top(Constants.color, entranceInstance.pageContent.imagePath),
          ),
          Expanded(
            flex: 35,
            child: sub(context, entranceInstance.pageContent.heading,
                entranceInstance.pageContent.content),
          )
        ],
      ),
      floatingActionButton: nextButton(Constants.color, context, this),
    );
  }
}
