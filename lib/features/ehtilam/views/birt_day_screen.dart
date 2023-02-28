import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qazo_namaz/assets/icons/icons.dart';
import 'package:qazo_namaz/features/common/controllers/controller.dart';
import 'package:qazo_namaz/features/common/widgets/wbutton_widget.dart';
import 'package:qazo_namaz/features/ehtilam/widgets/w_progres_indicator.dart';
import 'package:qazo_namaz/features/ehtilam/views/ehtilam_screen.dart';

class BirthDayScreen extends StatefulWidget {
  const BirthDayScreen({super.key});

  @override
  State<BirthDayScreen> createState() => _BirthDayScreenState();
}

class _BirthDayScreenState extends State<BirthDayScreen> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final state = context.read<Counter>();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const WProgresindecator(
                  paddingTop: 50,
                  width: 0.33,
                ),
                const Spacer(),
                SvgPicture.asset(
                  AppIcons.calendar,
                  height: 80,
                  width: 80,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    'Tug’ilgan kuningiz',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 24),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (val) {
                      state.dateTimeChange(val);
                    },
                  ),
                ),
                const Spacer(),
                WButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const EhtilamScreen(),
                      ),
                    );
                  },
                  title: '',
                  icons: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  isActiv: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
