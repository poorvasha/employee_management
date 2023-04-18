import 'package:empolyee_management/configs/resouces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/button_model.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key, required this.buttonProps});
  ButtonDataModel buttonProps;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: buttonProps.size,
            backgroundColor: buttonProps.isActive!
                ? buttonProps.textColor
                : buttonProps.buttonColor,
            shadowColor: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        onPressed: () => buttonProps.buttonTappedFunction(),
        child: buttonProps.buttonType == ButtonType.textButton
            ? Text(
                buttonProps.text!,
                style: AppTextStyles.mediumRoboto14.copyWith(
                    color: buttonProps.isActive!
                        ? buttonProps.buttonColor
                        : buttonProps.textColor),
              )
            : SvgPicture.asset(
                buttonProps.icon!,
                width: 18,
                height: 18,
              ));
  }
}
