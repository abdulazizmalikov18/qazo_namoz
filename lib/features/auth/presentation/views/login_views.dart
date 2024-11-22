import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/application/auth/auth_bloc.dart';
import 'package:qazo_namoz/assets/constants/icons.dart';
import 'package:qazo_namoz/assets/constants/images.dart';
import 'package:qazo_namoz/core/utils/constants.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';
import 'package:qazo_namoz/features/common/navigation/routs_contact.dart';
import 'package:qazo_namoz/features/common/widgets/w_button.dart';

class LoginViews extends StatefulWidget {
  const LoginViews({super.key});

  @override
  State<LoginViews> createState() => _LoginViewsState();
}

class _LoginViewsState extends State<LoginViews> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).viewPadding.top),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Akkauntga kirish",
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
              const Text("Emailingizni raqam"),
              TextFormField(
                // inputFormatters: [Formatters.phoneFormatter],
                controller: _emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Emailingizni yozing",
                ),
              ),
              SizedBox(height: SizeConfig.h(16)),
              const Text("Parol yarating"),
              TextFormField(
                obscureText: isObscure,
                controller: _passwordController,
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
                    context.read<AuthBloc>().add(LoginEvent(
                          password: _passwordController.text,
                          phone: _emailController.text,
                          onError: (error) {
                            context.showErrorSnackBar(message: error);
                          },
                        ));
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
                    "Yangimisiz?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go(AppRoutPath.registerUser);
                    },
                    child: const Text(
                      " Ro’yxatdan o’ting",
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
      ),
    );
  }
}
