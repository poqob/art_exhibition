import 'package:art_exhibition/constants/constant_backround_color.dart';
import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:art_exhibition/db/bloc/artists/bloc_artist.dart';
import 'package:art_exhibition/db/bloc/artists/states_artist.dart';
import 'package:art_exhibition/db/models/artist/model_artist.dart';
import 'package:art_exhibition/screens/artists/grid_view/grid.dart';
import 'package:art_exhibition/screens/artists/loading_error_widget.dart';
import 'package:art_exhibition/screens/artists/page_view/page_view.dart';
import 'package:art_exhibition/widgets/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistView2 extends StatelessWidget {
  const ArtistView2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ArtistCubit(),
      child: const Page2(),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({
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
          return Body(
            list: state.artists,
          );
        } else /*MuseumError situation*/ {
          return const LoadingErrorWidget();
        }
      },
    );
  }
}

class Body extends StatefulWidget {
  final List<Artist> list;
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
    bodyC = gridview(artistToContent(widget.list));
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
                            ArtistPageView(list: artistToContent(widget.list)));
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

List<Content> artistToContent(List<Artist> input) {
  //convert readed data to list of Content() then send them to Body.

  List<Content> list = <Content>[];
  for (var element in input) {
    list.add(Content(
      element.artistName!,
      [element.artistName!, element.artistId!],
      element.imagePath!,
      element.content!,
    ));
  }
  return list;
}
