import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';
import 'package:qazo_namoz/core/utils/my_function.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';
import 'package:qazo_namoz/features/home/presentation/widgets/calendar/month_view_anim.dart';

class AnimCalendarMonth extends StatefulWidget {
  const AnimCalendarMonth({super.key, required this.dateTime});
  final DateTime dateTime;

  @override
  State<AnimCalendarMonth> createState() => _AnimCalendarMonthState();
}

class _AnimCalendarMonthState extends State<AnimCalendarMonth> {
  List<DateTime> getHighlightedDates() {
    return List<DateTime>.generate(
      10,
      (int index) => DateTime.now().subtract(Duration(days: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MonthViewAnim(
      context: context,
      year: widget.dateTime.year,
      month: widget.dateTime.month,
      padding: 12,
      currentDateColor: AppColors.blue,
      highlightedDates: getHighlightedDates(),
      highlightedDateColor: Colors.green,
      monthNames: MyFunctions.monthNames(),
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      onTapDay: (DateTime day) {
        showModalBottomSheet(
          context: context,
          constraints: BoxConstraints(maxHeight: SizeConfig.h(380)),
          builder: (context) => Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        MyFunctions.formatDate(day),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: const Text(
                          "Tayyor",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.h(16)),
              WCheckBoxTile(
                value: false,
                onChanged: (value) {},
                title: "Bomdod",
              ),
              WCheckBoxTile(
                value: false,
                onChanged: (value) {},
                title: "Peshin",
              ),
              WCheckBoxTile(
                value: false,
                onChanged: (value) {},
                title: "Asr",
              ),
              WCheckBoxTile(
                value: false,
                onChanged: (value) {},
                title: "Shom",
              ),
              WCheckBoxTile(
                value: false,
                onChanged: (value) {},
                title: "Xufton",
              ),
              WCheckBoxTile(
                value: false,
                onChanged: (value) {},
                title: "Vitri vojib",
              )
            ],
          ),
        );
      },
    );
  }
}

class WCheckBoxTile extends StatelessWidget {
  const WCheckBoxTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
  });
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged?.call(value),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          children: [
            Transform.scale(
              scale: 1.5,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: AppColors.green,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
