import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';
import 'package:qazo_namoz/core/utils/my_function.dart';
import 'package:qazo_namoz/features/common/navigation/routs_contact.dart';
import 'package:qazo_namoz/features/common/widgets/w_button.dart';
import 'package:qazo_namoz/features/home/presentation/widgets/calendar/anim_calendar_mont.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            context.push(AppRoutPath.calendar, extra: {"day": dateTime}).then(
              (value) {
                if (value is DateTime) {
                  dateTime = value;
                  setState(() {});
                }
              },
            );
          },
          child: Column(
            children: [
              Text(
                MyFunctions.dateTimeOnlyMonth(dateTime),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                "${dateTime.year}-yil",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      body: AnimCalendarMonth(dateTime: dateTime),
      bottomNavigationBar: Container(
        height: 52,
        margin: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: WButton(
                onTap: () {
                  setState(() {
                    dateTime = MyFunctions.subtractMonths(dateTime, 1);
                  });
                },
                color: AppColors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 16,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            MyFunctions.dateTimeSel(dateTime, true),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Text(
                            "Qazo namozlar: 27",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: WButton(
                color: Colors.white,
                border: Border.all(color: AppColors.border),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                isDisabled:
                    DateTime.now().isBefore(MyFunctions.addMonths(dateTime, 1)),
                onTap: () {
                  setState(() {
                    dateTime = MyFunctions.addMonths(dateTime, 1);
                  });
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            MyFunctions.dateTimeSel(dateTime, false),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            "Qazo namozlar: 27",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
