class AppHelper {
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

extension DateTimeExtension on DateTime {
  DateTime next(int day) {
    return add(
      Duration(
        days: (day - weekday) % DateTime.daysPerWeek,
      ),
    );
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
