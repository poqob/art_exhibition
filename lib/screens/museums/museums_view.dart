import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:art_exhibition/db/bloc/museum/bloc_museum.dart';
import 'package:art_exhibition/db/bloc/museum/states_museum.dart';
import 'package:art_exhibition/screens/content_page/single_content_page.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/common/loading.dart';
import 'package:art_exhibition/widgets/debug/debug_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MuseumView extends StatelessWidget {
  const MuseumView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MuseumCubits(),
      child: const Page(),
    );
  }
}

class Page extends StatelessWidget {
  const Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MuseumCubits, MuseumStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        if (state is MuseumInitial) {
          context.read<MuseumCubits>().getMuseums();
          return const Loading();
        } else if (state is MuseumLoading) {
          return const Loading();
        } else if (state is MuseumLoaded) {
          //convert readed data to list of Content() then send them to Body.

          List<Content> list = <Content>[];
          for (var element in state.museums) {
            list.add(Content(
              element.museumName!,
              [element.museumName!, element.museumId!],
              element.imagePath!,
              element.content!,
            ));
          }

          return Body(
            list: list,
          );
        } else /*MuseumError situation*/ {
          return const ErrorWidget();
        }
      },
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text("log in failed"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/home");
            },
            child: const Text("re-try"))
      ],
    );
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
          PageView(
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
          ),
          debugButtons(context, _controller)[0],
          debugButtons(context, _controller)[1],
          debugButtons(context, _controller)[2],
        ],
      ),
    );
  }
}
