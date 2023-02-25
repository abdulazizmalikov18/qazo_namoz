import 'package:flutter/material.dart';

class WCalendar extends StatefulWidget {
  const WCalendar({
    super.key,
    required this.selectedDate,
    required this.year,
    required this.month,
  });
  final DateTime selectedDate;
  final int year, month;

  @override
  State<WCalendar> createState() => _WCalendarState();
}

class _WCalendarState extends State<WCalendar> {
  @override
  Widget build(BuildContext context) {
    DateTime firstDayOfMonth = DateTime(widget.year, widget.month, 1);
    int daysInMonth = DateTime(widget.year, widget.month + 1, 0).day;
    int startingWeekday = firstDayOfMonth.weekday;

    List<Widget> rows = [];
    List<Widget> cells = [];

    // Add empty cells for weekdays before the first day of the month
    for (int i = 1; i < startingWeekday; i++) {
      cells.add(Container());
    }

    // Add cells for each day of the month
    for (int i = 1; i <= daysInMonth; i++) {
      // DateTime date = DateTime(widget.year, widget.month, i);
      bool isSelected = widget.selectedDate.year == widget.year &&
          widget.selectedDate.month == widget.month &&
          widget.selectedDate.day == i;
      cells.add(
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 7,
            alignment: Alignment.center,
            decoration: isSelected
                ? BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.amber,
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.blue,
                  ),
            child: Center(child: Text('$i')),
          ),
        ),
      );

      // If we've reached the end of the week, add the row to the list of rows
      if ((i + startingWeekday - 1) % 7 == 0 || i == daysInMonth) {
        rows.add(
          Row(
            mainAxisAlignment: i != daysInMonth
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: List.from(cells),
          ),
        );
        cells.clear();
      }
    }

    return Column(
      children: List.from(rows),
    );
  }
}
