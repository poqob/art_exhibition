import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/widgets/home/bottom_bar.dart';
import 'package:art_exhibition/widgets/home/category_button.dart';
import 'package:art_exhibition/widgets/home/slider.dart';
import 'package:art_exhibition/widgets/home/tittle.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 13, 13),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                      "https://images.unsplash.com/photo-1620503374956-c942862f0372?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
                  .image),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.lowRateWidth * 2),
          child: Column(
            children: [
              tittle(context),
              slider(context),
              categories(context),
              bottomBar(context),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
