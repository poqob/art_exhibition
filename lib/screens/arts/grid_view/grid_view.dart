import 'package:art_exhibition/constants/constant_backround_color.dart';
import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:art_exhibition/db/api/queries.dart';
import 'package:art_exhibition/db/bloc/art/bloc_art.dart';
import 'package:art_exhibition/db/bloc/art/states_art.dart';
import 'package:art_exhibition/db/models/art/model_art.dart';
import 'package:art_exhibition/screens/arts/grid_view/grid.dart';
import 'package:art_exhibition/screens/arts/page_view/art_page_view.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/common/loading.dart';
import 'package:art_exhibition/widgets/common/loading_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtsPageView extends StatelessWidget {
  const ArtsPageView({super.key});

  @Todo("que parameter will comes from out of class")
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ArtCubit(),
      child: const Page(
        que: Que.allPaints,
      ),
    );
  }
}

class Page extends StatelessWidget {
  final Que que;
  const Page({
    required this.que,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArtCubit, ArtStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        if (state is ArtInitial) {
          context.read<ArtCubit>().getArt(que);
          return const Loading();
        } else if (state is ArtLoading) {
          return const Loading();
        } else if (state is ArtLoaded) {
          return Body(
            list: state.arts,
          );
        } else {
          return const LoadingErrorWidget();
        }
      },
    );
  }
}

class Body extends StatefulWidget {
  final List<Art> list;
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
    bodyC = gridview(artToContent(widget.list));
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
                        builder: (context) =>
                            ArtPageView(list: artToContent(widget.list)));
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

List<Content> artToContent(List<Art> input) {
  //convert readed data to list of Content() then send them to Body.

  List<Content> list = <Content>[];
  for (var element in input) {
    list.add(Content(
      element.artName!,
      [element.artName!, element.artId!],
      element.imgPath!,
      element.content!,
    ));
  }
  return list;
}
