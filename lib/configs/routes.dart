import 'package:empolyee_management/local_db_models/employees_local_db_model.dart';
import 'package:empolyee_management/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../screens/employee_form_screen.dart';

class Routes {
  static Route<dynamic> generateRoutesWithParams(RouteSettings settings) {
    switch (settings.name) {
      case '/HomeScreen':
        return MaterialPageRoute(
            builder: ((context) =>
                HomeScreen(title: settings.arguments as String)));
      case '/EmployeeFormScreen':
        return MaterialPageRoute(
            builder: ((context) => EmployeeFormScreen(
                employeeData: settings.arguments != null
                    ? settings.arguments as Employee
                    : null)));

      default:
        return MaterialPageRoute(
            builder: ((context) =>
                HomeScreen(title: settings.arguments as String)));
    }
  }
}
