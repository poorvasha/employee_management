import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../configs/resouces.dart';

class EmployeesNotFoundWidget extends StatelessWidget {
  const EmployeesNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.employNotFound,
          ),
          const SizedBox(height: 4.5),
          Text(
            "No employee records found",
            style: AppTextStyles.mediumRoboto18
                .copyWith(color: AppColors.secondaryColor),
          )
        ],
      ),
    );
  }
}
