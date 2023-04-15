import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppHelper {
  static bool validateField(String value) {
    return true;
  }

  static String toCamelCase(String value) {
    if (value.isEmpty) {
      return value;
    }
    List<String> words = value.split(' ');
    String result = '';
    for (int i = 0; i < words.length; i++) {
      result +=
          " ${words[i][0].toUpperCase()}${words[i].substring(1).toLowerCase()}";
    }
    return result.trimLeft();
  }
}
