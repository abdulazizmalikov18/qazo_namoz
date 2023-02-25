import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WCalendar extends StatefulWidget {
  const WCalendar({
    super.key,
    required this.selectedDate,
    required this.year,
    required this.month,
    required this.width,
    required this.onTap,
  });
  final DateTime selectedDate;
  final int year, month;
  final double width;
  final VoidCallback onTap;

  @override
  State<WCalendar> createState() => _WCalendarState();
}

class _WCalendarState extends State<WCalendar> {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: List<TableRow>.generate(
        5, // number of rows
        (i) => TableRow(
          children: List<Widget>.generate(
            7, // number of columns
            (j) {
              final date = DateTime(
                widget.selectedDate.year,
                widget.selectedDate.month,
                (i * 7) + j + 1 - widget.selectedDate.weekday,
              );

              return InkWell(
                onTap: widget.onTap,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: date.month == widget.selectedDate.month
                        ? Colors.grey.shade300
                        : Colors.transparent,
                  ),
                  margin: const EdgeInsets.all(2),
                  alignment: Alignment.bottomRight,
                  child: Stack(
                    children: [
                      if (date.month == widget.selectedDate.month)
                        Lottie.asset(
                          'assets/lottils/wave.json',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: Text(date.day.toString()),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
