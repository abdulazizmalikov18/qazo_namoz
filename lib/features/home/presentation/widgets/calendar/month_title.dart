import 'package:flutter/material.dart';
import 'package:qazo_namoz/features/home/presentation/widgets/calendar/dates.dart';

class MonthTitle extends StatelessWidget {
  const MonthTitle({
    super.key,
    required this.month,
    this.monthNames,
    this.style = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  });

  final int month;
  final List<String>? monthNames;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      getMonthName(month, monthNames: monthNames),
      style: style,
      maxLines: 1,
      overflow: TextOverflow.fade,
      softWrap: false,
    );
  }
}
