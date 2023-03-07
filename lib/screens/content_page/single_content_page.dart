import 'package:art_exhibition/constants/constant_backround_color.dart';
import 'package:flutter/material.dart';

class SingleContentPage extends StatefulWidget {
  const SingleContentPage({super.key});

  @override
  State<SingleContentPage> createState() => SingleContentPageState();
}

class SingleContentPageState extends State<SingleContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantBackroundColors.colorLogin.getColor,
      appBar: AppBar(),
      body: const Center(
        child: Text("Single Content Page"),
      ),
    );
  }
}
