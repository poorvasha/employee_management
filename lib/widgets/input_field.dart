import 'package:empolyee_management/configs/resouces.dart';
import 'package:flutter/material.dart';

import '../models/input_field_model.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({super.key, required this.inputfieldProps});
  final InputFieldDataModel inputfieldProps;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: InkWell(
        onTap: () =>
            inputfieldProps.onTap != null ? inputfieldProps.onTap!() : null,
        child: TextField(
            enabled: inputfieldProps.type == InputType.text,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: inputfieldProps.keyboardType,
            controller: inputfieldProps.textController,
            style: AppTextStyles.regularRoboto14
                .copyWith(color: AppColors.secondaryColor),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                suffixIcon: inputfieldProps.suffixIcon,
                prefixIcon: inputfieldProps.prefixIcon,
                hintText: inputfieldProps.hintText,
                hintStyle: AppTextStyles.regularRoboto14
                    .copyWith(color: AppColors.gray))),
      ),
    );
  }
}
