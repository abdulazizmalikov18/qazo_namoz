import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qazo_namaz/features/common/widgets/w_app_bar.dart';
import 'package:qazo_namaz/features/common/widgets/wbutton_widget.dart';
import 'package:qazo_namaz/features/ehtilam/widgets/w_progres_indicator.dart';
import 'package:qazo_namaz/features/ehtilam/views/info_check_screen.dart';

class NamazStartScreen extends StatefulWidget {
  final DateTime hayz;
  const NamazStartScreen({super.key, required this.hayz});

  @override
  State<NamazStartScreen> createState() => _NamazStartScreenState();
}

class _NamazStartScreenState extends State<NamazStartScreen> {
  DateTime namoz = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WAppBar(title: ''),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const WProgresindecator(width: 0.891, paddingTop: 20),
              const Spacer(),
              Text(
                'Namozni boshlagan vaqtingiz',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Shunga qarab qazo namozlaringiz hisoblanadi',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 16),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 250,
                child: CupertinoDatePicker(
                  // minimumYear:  context.watch<Counter>().dataBir.year + 3,
                  initialDateTime: namoz,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (val) {
                    setState(() {
                      namoz = val;
                    });
                  },
                ),
              ),
              const Spacer(),
              WButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InfoChkScreen(
                            data: namoz,
                            namoz: namoz,
                            hayz: widget.hayz,
                          )));
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
    );
  }
}
