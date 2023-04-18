import 'package:empolyee_management/configs/resouces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ButtonType {
  textButton,
  iconButton,
}

class ButtonDataModel {
  Size? size;
  Color buttonColor = AppColors.primaryColor;
  String? text;
  String? icon;
  Function buttonTappedFunction;
  ButtonType buttonType;
  Color? textColor;
  bool? isActive;

  ButtonDataModel(
      {this.size,
      required this.buttonColor,
      required this.text,
      required this.icon,
      required this.buttonTappedFunction,
      required this.buttonType,
      required this.textColor,
      this.isActive = false});
}
