import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qazo_namaz/features/common/widgets/wbutton_widget.dart';
import 'package:qazo_namaz/features/ehtilam/views/birt_day_screen.dart';

class AgeEndEhtilomSplash extends StatelessWidget {
  const AgeEndEhtilomSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(
              'assets/questChat.svg',
              height: 140,
              width: 140,
              alignment: Alignment.center,
            ),
            const Spacer(),
            Text(
              'Qazo namozlaringizni aniqlash uchun bizga ba’zi ma’lumotlaringiz kerak bo’ladi ',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 24, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: WButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BirthDayScreen(),
                    ),
                  );
                },
                title: 'Tushunarli',
                isActiv: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
