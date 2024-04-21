import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/assets/constants/icons.dart';
import 'package:qazo_namoz/core/utils/my_function.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';
import 'package:qazo_namoz/features/common/navigation/routs_contact.dart';
import 'package:qazo_namoz/features/common/widgets/w_button.dart';

class RegisterTitleView extends StatelessWidget {
  const RegisterTitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons.questChat.svg(),
            SizedBox(height: SizeConfig.h(40)),
            const Text(
              "Qazo namozlaringizni aniqlash uchun bizga ba’zi ma’lumotlaringiz kerak bo’ladi ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
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
          MyFunctions.paddingBottom(context),
        ),
        child: WButton(
          onTap: () {
            context.go(AppRoutPath.registerInfo);
          },
          text: "Tushunarli",
        ),
      ),
    );
  }
}
