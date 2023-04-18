import 'package:empolyee_management/configs/resouces.dart';
import 'package:flutter/material.dart';

import '../widgets/calendar.dart';

dynamic canlendarBottomSheet(BuildContext context, CalendarType calendarType,
    Function onSaveButtonTapped, DateTime? fromday, DateTime? defaultDate) {
  showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            insetPadding: const EdgeInsets.all(16),
            contentPadding: const EdgeInsets.all(3),
            content: SizedBox(
              width: AppResources.width,
              child: Calendar(
                calendarType: calendarType,
                onSaveButtonTapped: onSaveButtonTapped,
                firstDay: fromday,
                defaultDate: defaultDate,
              ),
            ),
          )));
}
