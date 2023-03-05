import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qazo_namaz/core/utils/colors.dart';
import 'package:qazo_namaz/core/utils/shard_pr.dart';
import 'package:qazo_namaz/features/auth/controllers/auth_controller.dart';
import 'package:qazo_namaz/features/common/controllers/controller.dart';
import 'package:qazo_namaz/features/splash/welcome_screen.dart';
import 'package:qazo_namaz/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  StorageRepository.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(
              color: AppColors.blue,
            ),
            centerTitle: true,
            titleTextStyle: TextStyle(color: Colors.black),
            elevation: 0.3,
            titleSpacing: 0,
          ),
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
