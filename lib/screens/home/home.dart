import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 13, 13),
      appBar: AppBar(),
      body: Center(
        child: Text(
          "home",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
