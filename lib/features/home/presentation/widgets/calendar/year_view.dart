import 'package:flutter/material.dart';
import 'package:qazo_namoz/features/home/presentation/widgets/calendar/month_view.dart';
import 'package:qazo_namoz/features/home/presentation/widgets/calendar/year_title.dart';

class YearView extends StatelessWidget {
  const YearView({
    super.key,
    required this.context,
    required this.year,
    required this.currentDateColor,
    this.highlightedDates,
    this.highlightedDateColor,
    this.monthNames,
    this.onMonthTap,
    this.monthTitleStyle,
    required this.onTapBack,
    required this.onTapForward,
  });

  final BuildContext context;
  final int year;
  final Color currentDateColor;
  final List<DateTime>? highlightedDates;
  final Color? highlightedDateColor;
  final List<String>? monthNames;
  final Function? onMonthTap;
  final TextStyle? monthTitleStyle;

  final GestureTapCallback onTapBack;
  final GestureTapCallback onTapForward;

  double get horizontalMargin => 16.0;
  double get monthViewPadding => 0;

  Widget buildYearMonths(BuildContext context) {
    final List<Row> monthRows = <Row>[];
    final List<MonthView> monthRowChildren = <MonthView>[];

    for (int month = 1; month <= DateTime.monthsPerYear; month++) {
      monthRowChildren.add(MonthView(
        context: context,
        year: year,
        month: month,
        padding: monthViewPadding,
        currentDateColor: currentDateColor,
        highlightedDates: highlightedDates,
        highlightedDateColor: highlightedDateColor,
        monthNames: monthNames,
        onTap: onMonthTap,
        titleStyle: monthTitleStyle,
      ));

      if (month % 3 == 0) {
        monthRows.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List<MonthView>.from(monthRowChildren),
        ));
        monthRowChildren.clear();
      }
    }

    return Column(
      children: List<Row>.from(monthRows),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                onTapBack();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 18,
              ),
            ),
            YearTitle(year),
            IconButton(
              onPressed: () {
                onTapForward();
              },
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: buildYearMonths(context),
        ),
      ],
    );
  }
}
