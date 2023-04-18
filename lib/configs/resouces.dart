import 'package:flutter/material.dart';

class AppResources {
  static double width =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

  static double height =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;

  static List<String> designations = [
    "Product Designer",
    "Flutter Developer",
    "QA Tester",
    "Product Owner"
  ];

  static List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
}

class AppThemeData {
  static ThemeData appThemeData = ThemeData(
    fontFamily: 'Roboto',
    inputDecorationTheme: const InputDecorationTheme(
      prefixIconColor: AppColors.primaryColor,
      suffixIconColor: AppColors.primaryColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.lightgray),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.lightgray),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.lightgray),
      ),
    ),
  );
}

class AppColors {
  static const Color primaryColor = Color(0xFF1DA1F2);
  static const Color secondaryColor = Color(0xFF323238);
  static const Color white = Color(0xFfffffff);
  static const Color gray = Color(0xFF949C9E);
  static const Color lightBlue = Color(0xFFEDF8FF);
  static const Color red = Color(0xFFF34642);
  static const Color lightgray = Color(0xFFE5E5E5);
  static const Color extraLightgray = Color(0xFFf2f2f2);
}

class AppTextStyles {
  static const TextStyle mediumRoboto14 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  static TextStyle mediumRoboto16 =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle mediumRoboto18 =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  static TextStyle regularRoboto12 =
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w400);

  static TextStyle regularRoboto14 =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle regularRoboto15 =
      const TextStyle(fontSize: 15, fontWeight: FontWeight.w400);

  static TextStyle regularRoboto16 =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
}

class AppIcons {
  static const String add = "assets/icons/add.svg";
  static const String calender = "assets/icons/calender.svg";
  static const String delete = "assets/icons/delete.svg";
  static const String downArrow = "assets/icons/down_arrow.svg";
  static const String job = "assets/icons/job.svg";
  static const String person = "assets/icons/person.svg";
  static const String rightArrow = "assets/icons/right_arrow.svg";
  static const String calendarRightArrow =
      "assets/icons/calendar_right_arrow.svg";
  static const String calendarLeftArrow =
      "assets/icons/calendar_left_arrow.svg";
}

class AppImages {
  static const String employNotFound = "assets/images/employ_not_found.svg";
}

enum CalendarType { from, to }
