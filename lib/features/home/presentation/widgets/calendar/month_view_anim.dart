import 'package:flutter/material.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';
import 'package:qazo_namoz/features/home/presentation/widgets/calendar/dates.dart';
import 'package:qazo_namoz/features/home/presentation/widgets/calendar/day_number_anim.dart';

class MonthViewAnim extends StatelessWidget {
  const MonthViewAnim({
    super.key,
    required this.context,
    required this.year,
    required this.month,
    this.padding = 16,
    this.margin = 2,
    required this.currentDateColor,
    this.highlightedDates,
    this.highlightedDateColor,
    this.monthNames,
    this.titleStyle,
    required this.onTapDay,
  });

  final BuildContext context;
  final int year;
  final int month;
  final double padding;
  final Color currentDateColor;
  final List<DateTime>? highlightedDates;
  final Color? highlightedDateColor;
  final List<String>? monthNames;
  final TextStyle? titleStyle;
  final double margin;
  final Function(DateTime day) onTapDay;

  Color? getDayNumberColor(DateTime date) {
    Color? color;
    if (isCurrentDate(date)) {
      color = currentDateColor;
    } else if (highlightedDates != null &&
        isHighlightedDate(date, highlightedDates ?? [])) {
      color = highlightedDateColor ?? Colors.white;
    }
    return color;
  }

  Widget buildMonthDays(BuildContext context) {
    final size = (MediaQuery.sizeOf(context).width - 32 - (margin * 14)) / 7;
    final List<Row> dayRows = <Row>[];
    final List<DayNumberAnim> dayRowChildren = <DayNumberAnim>[];

    final int daysInMonth = getDaysInMonth(year, month);
    final int firstWeekdayOfMonth = DateTime(year, month, 1).weekday;

    for (int day = 2 - firstWeekdayOfMonth; day <= daysInMonth; day++) {
      Color? color;
      print("=====>>>> GetDay $day");
      if (day > 0) {
        color = getDayNumberColor(DateTime(year, month, day));
      }

      dayRowChildren.add(DayNumberAnim(
        day: day,
        color: color,
        size: size,
        margin: margin,
        dateTime: DateTime(year, month, day),
        onTap: onTapDay,
      ));

      if ((day - 1 + firstWeekdayOfMonth) % DateTime.daysPerWeek == 0 ||
          day == daysInMonth) {
        dayRows.add(Row(children: List<DayNumberAnim>.from(dayRowChildren)));
        dayRowChildren.clear();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: dayRows,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: getWeekName().map<Widget>((e) {
              final size =
                  (MediaQuery.sizeOf(context).width - 32 - (margin * 14)) / 7;
              return Container(
                height: size,
                width: size,
                margin: EdgeInsets.symmetric(horizontal: margin),
                alignment: Alignment.center,
                child: Text(
                  e,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyText,
                  ),
                ),
              );
            }).toList(),
          ),
          buildMonthDays(context),
        ],
      ),
    );
  }
}
