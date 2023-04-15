import 'package:empolyee_management/configs/resouces.dart';
import 'package:empolyee_management/models/button_model.dart';
import 'package:empolyee_management/widgets/input_field.dart';
import 'package:flutter/material.dart';

import '../models/empoloyee_details_model.dart';
import '../models/input_field_model.dart';
import '../widgets/button.dart';
import '../widgets/employee_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: AppTextStyles.mediumRoboto18,
          ),
        ),
        body: const Placeholder());
  }
}
