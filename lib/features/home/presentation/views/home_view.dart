import 'package:flutter/material.dart';
import 'package:qazo_namoz/core/utils/my_function.dart';
import 'package:qazo_namoz/features/home/presentation/widgets/calendar/scrolling_years_calendar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime dateTime = DateTime.now();
  List<DateTime> getHighlightedDates() {
    return List<DateTime>.generate(
      10,
      (int index) => DateTime.now().subtract(Duration(days: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              MyFunctions.dateTimeOnlyMonth(dateTime),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              "${dateTime.year}-yil",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      body: ScrollingYearsCalendar(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 5 * 365)),
        lastDate: DateTime.now(),
        currentDateColor: Colors.transparent,
        highlightedDates: getHighlightedDates(),
        highlightedDateColor: Colors.green,
        monthNames: const <String>[
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'May',
          'Jun',
          'Jul',
          'Aug',
          'Sep',
          'Oct',
          'Nov',
          'Dec',
        ],
        onMonthTap: (int year, int month) => print('Tapped $month/$year'),
        monthTitleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}
