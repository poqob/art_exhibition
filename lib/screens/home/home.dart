import 'package:art_exhibition/db/models/art/model_art.dart';
import 'package:art_exhibition/screens/content_page/single_content_page.dart';
import 'package:art_exhibition/screens/home/bloc/bloc_daily_content.dart';
import 'package:art_exhibition/screens/home/bloc/states_daily_content.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/home/bottom_bar.dart';
import 'package:art_exhibition/widgets/home/categories.dart';
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
        body: BlocConsumer<DailyContentCubit, DailyContentStates>(
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
                            image:
                                Image.network(widget.current!.imgPath!).image),
                      ),
                    ),
                  ),
                  //content
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.lowRateWidth * 2),
                    child: Column(
                      children: [
                        tittle(context),
                        slider(
                          context,
                          content(context),
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
        ),
      ),
    );
  }

  @Todo("Create an content model and connect it to db. Then call here asnycly")
  Padding content(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.lowRateWidth),
      child: SingleChildScrollView(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              widget.current = widget.contents[3];
            });
            showDialog(
              context: context,
              builder: (context) => SingleContentPage(
                heading: widget.current!.artName,
                imagePath: widget.current!.imgPath,
                text: widget.current!.content,
              ),
            );
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            elevation: MaterialStateProperty.all<double>(0),
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.transparent,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          child: Column(
            children: [
              Text(
                widget.current!.artName!,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 40),
              ),
              Text(
                widget.current!.content!,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                ),
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
