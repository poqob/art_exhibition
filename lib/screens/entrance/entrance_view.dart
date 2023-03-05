import 'package:art_exhibition/screens/entrance/entrance_route.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//responsive entrance page.

class EntranceScreen extends StatefulWidget {
  const EntranceScreen({super.key});

  @override
  State<EntranceScreen> createState() => _EntranceScreenState();
}

class _EntranceScreenState extends State<EntranceScreen> {
  @override
  Widget build(BuildContext context) {
    const Color color = Color.fromARGB(255, 28, 72, 156);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 65,
            child: _top(color, entranceInstance.pageContent.imagePath),
          ),
          Expanded(
            flex: 35,
            child: _sub(context, entranceInstance.pageContent.heading,
                entranceInstance.pageContent.content),
          )
        ],
      ),
      floatingActionButton: _nextButton(color, context),
    );
  }

  FloatingActionButton _nextButton(Color color, BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          switch (entranceInstance) {
            case EntrancePages.entrance0:
              entranceInstance = EntrancePages.entrance1;
              //route
              break;
            case EntrancePages.entrance1:
              entranceInstance = EntrancePages.entrance2;

              //route
              break;
            default:
            //route to logIn screen
          }
        });
        print(entranceInstance);
      },
      backgroundColor: color,
      elevation: 20,
      tooltip: "next",
      child: Icon(
        entranceInstance != EntrancePages.entrance2
            ? Icons.arrow_forward_outlined
            : Icons.done,
        size: context.lowRateWidth * 2,
      ),
    );
  }

  Column _sub(BuildContext context, String tittle, String content) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: context.lowRateWidth),
            child: Text(
              tittle,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(
              left: context.lowRateWidth,
              right: context.lowRateWidth,
            ),
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    );
  }

  Container _top(Color color, String path) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(90.0),
          bottomRight: Radius.circular(225.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(),
          Expanded(
            flex: 6,
            child: Center(
              child: SvgPicture.asset(
                path,
                alignment: Alignment.topCenter,
                semanticsLabel: "entrance0",
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
