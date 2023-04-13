// ignore_for_file: empty_catches

import 'package:art_exhibition/constants/constant_colors.dart';
import 'package:art_exhibition/data/db/api/db.dart';
import 'package:art_exhibition/data/db/bloc/authentication/bloc_authentication.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/auth/textField.dart';
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
  //fields
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingControllerUserName =
      TextEditingController();
  final TextEditingController _textEditingControllerPassword =
      TextEditingController();
  final TextEditingController _textEditingControllerRePassword =
      TextEditingController();
  final TextEditingController _textEditingControllerCountryInput =
      TextEditingController();
  final TextEditingController _textEditingControllerCityInput =
      TextEditingController();

  //variables
  int? countryId;
  int? cityId;

  //init state, controlls Db is connected. If not starts connect.
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
    return SingleChildScrollView(
      child: Form(
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
            TextInput(
              textInputType: TextInputType.visiblePassword,
              formKey: _formKey,
              hintTextt: "re-password",
              isObsecure: true,
              maxLength: 15,
              textEditingController: _textEditingControllerRePassword,
            ),
            _moteherlandChosem(),

            _signUpButton(context)
          ],
        ),
      ),
    );
  }

  @Todo("Dynmaic dropdown menu item will be codded")
  Padding _moteherlandChosem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Expanded(
            child: DropdownMenu(
              onSelected: (value) => countryId = value,
              controller: _textEditingControllerCountryInput,
              label: const Text("Select Country"),
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: "Turkey"),
                DropdownMenuEntry(value: 4, label: "Italy"),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: DropdownMenu(
              onSelected: (value) => cityId = value,
              controller: _textEditingControllerCityInput,
              label: const Text("Select City"),
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: "Istanbul"),
                DropdownMenuEntry(value: 11, label: "Rome"),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  OutlinedButton _signUpButton(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: ConstantColors.colorLoginButton.getColor,
        side: BorderSide(
          style: BorderStyle.solid,
          width: 4,
          color: ConstantColors.colorTextfield.getColor,
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
          context.read<AuthenticationCubit>().signUp(
                username: _textEditingControllerUserName.text,
                password: _textEditingControllerPassword.text,
                countryId: countryId!,
                cityId: cityId!,
              );
        }
      },
    );
  }
}
