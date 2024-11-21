import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:logging/logging.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';
import 'package:qazo_namoz/features/common/navigation/app_routs.dart';
import 'package:qazo_namoz/features/common/navigation/routs_contact.dart';
import 'package:qazo_namoz/powersync.dart';

void main() async {
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print(
          '[${record.loggerName}] ${record.level.name}: ${record.time}: ${record.message}');

      if (record.error != null) {
        print(record.error);
      }
      if (record.stackTrace != null) {
        print(record.stackTrace);
      }
    }
  });

  WidgetsFlutterBinding.ensureInitialized();
  await openDatabase();

  final loggedIn = isLoggedIn();
  runApp(MyApp(isLogin: loggedIn));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLogin});
  final bool isLogin;

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
        if (isLogin) {
          AppRouts.router.go(AppRoutPath.home);
        } else {
          AppRouts.router.go(AppRoutPath.login);
        }
        return KeyboardDismisser(child: child);
      },
    );
  }
}
