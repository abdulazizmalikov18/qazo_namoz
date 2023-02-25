import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qazo_namaz/features/common/widgets/wbutton_widget.dart';
import 'package:qazo_namaz/features/main/widgets/calendar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime selectedDate = DateTime.now();
  int month = 3, year = 2023;
  List<String> weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${selectedDate.month}'),
                const Icon(Icons.arrow_forward_ios_rounded)
              ],
            ),
            Text('${selectedDate.year}-yil'),
            SizedBox(height: size.height * 0.08),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                weekDays.length,
                (index) => Container(
                  width: (MediaQuery.of(context).size.width - 32) / 7,
                  alignment: Alignment.center,
                  child: Text(weekDays[index]),
                ),
              ),
            ),
            const SizedBox(height: 8),
            WCalendar(
              month: selectedDate.month,
              selectedDate: selectedDate,
              year: selectedDate.year,
              width: MediaQuery.of(context).size.width - 32,
              onTap: () {},
            ),
            WButton(
              onTap: () {
                selectedDate =
                    DateTime(selectedDate.year, selectedDate.month + 1);
                setState(() {});
              },
              title: "Oldingi oy",
            )
          ],
        ),
      ),
    );
  }
}
