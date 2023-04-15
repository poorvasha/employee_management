import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../configs/resouces.dart';

class InputFieldDataModel {
  Widget? suffixIcon;
  Widget? prefixIcon;
  String hintText;
  String errMessage;
  bool isValid;
  TextEditingController myController;
  TextInputType keyboardType;
  Function onTextChange;
  bool showErrMessage;

  InputFieldDataModel({
    this.suffixIcon,
    this.prefixIcon,
    required this.hintText,
    required this.errMessage,
    this.isValid = false,
    required this.myController,
    required this.keyboardType,
    required this.onTextChange,
    this.showErrMessage = false,
  });
}
