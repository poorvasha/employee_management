import 'package:empolyee_management/configs/resouces.dart';
import 'package:empolyee_management/local_db_models/employees_local_db_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/app_helper.dart';

class EmployeeItemWidget extends StatelessWidget {
  EmployeeItemWidget({super.key, required this.employee});
  Employee employee;
  @override
  Widget build(BuildContext context) {
    String getEmployeePeriod() {
      String formattedFromPeriod = DateFormat.d()
          .add_MMM()
          .addPattern(',')
          .add_y()
          .format(employee.fromPeriod!)
          .toString();
      if (employee.toPeriod != null) {
        return "$formattedFromPeriod - ${DateFormat.d().add_MMM().addPattern(',').add_y().format(employee.toPeriod!)}";
      }
      return "From $formattedFromPeriod";
    }

    String employeePeriod = getEmployeePeriod();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppHelper.toCamelCase(employee.name!),
          style: AppTextStyles.mediumRoboto16
              .copyWith(color: AppColors.secondaryColor),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(employee.designation!,
            style:
                AppTextStyles.regularRoboto14.copyWith(color: AppColors.gray)),
        const SizedBox(
          height: 8,
        ),
        Text(AppHelper.toCamelCase(employeePeriod),
            style:
                AppTextStyles.regularRoboto14.copyWith(color: AppColors.gray)),
      ],
    );
  }
}
