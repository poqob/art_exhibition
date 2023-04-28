import 'package:art_exhibition/constants/constant_backround_color.dart';
import 'package:art_exhibition/data/saved_data/bloc.dart';
import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:art_exhibition/data/saved_data/states.dart';
import 'package:art_exhibition/screens/saved/grid_view/grid.dart';
import 'package:art_exhibition/screens/saved/page_view/page_view.dart';
import 'package:art_exhibition/widgets/common/loading_error_widget.dart';
import 'package:art_exhibition/widgets/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedView2 extends StatelessWidget {
  const SavedView2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SavedCubit(),
      child: const SavedPage2(),
    );
  }
}

// cubit
class SavedPage2 extends StatelessWidget {
  const SavedPage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SavedCubit, SavedStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        if (state is SavedInitial) {
          context.read<SavedCubit>().getSavedContents();
          return const Loading();
        } else if (state is SavedLoading) {
          return const Loading();
        } else if (state is SavedLoaded) {
          return Body(
            appBarTittle: "Saved contents",
            list: state.content,
          );
        } else {
          return const LoadingErrorWidget();
        }
      },
    );
  }
}

// main screen of page, appbar-content
class Body extends StatefulWidget {
  final List<Content> list;
  final String appBarTittle;
  const Body({
    required this.list,
    required this.appBarTittle,
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
        title: Text(widget.appBarTittle),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (context) => SavedPageView(list: widget.list));
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
