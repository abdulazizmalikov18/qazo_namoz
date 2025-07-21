import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:qazo_namoz/application/auth/auth_bloc.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';
import 'package:qazo_namoz/features/common/navigation/app_routs.dart';
import 'package:qazo_namoz/supabase.dart';

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
  await loadSupabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(GetMeEvent()),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouts.router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.green),
          useMaterial3: true,
        ),
        // builder: (context, child) {
        //   SizeConfig().init(context);
        //   return BlocListener<AuthBloc, AuthState>(
        //     listener: (context, state) {
        //       switch (state.statusAuth) {
        //         case AuthenticationStatus.unauthenticated:
        //           AppRouts.router.pushReplacement(AppRoutPath.login);
        //           break;
        //         case AuthenticationStatus.authenticated:
        //           AppRouts.router.go(AppRoutPath.home);
        //           break;
        //         case AuthenticationStatus.loading:
        //         case AuthenticationStatus.cancelLoading:
        //           break;
        //       }
        //     },
        //     child: KeyboardDismisser(child: child),
        //   );
        // },
      ),
    );
  }
}
