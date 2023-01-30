import 'package:flutter/material.dart';
import 'package:qazo_namaz/features/common/widgets/w_app_bar.dart';
import 'package:qazo_namaz/features/common/widgets/wbutton_widget.dart';
import 'package:qazo_namaz/features/ehtilam/views/information_container.dart';
import 'package:qazo_namaz/features/ehtilam/views/chek.dart';

class InfoChkScreen extends StatelessWidget {
  final DateTime data;
  final DateTime hayz;
  final DateTime namoz;
  const InfoChkScreen(
      {super.key, required this.data, required this.hayz, required this.namoz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WAppBar(title: ''),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  'Tasdiqlash',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Ma’lumotlaringiz to’g’riligini tekshiring',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 16),
              ),
              const Spacer(),
              InformationContainer(
                data: data,
                hayz: hayz,
                namoz: namoz,
              ),
              const Spacer(),
              WButton(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CheckingList(),
                    ));
                  },
                  title: 'Tasdiqlash',
                  isActiv: true)
            ],
          ),
        ),
      ),
    );
  }
}
