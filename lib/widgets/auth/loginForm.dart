import 'package:art_exhibition/constants/constant_colors.dart';
import 'package:art_exhibition/db/api/db.dart';
import 'package:art_exhibition/db/bloc/authentication/bloc_authentication.dart';
import 'package:art_exhibition/widgets/auth/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInForm extends StatefulWidget {
  const LogInForm([Key? key]) : super(key: key);
  @override
  LogInFormState createState() {
    return LogInFormState();
  }
}

class LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingControllerUserName =
      TextEditingController();
  final TextEditingController _textEditingControllerPassword =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    try {
      dbInit();
    } catch (e) {}
  }

  //if db connection is not provided then try to connect to db.
  Future<void> dbInit() async {
    if (!Db().isConnected) await Db().conn();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          //text inputs
          TextInput(
              textInputType: TextInputType.name,
              formKey: _formKey,
              hintTextt: "username",
              maxLength: 15,
              textEditingController: _textEditingControllerUserName),
          TextInput(
            textInputType: TextInputType.visiblePassword,
            formKey: _formKey,
            hintTextt: "password",
            isObsecure: true,
            maxLength: 15,
            textEditingController: _textEditingControllerPassword,
          ),

          //submit button.
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: ConstantColors.colorLoginButton.getColor,
              side: BorderSide(
                style: BorderStyle.solid,
                width: 4,
                color: ConstantColors.colorTextfield.getColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Log In",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                context.read<AuthenticationCubit>().auth(
                    username: _textEditingControllerUserName.text,
                    password: _textEditingControllerPassword.text);
              }
            },
          )
        ],
      ),
    );
  }
}
