import 'package:intl/intl.dart';

class MyFunctions {
  static String dateTimeFormatMonth(DateTime dateTime) {
    String formattedDateTime = DateFormat('dd-MMMM, yyyy').format(dateTime);
    return formattedDateTime;
  }

  static String dateTimeOnlyMonth(DateTime dateTime) {
    String formattedDateTime = DateFormat('MMMM').format(dateTime);
    return formattedDateTime;
  }
}
