import 'package:flutter/material.dart';
import 'package:qazo_namaz/features/common/widgets/wbutton_widget.dart';
import 'package:qazo_namaz/features/main/widgets/calendar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    List<String> weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Oktyabr'),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
          const Text('2020-yil'),
          SizedBox(height: size.height * 0.08),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              weekDays.length,
              (index) => Text(weekDays[index]),
            ),
          ),
          WCalendar(
            month: selectedDate.month,
            selectedDate: selectedDate,
            year: selectedDate.year,
          ),
          WButton(
            onTap: () {
              selectedDate = DateTime(2023, 1, 1);
              setState(() {});
              print('===> ==> Boldi');
            },
            title: "Oldingi oy",
          )
        ],
      ),
    );
  }
}
