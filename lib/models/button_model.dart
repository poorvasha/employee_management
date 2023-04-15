import 'package:empolyee_management/configs/resouces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ButtonType {
  textButton,
  iconButton,
}

class ButtonDataModel {
  Size size = Size(AppResources.width, 40);
  Color buttonColor = AppColors.primaryColor;
  String? text;
  String? icon;
  Function function;
  ButtonType buttonType;
  Color? textColor;

  ButtonDataModel(
      {required this.size,
      required this.buttonColor,
      required this.text,
      required this.icon,
      required this.function,
      required this.buttonType,
      required this.textColor});
}
