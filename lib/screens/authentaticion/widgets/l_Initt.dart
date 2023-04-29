import 'package:art_exhibition/constants/constant_svg.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/widgets/auth/loginForm.dart';
import 'package:flutter/material.dart';

Column initView(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
          flex: 45,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.lowRateWidth * 1.5),
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
