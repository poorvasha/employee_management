import 'package:empolyee_management/configs/resouces.dart';
import 'package:empolyee_management/configs/routes.dart';
import 'package:empolyee_management/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/employees_data_manipulation_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    return BlocProvider(
      create: (context) => EmployeeDataManipulationBloc(),
      child: MaterialApp(
        title: 'Employee List',
        theme: AppThemeData.appThemeData,
        onGenerateRoute: Routes.generateRoutesWithParams,
        home: const HomeScreen(title: 'Employee List'),
        debugShowCheckedModeBanner: false,
        showSemanticsDebugger: false,
      ),
    );
  }
}
