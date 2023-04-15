import 'package:empolyee_management/configs/resouces.dart';
import 'package:flutter/material.dart';

import '../models/input_field_model.dart';

class InputFieldWidget extends StatelessWidget {
  InputFieldWidget({super.key, required this.inputfieldProps});
  InputFieldDataModel inputfieldProps;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputfieldProps.keyboardType,
      controller: inputfieldProps.myController,
      style: AppTextStyles.regularRoboto16
          .copyWith(color: AppColors.secondaryColor),
      decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () => {},
            child: inputfieldProps.suffixIcon,
          ),
          prefixIcon: inputfieldProps.prefixIcon,
          hintText: inputfieldProps.hintText,
          hintStyle: AppTextStyles.regularRoboto16
              .copyWith(color: AppColors.lightgray)),
    );
  }
}
