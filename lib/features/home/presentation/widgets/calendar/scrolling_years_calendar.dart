import 'package:flutter/material.dart';
import 'package:qazo_namoz/features/home/presentation/widgets/calendar/year_view.dart';

class ScrollingYearsCalendar extends StatefulWidget {
  ScrollingYearsCalendar({
    super.key,
    required this.context,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.currentDateColor,
    this.highlightedDates,
    this.highlightedDateColor,
    this.monthNames,
    this.onMonthTap,
    this.monthTitleStyle,
  })  : assert(!initialDate.isBefore(firstDate),
            'initialDate must be on or after firstDate'),
        assert(!initialDate.isAfter(lastDate),
            'initialDate must be on or before lastDate'),
        assert(!firstDate.isAfter(lastDate),
            'lastDate must be on or after firstDate'),
        assert(highlightedDates == null || highlightedDateColor != null,
            'highlightedDateColor is required if highlightedDates is not null'),
        assert(
            monthNames == null || monthNames.length == DateTime.monthsPerYear,
            'monthNames must contain all months of the year');

  final BuildContext context;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Color currentDateColor;
  final List<DateTime>? highlightedDates;
  final Color? highlightedDateColor;
  final List<String>? monthNames;
  final Function? onMonthTap;
  final TextStyle? monthTitleStyle;

  @override
  State<ScrollingYearsCalendar> createState() => _ScrollingYearsCalendarState();
}

class _ScrollingYearsCalendarState extends State<ScrollingYearsCalendar> {
  ValueNotifier<int> year = ValueNotifier<int>(0);
  @override
  void initState() {
    year.value = widget.initialDate.year;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: year,
      builder: (context, count, _) {
        return YearView(
          context: context,
          year: year.value,
          currentDateColor: widget.currentDateColor,
          highlightedDates: widget.highlightedDates,
          highlightedDateColor: widget.highlightedDateColor,
          monthNames: widget.monthNames,
          onMonthTap: widget.onMonthTap,
          monthTitleStyle: widget.monthTitleStyle,
          onTapBack: () {
            if (year.value > widget.firstDate.year) {
              year.value -= 1;
            }
          },
          onTapForward: () {
            if (year.value < widget.lastDate.year) {
              year.value += 1;
            }
          },
        );
      },
    );
  }
}
