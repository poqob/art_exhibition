import 'package:art_exhibition/constants/constant_backround_color.dart';
import 'package:art_exhibition/constants/constant_colors.dart';
import 'package:art_exhibition/constants/constant_svg.dart';
import 'package:art_exhibition/db/api/authentication.dart';
import 'package:art_exhibition/db/bloc/authentication/bloc_authentication.dart';
import 'package:art_exhibition/db/bloc/authentication/states_authentication.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/auth/loginForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: buildScaffold(),
    );
  }

  @Todo(
    "i have pixel overflow issue when keyboard appears, i'll take care of it.",
  )
  Scaffold buildScaffold() {
    return Scaffold(
      backgroundColor: ConstantBackroundColors.colorLogin.getColor,
      appBar: AppBar(),
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _stateBuilder(state, context);
        },
      ),
    );
  }

  Widget _stateBuilder(AuthenticationState state, BuildContext context) {
    if (state is AuthenticationInitial) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 45,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.lowRateWidth * 1.5),
                child: ConstantSVG.login.getSVG,
              )),
          const Spacer(flex: 5),
          Expanded(
            flex: 50,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.lowRateWidth),
              child: Column(
                children: [const LogInForm(), _toHaveAccount(context)],
              ),
            ),
          ),
        ],
      );
    } else if (state is AuthenticationAuthing) {
      return Center(
          child: CircularProgressIndicator(
        color: ConstantColors.colorEntranceTheme.getColor,
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
              Navigator.popAndPushNamed(context, '/home');
            },
            child: const Text("okey"),
          ),
        ],
      );
    }
  }

  Padding _toHaveAccount(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.lowRateHeight / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Haven't you any account ?",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          TextButton(
            child: const Text("Sign Up !"),
            onPressed: () {
              Navigator.popAndPushNamed(context, "/signup");
            },
          ),
        ],
      ),
    );
  }
}
