// ignore_for_file: must_be_immutable

import 'package:art_exhibition/db/models/art/model_art.dart';
import 'package:art_exhibition/screens/home/bloc/bloc_daily_content.dart';
import 'package:art_exhibition/screens/home/bloc/states_daily_content.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/home/bottom_bar.dart';
import 'package:art_exhibition/widgets/home/categories.dart';
import 'package:art_exhibition/widgets/home/home_content_widget.dart';
import 'package:art_exhibition/widgets/home/slider.dart';
import 'package:art_exhibition/widgets/home/tittle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

@Todo('''
Sayfanin arka plani animatik bir sekilde kararacak,
kararma islemi bittiginde yeni arka plan ve icerik current degiskeninde saklanacak,
kararma suresi kadar bir aydinlanma sureci yasanacak,
sürec bittiginde döngü halinde animasyon 'contetns' listesini surekli olarak gezecek.
''')
class Home extends StatefulWidget {
  Home({super.key});
  var logger = Logger();
  Duration duration = const Duration(seconds: 2);

  List<Art> contents = <Art>[];
  Art? current;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.current?.artId != widget.current?.artId) {
      _controller.forward(from: 1.0);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DailyContentCubit(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 13, 13),
        body: _body(),
      ),
    );
  }

  @Todo(
    " bloc_daily_content.dart dosyasi icerisinde getContent() metodu ile DailyLoaded sinifi icerisine veriler depolandi bunlari animasyona dokmek gerek.",
  )
  BlocConsumer<DailyContentCubit, DailyContentStates> _body() {
    return BlocConsumer<DailyContentCubit, DailyContentStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DailyLoaded) {
          try {
            widget.contents = state.contents;
            widget.current == null
                ? widget.current = widget.contents[2]
                : widget.current = widget.current;
          } catch (e) {
            widget.logger.e(e.toString());
          }
          return Stack(
            children: [
              //fade animation
              AnimatedOpacity(
                duration: widget.duration,
                opacity: _controller.value,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(widget.current!.imgPath!).image),
                  ),
                ),
              ),
              //content
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.lowRateWidth * 2),
                child: Column(
                  children: [
                    tittle(context),
                    slider(
                      context,
                      homeContentWidget(context, this, widget),
                    ),
                    categories(context),
                    bottomBar(context),
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is DailyInitial) {
          //start state change
          context.read<DailyContentCubit>().getContents();
          return const Center(child: CircularProgressIndicator());
        }
        //error situation, loading situation
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
