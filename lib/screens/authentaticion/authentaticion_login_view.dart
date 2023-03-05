import 'package:art_exhibition/constants/constants.dart';
import 'package:art_exhibition/db/api/authentication.dart';
import 'package:art_exhibition/db/bloc/authentication/bloc_authentication.dart';
import 'package:art_exhibition/db/bloc/authentication/states_authentication.dart';
import 'package:art_exhibition/screens/authentaticion/w.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: buildScaffold(),
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(
      backgroundColor: Constants.logInPageBackround,
      appBar: AppBar(),
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthenticationInitial) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: SvgPicture.asset("assets/images/login.svg")),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.lowRateWidth),
                    child: const LogInForm(),
                  ),
                ),
              ],
            );
          } else if (state is AuthenticationAuthing) {
            return const Center(
                child: CircularProgressIndicator(
              color: Constants.color,
            ));
          } else if (state is AuthenticationError) {
            return AlertDialog(
              content: const Text("log in failed"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, "/login");
                    },
                    child: const Text("re-try"))
              ],
            );
          } else {
            //navigate to main screen.
            return AlertDialog(
              content: Text(Authentication.instance.getAuthState.toString()),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("re-try"))
              ],
            );
          }
        },
      ),
    );
  }
}

Future<void> scaffoldMessager(BuildContext context, String message,
    [int durationmultiplier = 1]) async {
  //true statement
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 500 * durationmultiplier),
    ),
  );
}
