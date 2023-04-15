import 'package:empolyee_management/configs/resouces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/empoloyee_details_model.dart';
import '../utils/app_helper.dart';

class EmployeeDataWidget extends StatelessWidget {
  EmployeeDataWidget({super.key, required this.employeeDetails});
  EmployeeDetailsDataModel employeeDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppHelper.toCamelCase(employeeDetails.employeeName),
          style: AppTextStyles.mediumRoboto16
              .copyWith(color: AppColors.secondaryColor),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(AppHelper.toCamelCase(employeeDetails.designation),
            style: AppTextStyles.regularRoboto14
                .copyWith(color: AppColors.lightgray)),
        const SizedBox(
          height: 6,
        ),
        Text(AppHelper.toCamelCase(employeeDetails.employeementPeriod),
            style: AppTextStyles.regularRoboto14
                .copyWith(color: AppColors.lightgray)),
      ],
    );
  }
}
