import 'package:art_exhibition/constants/constant_backround_color.dart';
import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:art_exhibition/data/db/api/queries.dart';
import 'package:art_exhibition/data/db/bloc/art/bloc_art.dart';
import 'package:art_exhibition/data/db/bloc/art/states_art.dart';
import 'package:art_exhibition/data/db/models/art/model_art.dart';
import 'package:art_exhibition/screens/arts/grid_view/grid.dart';
import 'package:art_exhibition/screens/arts/page_view/art_page_view.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/common/loading.dart';
import 'package:art_exhibition/widgets/common/loading_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@Todo('''
  we must to change the logic of the page :( 
  propper design ought to be like: 

  user will have controll on chips to change page content
  dynamically.

  our chips are clickable and interactive but our content couldn't 
  get changes in chips. 

  chips state and content(_body) states can't read changes on each other.  

  proposition: move up the bloc logic on the hierarchy of widget list. 
''')

//keeps current art catagory content list to provide to appbar.
class _CurrentContent {
  static List<Art> list = <Art>[];
  static String tittle = "";
  static Que que = Que.allPaints;
}

class ArtsPageView extends StatefulWidget {
  const ArtsPageView({super.key});

  @override
  State<ArtsPageView> createState() => _ArtsPageViewState();
}

class _ArtsPageViewState extends State<ArtsPageView> {
  @Todo("que parameter will comes from out of class")
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      backgroundColor: ConstantBackroundColors.colorContentPage.getColor,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: _catagories(this),
            ),
            Expanded(
              flex: 60,
              child: _body(this),
            ),
          ],
        ),
      ),
    );
  }

  Widget _catagories(State state) {
    List<Widget> categories = [
      _category(tittle: "paints", que: Que.allPaints, state: state),
      _category(tittle: "decoratives", que: Que.allDecorative, state: state),
      _category(
          tittle: "architectures", que: Que.allArchitecture, state: state),
      _category(tittle: "statues", que: Que.allStatues, state: state),
    ];
    return ListView(
      scrollDirection: Axis.horizontal,
      children: categories,
    );
  }

  Widget _category(
      {required String tittle, required Que que, required State state}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          state.setState(() {
            _CurrentContent.tittle = tittle;
            _CurrentContent.que = que;
          });
        },
        child: Chip(
          avatar: tittle == _CurrentContent.tittle
              ? const Icon(Icons.done, color: Colors.white)
              : null,
          label: Text(tittle),
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: ConstantBackroundColors.colorContentPage.getColor,
          side: const BorderSide(
              color: Colors.white, width: 1, style: BorderStyle.solid),
        ),
      ),
    );
  }

  BlocProvider<ArtCubit> _body(State state) {
    return BlocProvider(
      create: (BuildContext context) => ArtCubit(),
      child: Page(
        que: _CurrentContent.que,
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) =>
                        ArtPageView(list: artToContent(_CurrentContent.list)));
              },
              icon: const Icon(Icons.change_circle_outlined)),
        )
      ],
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
          _CurrentContent.list = state.arts;
          //can we add a listener here that listens _catagory(chips) widgets state?

          return gridview(artToContent(state.arts));
        } else {
          return const LoadingErrorWidget();
        }
      },
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
