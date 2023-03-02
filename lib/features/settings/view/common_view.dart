import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qazo_namaz/features/common/widgets/w_app_bar.dart';
import 'package:qazo_namaz/features/common/widgets/wbutton_widget.dart';

class CommonView extends StatefulWidget {
  const CommonView({super.key});

  @override
  State<CommonView> createState() => _CommonViewState();
}

class _CommonViewState extends State<CommonView> {
  DateTime date = DateTime.now();
  DateTime dateEdit = DateTime.now();

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(
        title: "Umumiy sozlamalar",
        isRedy: () {},
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 72,
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  _showDialog(
                    Column(
                      children: [
                        SizedBox(
                          height: 150,
                          child: CupertinoDatePicker(
                            initialDateTime: date,
                            mode: CupertinoDatePickerMode.date,
                            use24hFormat: true,
                            // This is called when the user changes the date.
                            onDateTimeChanged: (DateTime newDate) {
                              setState(() => dateEdit = newDate);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              WButton(
                                width: MediaQuery.of(context).size.width * 0.4,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                title: 'Bekor qilish',
                              ),
                              const SizedBox(width: 16),
                              WButton(
                                width: MediaQuery.of(context).size.width * 0.3,
                                onTap: () {
                                  setState(() {
                                    date = dateEdit;
                                  });

                                  Navigator.pop(context);
                                },
                                title: 'Saqlash',
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tug’ilgan kun'),
                    const Spacer(),
                    Text('${date.day}.${date.month}.${date.year}'),
                    const SizedBox(height: 12),
                    Container(
                      height: 1,
                      color: Colors.grey,
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
