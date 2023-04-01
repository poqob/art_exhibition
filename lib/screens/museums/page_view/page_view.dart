import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:art_exhibition/screens/content_page/single_content_page.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/debug/debug_widgets.dart';
import 'package:flutter/material.dart';

class MuseumPageView extends StatelessWidget {
  final List<Content> list;
  const MuseumPageView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Body(list: list);
  }
}

class Body extends StatefulWidget {
  final List<Content> list;
  const Body({
    required this.list,
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @Todo("these debug buttons writed to provide tests on windows.")
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _page(),
          backButton(context),
          debugButtons(context, _controller)[0],
          debugButtons(context, _controller)[1],
          debugButtons(context, _controller)[2],
        ],
      ),
    );
  }

  PageView _page() {
    return PageView(
      controller: _controller,
      pageSnapping: true,
      allowImplicitScrolling: true,
      scrollDirection: Axis.horizontal,
      children: List.generate(widget.list.length, (index) {
        Content content = widget.list[index];
        return SingleContentPage(
          heading: content.heading,
          imagePath: content.imgPath,
          text: content.contentText,
          id: content.id,
        );
      }),
    );
  }
}

Positioned backButton(BuildContext context) {
  return Positioned(
    top: 5,
    right: 5,
    child: IconButton(
      icon: const Icon(Icons.back_hand),
      onPressed: () => Navigator.pop(context),
    ),
  );
}
