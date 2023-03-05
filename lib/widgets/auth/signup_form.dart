import 'package:art_exhibition/constants/constants.dart';
import 'package:art_exhibition/db/api/db.dart';
import 'package:art_exhibition/db/bloc/authentication/bloc_authentication.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/widgets/auth/textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm([Key? key]) : super(key: key);
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingControllerUserName =
      TextEditingController();
  final TextEditingController _textEditingControllerPassword =
      TextEditingController();
  final TextEditingController _textEditingControllerRePassword =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    dbInit();
  }

  //if db connection is not provided then try to connect to db.
  Future<void> dbInit() async {
    if (Db().connection.isClosed) await Db().conn();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          //text inputs
          Expanded(
            child: TextInput(
                textInputType: TextInputType.name,
                formKey: _formKey,
                hintTextt: "username",
                maxLength: 15,
                textEditingController: _textEditingControllerUserName),
          ),
          Expanded(
            child: TextInput(
              textInputType: TextInputType.visiblePassword,
              formKey: _formKey,
              hintTextt: "password",
              isObsecure: true,
              maxLength: 15,
              textEditingController: _textEditingControllerPassword,
            ),
          ),
          Expanded(
            child: TextInput(
              textInputType: TextInputType.visiblePassword,
              formKey: _formKey,
              hintTextt: "re-password",
              isObsecure: true,
              maxLength: 15,
              textEditingController: _textEditingControllerRePassword,
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Expanded(
                  child: DropdownMenu(
                    dropdownMenuEntries: [],
                  ),
                ),
                Spacer(),
                Expanded(
                  child: DropdownMenu(
                    dropdownMenuEntries: [],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),

          //submit button.
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Constants.colorLogInButton,
                side: const BorderSide(
                  style: BorderStyle.solid,
                  width: 4,
                  color: Constants.colorTextField,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Text(
                  "Sign Up",
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
            ),
          )
        ],
      ),
    );
  }
}
