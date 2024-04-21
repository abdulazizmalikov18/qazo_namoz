import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';
import 'package:qazo_namoz/features/common/navigation/app_routs.dart';
import 'package:qazo_namoz/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouts.router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.green),
        useMaterial3: true,
      ),
      builder: (context, child) {
        SizeConfig().init(context);
        return child!;
      },
    );
  }
}
