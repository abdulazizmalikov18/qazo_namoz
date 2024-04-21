import 'package:flutter/material.dart';
import 'package:qazo_namoz/features/home/presentation/widgets/calendar/screen_sizes.dart';

class YearTitle extends StatelessWidget {
  const YearTitle(this.year, {super.key});

  final int year;

  @override
  Widget build(BuildContext context) {
    return Text(
      year.toString(),
      style: TextStyle(
        fontSize: screenSize(context) == ScreenSizes.small ? 24.0 : 28.0,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
