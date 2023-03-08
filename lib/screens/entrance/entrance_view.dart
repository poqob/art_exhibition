import 'package:art_exhibition/constants/constant_colors.dart';
import 'package:art_exhibition/screens/authentaticion/authentaticion_login_view.dart';
import 'package:art_exhibition/screens/entrance/entrance_route.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/widgets/entrance/next.dart';
import 'package:art_exhibition/widgets/entrance/sub.dart';
import 'package:art_exhibition/widgets/entrance/top.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//responsive entrance page.
class EntranceScreen extends StatefulWidget {
  const EntranceScreen({super.key});

  @override
  State<EntranceScreen> createState() => _EntranceScreenState();
}

class _EntranceScreenState extends State<EntranceScreen> {
  final PageController _controller = PageController();
  final int msDuration = 600;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            pageSnapping: true,
            allowImplicitScrolling: true,
            scrollDirection: Axis.horizontal,
            children: [
              _page(context, EntrancePages.entrance0),
              _page(context, EntrancePages.entrance1),
              _page(context, EntrancePages.entrance2),
              const LogIn(),
            ],
          ),
          !isLastPage
              ? Positioned(
                  top: 15,
                  right: 15,
                  child: TextButton(
                    child: Text(
                      "skip",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    onPressed: () {
                      _controller.animateToPage(2,
                          duration: Duration(milliseconds: msDuration),
                          curve: Curves.linear);

                      setState(() {
                        entranceInstance = EntrancePages.entrance2;
                      });
                    },
                  ),
                )
              : const SizedBox(),
          !isLastPage
              ? Positioned(
                  top: context.dynamicHeight(0.6),
                  right: 10,
                  child: SmoothPageIndicator(
                    controller: _controller, // PageController
                    count: EntrancePages.values.length,
                    effect: const WormEffect(), // your preferred effect
                    onDotClicked: (index) {},
                  ),
                )
              : const SizedBox(),
        ],
      ),
      floatingActionButton: !isLastPage
          ? nextButton(
              context,
              this,
              _controller,
              msDuration,
            )
          : const SizedBox(),
    );
  }

  Column _page(BuildContext context, EntrancePages content) {
    return Column(
      children: [
        Expanded(
          flex: 65,
          child: top(ConstantColors.colorEntranceTheme.getColor,
              content.pageContent.imagePath),
        ),
        Expanded(
          flex: 35,
          child: sub(context, content.pageContent.heading,
              content.pageContent.content),
        )
      ],
    );
  }
}
