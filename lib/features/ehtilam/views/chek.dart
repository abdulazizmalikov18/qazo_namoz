import 'package:flutter/material.dart';
import 'package:qazo_namaz/features/ehtilam/views/checked_list.dart';

class CheckingList extends StatelessWidget {
  const CheckingList({super.key});

  @override
  Widget build(BuildContext context) {
    var delay = Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CheckedList()),
            ));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(115, 120, 0, 0),
        child: Column(
          children: [
            Text(
              'Hisoblanmoqda',
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
