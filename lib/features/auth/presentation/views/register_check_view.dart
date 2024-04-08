import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/assets/constants/icons.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';
import 'package:qazo_namoz/features/common/navigation/routs_contact.dart';
import 'package:qazo_namoz/features/common/widgets/w_button.dart';

class RegisterCheckView extends StatelessWidget {
  const RegisterCheckView({super.key, this.day = 0});
  final int day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons.search.svg(),
            SizedBox(height: SizeConfig.h(40)),
            Text(
              "Sizda umumiy hisobda $day kun qazo namozlari bor ekan. ",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              "Ularni ado qilishga hoziroq kirishishingiz mumkin. ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          MediaQuery.of(context).viewPadding.bottom,
        ),
        child: WButton(
          onTap: () {
            context.go(AppRoutPath.home);
          },
          text: "Ado qilishga kirishish",
        ),
      ),
    );
  }
}
