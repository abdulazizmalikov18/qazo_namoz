import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/assets/constants/icons.dart';
import 'package:qazo_namoz/assets/constants/images.dart';
import 'package:qazo_namoz/core/utils/formatters.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';
import 'package:qazo_namoz/features/common/navigation/routs_contact.dart';
import 'package:qazo_namoz/features/common/widgets/w_button.dart';

class RegisterViews extends StatefulWidget {
  const RegisterViews({super.key});

  @override
  State<RegisterViews> createState() => _RegisterViewsState();
}

class _RegisterViewsState extends State<RegisterViews> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Ro’yxatdan o’tish",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Image.asset(
                  AppImages.icon,
                  height: 36,
                  width: 36,
                )
              ],
            ),
            SizedBox(height: SizeConfig.h(120)),
            const Text("Telefon raqam"),
            TextFormField(
              inputFormatters: [Formatters.phoneFormatter],
              decoration: const InputDecoration(
                prefixIcon: Icon(CupertinoIcons.phone),
                hintText: "Raqamingizni yozing",
              ),
            ),
            SizedBox(height: SizeConfig.h(16)),
            const Text("Parol yarating"),
            TextFormField(
              obscureText: isObscure,
              decoration: InputDecoration(
                prefixIcon: const Icon(CupertinoIcons.lock),
                suffixIcon: InkWell(
                  onTap: () {
                    isObscure = !isObscure;
                    setState(() {});
                  },
                  child: isObscure
                      ? const Icon(CupertinoIcons.eye)
                      : const Icon(CupertinoIcons.eye_slash),
                ),
                hintText: "Yangi parol yozing",
              ),
            ),
            SizedBox(height: SizeConfig.h(16)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.h(40)),
              child: WButton(
                onTap: () {
                  context.go(AppRoutPath.registerTitle);
                },
                text: "Yuborish",
                isDisabled: false,
              ),
            ),
            Row(
              children: [
                const Expanded(child: Divider()),
                SizedBox(width: SizeConfig.v(16)),
                const Text("yoki"),
                SizedBox(width: SizeConfig.v(16)),
                const Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: SizeConfig.h(40)),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: SizeConfig.h(62),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 0,
                          offset: const Offset(0, 0),
                          color: const Color(0xFF0C1230).withOpacity(.07),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIcons.google.svg(),
                        SizedBox(width: SizeConfig.v(16)),
                        const Text("Google"),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.v(20)),
                Expanded(
                  child: Container(
                    height: SizeConfig.h(62),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 0,
                          offset: const Offset(0, 0),
                          color: const Color(0xFF0C1230).withOpacity(.07),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIcons.fb.svg(),
                        SizedBox(width: SizeConfig.v(16)),
                        const Text("Facebook"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.h(60)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Akkauntingiz bormi?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    context.go(AppRoutPath.login);
                  },
                  child: const Text(
                    " Kirish",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
