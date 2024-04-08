import 'package:flutter/material.dart';
import 'package:qazo_namoz/features/home/presentation/widgets/calendar/screen_sizes.dart';
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
  @override
  Widget build(BuildContext context) {
    final int itemCount = widget.lastDate.year - widget.firstDate.year + 1;

    // Makes sure the right initial offset is calculated so the listview
    // jumps to the initial year.
    final double initialOffset =
        (widget.initialDate.year - widget.firstDate.year) *
            getYearViewHeight(context);
    final ScrollController scrollController =
        ScrollController(initialScrollOffset: initialOffset);

    print("=====>>>>>> NImaga");
    List<Widget> children = [];
    for (int index = 0; index < itemCount; index++) {
      final int year = index + widget.firstDate.year;
      children.add(YearView(
        context: context,
        year: year,
        currentDateColor: widget.currentDateColor,
        highlightedDates: widget.highlightedDates,
        highlightedDateColor: widget.highlightedDateColor,
        monthNames: widget.monthNames,
        onMonthTap: widget.onMonthTap,
        monthTitleStyle: widget.monthTitleStyle,
      ));
    }

    return ListView(
      controller: scrollController,
      children: children,
    );

    // return ListView.builder(
    //   padding: const EdgeInsets.only(bottom: 16.0),
    //   // controller: scrollController,
    //   reverse: true,
    //   itemCount: itemCount,
    //   itemBuilder: (BuildContext context, int index) {
    //     final int year = index + widget.firstDate.year;
    //     return _getYearView(year);
    //   },
    // );
  }
}
