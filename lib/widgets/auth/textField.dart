import 'package:art_exhibition/constants/constant_colors.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    Key? key,
    this.hintTextt = "",
    this.suffixTextt = "",
    this.isObsecure = false,
    required this.textInputType,
    required this.formKey,
    required this.textEditingController,
    required this.maxLength,
  }) : super(
          key: key,
        );
  final int maxLength;
  final GlobalKey formKey;
  final String hintTextt;
  final String suffixTextt;
  final bool isObsecure;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      obscureText: widget.isObsecure,
      maxLength: widget.maxLength,
      cursorWidth: 1.5 * 2,
      cursorRadius: const Radius.circular(3),
      minLines: 1,
      maxLines: 1,
      style: TextStyle(color: ConstantColors.colorTextfield.getColor),
      showCursor: true,
      cursorColor: ConstantColors.colorTextfield.getColor,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: ConstantColors.colorTextfield.getColor,
              style: BorderStyle.solid,
              width: 4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: ConstantColors.colorTextfield.getColor,
              style: BorderStyle.solid,
              width: 4),
        ),
        hintText: widget.hintTextt,
        hintStyle: TextStyle(
          color: ConstantColors.colorTextfield.getColor,
        ),
        suffixText: widget.suffixTextt,
        suffixStyle: TextStyle(
          color: ConstantColors.colorTextfield.getColor,
        ),
        fillColor: ConstantColors.colorTextfield.getColor,
      ),
      controller: widget.textEditingController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
