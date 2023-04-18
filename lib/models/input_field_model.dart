import 'package:flutter/material.dart';

enum InputType { text, prompt }

class InputFieldDataModel {
  Widget? suffixIcon;
  Widget? prefixIcon;
  String hintText;
  String errMessage;
  bool isValid;
  TextEditingController textController;
  TextInputType keyboardType;
  bool showErrMessage;
  InputType type;
  Function? onTap;

  InputFieldDataModel(
      {this.suffixIcon,
      this.prefixIcon,
      required this.hintText,
      required this.errMessage,
      this.isValid = false,
      required this.textController,
      required this.keyboardType,
      this.type = InputType.text,
      this.showErrMessage = false,
      this.onTap});
}
