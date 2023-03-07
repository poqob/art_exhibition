import 'package:art_exhibition/constants/constant_backround_color.dart';
import 'package:flutter/material.dart';

class MultiContentPage extends StatefulWidget {
  const MultiContentPage({super.key});

  @override
  State<MultiContentPage> createState() => _MultiContentPageState();
}

class _MultiContentPageState extends State<MultiContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantBackroundColors.colorLogin.getColor,
      appBar: AppBar(),
      body: const Center(
        child: Text("Multi Content Page"),
      ),
    );
  }
}
