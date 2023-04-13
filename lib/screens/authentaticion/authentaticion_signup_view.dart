import 'package:art_exhibition/constants/constant_backround_color.dart';
import 'package:art_exhibition/constants/constant_colors.dart';
import 'package:art_exhibition/constants/constant_svg.dart';
import 'package:art_exhibition/data/db/api/authentication.dart';
import 'package:art_exhibition/data/db/bloc/authentication/bloc_authentication.dart';
import 'package:art_exhibition/data/db/bloc/authentication/states_authentication.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/auth/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @Todo("ATENCION debug buton in appbar will be removed.")
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: Scaffold(
        appBar: AppBar(actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text("debug button"))
        ]),
        backgroundColor: ConstantBackroundColors.colorSignup.getColor,
        body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {},
          builder: (context, state) {
            return _stateBuilder(state, context);
          },
        ),
      ),
    );
  }
}

Widget _stateBuilder(AuthenticationState state, BuildContext context) {
  if (state is AuthenticationInitial) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 10,
          child: Padding(
            padding: EdgeInsets.only(
                left: context.lowRateWidth,
                right: context.lowRateWidth,
                bottom: context.lowRateWidth),
            child: ConstantSVG.signup.getSVG,
          ),
        ),
        Expanded(
            flex: 20,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.lowRateWidth * 1.5),
              child: Column(
                children: [
                  const Expanded(
                    flex: 10,
                    child: SignUpForm(),
                  ),
                  Expanded(
                    flex: 2,
                    child: _toHaveAccount(context),
                  ),
                ],
              ),
            )),
      ],
    );
  } else if (state is AuthenticationAuthing) {
    return Center(
        child: CircularProgressIndicator(
      color: ConstantColors.colorEntranceTheme.getColor,
    ));
  } else if (state is AuthenticationError) {
    return AlertDialog(
      content: const Text("sign up failed"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/signup");
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
          "Do you have an account ?",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        TextButton(
          child: const Text("Log In !"),
          onPressed: () {
            Navigator.popAndPushNamed(context, "/login");
          },
        ),
      ],
    ),
  );
}
