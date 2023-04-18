import 'package:empolyee_management/local_db_models/employees_local_db_model.dart';
import 'package:flutter/material.dart';

import '../configs/resouces.dart';

class DialogHelper {
  static showDeleteDialog(BuildContext context, Function()? onNoTapped,
      Function()? onDeleteTapped) {
    Widget cancelButton = TextButton(
      onPressed: onNoTapped,
      child: const Text("No"),
    );
    Widget continueButton = TextButton(
      onPressed: onDeleteTapped,
      child: const Text("Delete"),
    );

    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text(
        "Confirmation",
        style: AppTextStyles.mediumRoboto18
            .copyWith(color: AppColors.secondaryColor),
      ),
      content: Text(
        "Would you like to delete this employee?",
        style: AppTextStyles.regularRoboto15
            .copyWith(color: AppColors.secondaryColor, height: 1.5),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showSnackbar(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(
      backgroundColor: AppColors.secondaryColor,
      content: Text(
        message,
        style: AppTextStyles.regularRoboto16.copyWith(color: AppColors.white),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
