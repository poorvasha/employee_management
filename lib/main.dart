import 'package:empolyee_management/configs/resouces.dart';
import 'package:empolyee_management/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return MaterialApp(
      title: 'Employee List',
      theme: AppResources.appThemeData,
      home: const HomeScreen(title: 'Employee List'),
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
    );
  }
}
