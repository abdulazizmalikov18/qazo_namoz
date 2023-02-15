import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qazo_namaz/features/common/controllers/controller.dart';
import 'package:qazo_namaz/features/common/widgets/w_app_bar.dart';
import 'package:qazo_namaz/features/common/widgets/wbutton_widget.dart';
import 'package:qazo_namaz/features/ehtilam/widgets/w_progres_indicator.dart';
import 'package:qazo_namaz/features/ehtilam/views/namaz_start_screen.dart';

class EhtilamScreen extends StatefulWidget {
  const EhtilamScreen({super.key});

  @override
  State<EhtilamScreen> createState() => _EhtilamScreenState();
}

class _EhtilamScreenState extends State<EhtilamScreen> {
  DateTime hayz = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WAppBar(title: ''),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const WProgresindecator(width: 0.6, paddingTop: 10),
              const Spacer(),
              Text(
                'Birinchi marta ehtilom/hayz paytingizni kiriting',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Musulmon kishiga shu vaqtdan boshlab namoz farz bo’ladi.',
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
                  // minimumYear: context.watch<Counter>().dataBir.year + 8,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (val) {
                    setState(() {
                      hayz = val;
                    });
                  },
                ),
              ),
              const Spacer(),
              WButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NamazStartScreen(
                            hayz: hayz,
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
