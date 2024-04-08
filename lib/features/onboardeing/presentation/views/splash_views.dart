import 'package:flutter/material.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';
import 'package:qazo_namoz/assets/constants/icons.dart';

class SplashViews extends StatelessWidget {
  const SplashViews({super.key});

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
