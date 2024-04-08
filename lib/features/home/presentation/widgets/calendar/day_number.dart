import 'package:flutter/material.dart';
import 'package:qazo_namoz/features/home/presentation/widgets/calendar/screen_sizes.dart';

class DayNumber extends StatelessWidget {
  const DayNumber({
    super.key,
    required this.day,
    this.color,
  });

  final int day;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final double size = getDayNumberSize(context);
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(1),
      decoration: color != null
          ? BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            )
          : null,
      child: Text(
        day < 1 ? '' : day.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color != null ? Colors.white : Colors.black87,
          fontSize: screenSize(context) == ScreenSizes.small ? 8.0 : 10.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
