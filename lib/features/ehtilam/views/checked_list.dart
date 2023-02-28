import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qazo_namaz/features/auth/controllers/auth_controller.dart';
import 'package:qazo_namaz/features/common/widgets/wbutton_widget.dart';
import 'package:qazo_namaz/features/main/main_screen.dart';

class CheckedList extends StatelessWidget {
  const CheckedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 120, 25, 0),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/search.svg',
              height: 140,
              width: 140,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 50),
            Text(
              'Sizda umumiy hisobda 2 yil, 3 oy, 8 kun qazo namozlari bor ekan.',
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text("Ularni ado qilishga hoziroq kirishishingiz"),
            const Text('mumkin'),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: WButton(
                onTap: () {
                  context.read<AuthState>().setLoggedInStatus(true);
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                title: "Ado qilishga kirishish",
                isActiv: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
