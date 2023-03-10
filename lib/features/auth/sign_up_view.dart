
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';
import 'package:qazo_namaz/core/utils/colors.dart';
import 'package:qazo_namaz/core/utils/my_function.dart';
import 'package:qazo_namaz/features/auth/controllers/auth_controller.dart';

import 'package:qazo_namaz/features/auth/views/sign_in_view.dart';
import 'package:qazo_namaz/features/auth/widgets/social_container.dart';
import 'package:qazo_namaz/features/auth/widgets/w_divider.dart';
import 'package:qazo_namaz/features/common/widgets/title_bar_widget.dart';
import 'package:qazo_namaz/features/common/widgets/wbutton_widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool ischek = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleBar(
                  title: "Ro’yxatdan o’tish",
                ),
                SizedBox(height: size.height * 0.1),
                const Text(
                  "Telefon raqam",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textgrey,
                  ),
                ),
                TextFormField(
                  controller: phoneController,
                  maxLength: 13,
                  validator: (value) {
                    if (!(value!.length >= 12)) {
                      return 'iltimos yozing';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    ischek = MyFunctions().ischekt(phone: phoneController.text);
                    setState(() {});
                  },
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: "Raqamingizni yozing",
                    prefixIcon: Icon(Icons.phone_outlined),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                const Text(
                  "Parol yarating",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textgrey,
                  ),
                ),
                // TextFormField(
                //   controller: passwordController,
                //   maxLength: 20,
                //   validator: (value) {
                //     if (!(value!.length >= 8)) {
                //       return 'iltimos yozing';
                //     }
                //     return null;
                //   },
                //   onChanged: (value) {
                //     ischek = MyFunctions().ischekt(
                //         password: passwordController.text,
                //         phone: phoneController.text);
                //     setState(() {});
                //   },
                //   obscureText: ischek,
                //   keyboardType: TextInputType.emailAddress,
                //   decoration: InputDecoration(
                //     hintText: "Yangi parol yozing",
                //     prefixIcon: const Icon(CupertinoIcons.lock),
                //     suffix: IconButton(
                //       onPressed: () {},
                //       icon: ischek
                //           ? const Icon(Icons.remove_red_eye_outlined)
                //           : const Icon(Icons.remove),
                //     ),
                //   ),
                // ),

                SizedBox(height: size.height * 0.06),
                WButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      sendPhoneNumber();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("To'ri yozing")),
                      );
                    }
                  },
                  title: 'Yuborish',
                  isActiv: ischek,
                ),
                const Spacer(),
                WDivider(size: size),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SocialContainer(
                      imageName: 'assets/google.png',
                      name: 'Google',
                    ),
                    SocialContainer(
                      imageName: 'assets/facebook.png',
                      name: 'Google',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Akkauntingiz bormi?"),
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0)),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SignInView(),
                          ),
                        );
                      },
                      child: const Text("Kirish"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();

    print('===> ==> My Number $phoneNumber');
    ap.signInWithPhone(context, phoneNumber);
  }
}
