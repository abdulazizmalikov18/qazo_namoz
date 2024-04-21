import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class MyFunctions {
  static String dateTimeFormatMonth(DateTime dateTime) {
    String formattedDateTime = DateFormat('dd-MMMM, yyyy').format(dateTime);
    return formattedDateTime;
  }

  static String formatDate(DateTime dateTime) {
    DateFormat dateFormat = DateFormat('dd.MM.yyyy');
    return dateFormat.format(dateTime);
  }

  static String dateTimeOnlyMonth(DateTime dateTime) {
    String formattedDateTime = DateFormat('MMMM').format(dateTime);
    return formattedDateTime;
  }

  static DateTime subtractMonths(DateTime date, int months) {
    int year = date.year;
    int month = date.month;
    month -= months;

    while (month <= 0) {
      month += 12;
      year--;
    }

    return DateTime(year, month, date.day, date.hour, date.minute, date.second,
        date.millisecond, date.microsecond);
  }

  static DateTime addMonths(DateTime date, int months) {
    int year = date.year;
    int month = date.month;

    month += months;

    while (month > 12) {
      month -= 12;
      year++;
    }

    int maxDaysInMonth = DateTime(year, month + 1, 0).day;
    int day = date.day;
    if (day > maxDaysInMonth) {
      day = maxDaysInMonth;
    }

    return DateTime(year, month, day, date.hour, date.minute, date.second,
        date.millisecond, date.microsecond);
  }

  static String dateTimeSel(DateTime dateTime, bool remove) {
    final editDateTime =
        remove ? subtractMonths(dateTime, 1) : addMonths(dateTime, 1);
    String formattedDateTime = DateFormat('MMMM, yyyy').format(editDateTime);
    return formattedDateTime;
  }

  static double paddingBottom(BuildContext context) {
    return Platform.isIOS ? MediaQuery.of(context).viewPadding.bottom : 16;
  }

  static List<String> monthNames() {
    return const <String>[
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
  }
}
