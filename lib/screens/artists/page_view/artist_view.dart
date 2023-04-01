
import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:art_exhibition/db/bloc/artists/bloc_artist.dart';
import 'package:art_exhibition/db/bloc/artists/states_artist.dart';
import 'package:art_exhibition/screens/content_page/single_content_page.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/common/loading.dart';
import 'package:art_exhibition/widgets/debug/debug_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@Todo('''
i write this page to see if cubit works or not and have i vision.

  the plan about this section:
    when user clicked home/artists button a page going to appear which 
    contains all the artists in it as circle avatar widgets on grid view
    layout.

    these circle avatar widgets are clickeable. When it's clicked open this
    writed page with clicked artists list index number.

''')
class ArtistView extends StatelessWidget {
  const ArtistView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ArtistCubit(),
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
    return BlocConsumer<ArtistCubit, ArtistStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        if (state is ArtistInitial) {
          context.read<ArtistCubit>().getArtist();
          return const Loading();
        } else if (state is ArtistLoading) {
          return const Loading();
        } else if (state is ArtistLoaded) {
          //convert readed data to list of Content() then send them to Body.

          List<Content> list = <Content>[];
          for (var element in state.artists) {
            list.add(Content(
              element.artistName!,
              [element.artistName!, element.artistId!],
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

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text("load error."),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/home");
            },
            child: const Text("back"))
      ],
    );
  }
}
