import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 222, 222),
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: SvgPicture.asset("assets/images/login.svg")),
          Expanded(
            flex: 1,
            child: ,
          ),
        ],
      ),
    );
  }
}
