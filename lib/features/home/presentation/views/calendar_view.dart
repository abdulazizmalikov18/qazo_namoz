import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';
import 'package:qazo_namoz/core/utils/my_function.dart';
import 'package:qazo_namoz/features/home/presentation/widgets/calendar/scrolling_years_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key, required this.dateTime});
  final DateTime dateTime;

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  List<DateTime> getHighlightedDates() {
    return List<DateTime>.generate(
      10,
      (int index) => DateTime.now().subtract(Duration(days: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ScrollingYearsCalendar(
        context: context,
        initialDate: widget.dateTime,
        firstDate: DateTime.now().subtract(const Duration(days: 5 * 365)),
        lastDate: DateTime.now(),
        currentDateColor: AppColors.green,
        highlightedDates: getHighlightedDates(),
        highlightedDateColor: AppColors.green,
        monthNames: MyFunctions.monthNames(),
        onMonthTap: (int year, int month) {
          context.pop(DateTime(year, month));
        },
        monthTitleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
