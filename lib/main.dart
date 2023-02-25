import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qazo_namaz/core/utils/colors.dart';
import 'package:qazo_namaz/core/utils/shard_pr.dart';
import 'package:qazo_namaz/features/auth/controllers/auth_controller.dart';
import 'package:qazo_namaz/features/common/controllers/controller.dart';
import 'package:qazo_namaz/features/main/main_screen.dart';
import 'package:qazo_namaz/features/onboardeing/onboarding_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.getInstance();
  AuthState authState = AuthState();
  authState.checkLoginStatus();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Counter()),
      ChangeNotifierProvider<AuthState>(create: (_) => authState),
    ],
    child: const MyApp(),
  ));
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
      home: Consumer<AuthState>(
        builder: (context, authState, child) {
          if (authState.isLoggedIn) {
            return const MainScreen();
          } else {
            return const OnboardPage();
          }
        },
      ),
    );
  }
}
