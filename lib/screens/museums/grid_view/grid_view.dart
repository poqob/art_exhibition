import 'package:art_exhibition/constants/constant_backround_color.dart';
import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:art_exhibition/data/db/bloc/museum/bloc_museum.dart';
import 'package:art_exhibition/data/db/bloc/museum/states_museum.dart';
import 'package:art_exhibition/data/db/models/museum/model_museum.dart';
import 'package:art_exhibition/screens/museums/grid_view/grid.dart';
import 'package:art_exhibition/screens/museums/page_view/page_view.dart';
import 'package:art_exhibition/widgets/common/loading.dart';
import 'package:art_exhibition/widgets/common/loading_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MuseumView2 extends StatelessWidget {
  const MuseumView2({super.key});

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
          return Body(
            list: museumToContent(state.museums),
          );
        } else {
          return const LoadingErrorWidget();
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
  Widget? bodyC;

  @override
  void initState() {
    super.initState();
    bodyC = gridview(widget.list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (context) => MuseumPageView(
                              list: widget.list,
                            ));
                  });
                },
                icon: const Icon(Icons.change_circle_outlined)),
          )
        ],
      ),
      body: bodyC,
      backgroundColor: ConstantBackroundColors.colorContentPage.getColor,
    );
  }
}

List<Content> museumToContent(List<Museum> content) {
  //convert readed data to list of Content() then send them to Body.

  List<Content> list = <Content>[];
  for (var element in content) {
    list.add(Content(
      element.museumName!,
      [element.museumName!, element.museumId!],
      element.imagePath!,
      element.content!,
    ));
  }
  return list;
}
