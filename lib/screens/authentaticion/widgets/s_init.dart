import 'package:art_exhibition/constants/constant_svg.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/widgets/auth/signup_form.dart';
import 'package:flutter/material.dart';

// main view of sign up page
Widget initView(BuildContext context) {
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
