import 'package:flutter/material.dart';
import 'package:qazo_namaz/core/utils/colors.dart';
import 'package:qazo_namaz/features/onboardeing/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme:const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: AppColors.blue,
          ),
          elevation: 0.3,
          titleSpacing: 0,
        ),
      ),
      home: const OnboardPage(),
    );
  }
}
