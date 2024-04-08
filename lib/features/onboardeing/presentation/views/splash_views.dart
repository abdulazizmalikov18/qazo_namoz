import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';
import 'package:qazo_namoz/assets/constants/icons.dart';
import 'package:qazo_namoz/features/common/navigation/routs_contact.dart';

class SplashViews extends StatefulWidget {
  const SplashViews({super.key});

  @override
  State<SplashViews> createState() => _SplashViewsState();
}

class _SplashViewsState extends State<SplashViews> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).whenComplete(() {
      context.go(AppRoutPath.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Center(
        child: AppIcons.logo.svg(color: Colors.white),
      ),
    );
  }
}
