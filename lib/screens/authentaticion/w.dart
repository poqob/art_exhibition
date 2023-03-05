import 'package:art_exhibition/constants/constants.dart';
import 'package:art_exhibition/screens/authentaticion/t.dart';
import 'package:flutter/material.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

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
              primary: Constants.colorTextField,
              side: const BorderSide(
                style: BorderStyle.solid,
                width: 1.6,
                color: Constants.colorTextField,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "submit",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 22),
              ),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  if (await db.auth(_textEditingControllerUserName.text,
                      _textEditingControllerPassword.text)) {
                    await messagger(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Wrong username or password entry')),
                    );
                  }
                  // ignore: empty_catches
                } catch (e) {}
              }
            },
          )
        ],
      ),
    );
  }
}

Future<void> messagger(BuildContext context) async {
  //true statement
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('succesfully Logged in'),
      duration: Duration(milliseconds: 500),
    ),
  );
}
