import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/features/auth/presentation/views/login_views.dart';
import 'package:qazo_namoz/features/auth/presentation/views/register_check_view.dart';
import 'package:qazo_namoz/features/auth/presentation/views/register_info_view.dart';
import 'package:qazo_namoz/features/auth/presentation/views/register_title_view.dart';
import 'package:qazo_namoz/features/auth/presentation/views/register_view.dart';
import 'package:qazo_namoz/features/common/navigation/routs_contact.dart';
import 'package:qazo_namoz/features/common/views/error_screen.dart';
import 'package:qazo_namoz/features/home/presentation/views/home_view.dart';
import 'package:qazo_namoz/features/home/presentation/views/main_view.dart';
import 'package:qazo_namoz/features/information/presentation/views/information_selection_view.dart';
import 'package:qazo_namoz/features/information/presentation/views/information_view.dart';
import 'package:qazo_namoz/features/mentions/presentation/views/mentions_selection_view.dart';
import 'package:qazo_namoz/features/mentions/presentation/views/mentions_view.dart';
import 'package:qazo_namoz/features/onboardeing/presentation/views/onboarding_view.dart';
import 'package:qazo_namoz/features/onboardeing/presentation/views/splash_lenguage_views.dart';
import 'package:qazo_namoz/features/onboardeing/presentation/views/splash_views.dart';
import 'package:qazo_namoz/features/settings/presentation/views/general_settings.dart';
import 'package:qazo_namoz/features/settings/presentation/views/lenguage_view.dart';
import 'package:qazo_namoz/features/settings/presentation/views/settings_view.dart';

sealed class AppRouts {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutPath.splash,
    errorBuilder: (context, state) => const ErrorScreen(),
    routes: [
      GoRoute(
        path: AppRoutPath.splash,
        builder: (context, state) => const SplashViews(),
      ),
      GoRoute(
        path: AppRoutPath.splashLenguage,
        builder: (context, state) => const SplashLenguageView(),
      ),
      GoRoute(
        path: AppRoutPath.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: AppRoutPath.login,
        builder: (context, state) => const LoginViews(),
      ),
      GoRoute(
        path: AppRoutPath.login,
        builder: (context, state) => const LoginViews(),
      ),
      GoRoute(
        path: AppRoutPath.registerUser,
        builder: (context, state) => const RegisterViews(),
      ),
      GoRoute(
        path: AppRoutPath.registerInfo,
        builder: (context, state) => const RegisterInfoView(),
      ),
      GoRoute(
        path: AppRoutPath.registerTitle,
        builder: (context, state) => const RegisterTitleView(),
      ),
      GoRoute(
        path: AppRoutPath.registerCheck,
        builder: (context, state) => RegisterCheckView(
          day: state.extra != null ? (state.extra as Map)["day"] : 0,
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainView(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutPath.home,
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutPath.mentions,
                builder: (context, state) => const MentionsView(),
              ),
              GoRoute(
                path: AppRoutPath.mentionSelection,
                builder: (context, state) => const MentionSelectionView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutPath.information,
                builder: (context, state) => const InformationView(),
              ),
              GoRoute(
                path: AppRoutPath.informationSelection,
                builder: (context, state) => const InformationSelectionView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutPath.settings,
                builder: (context, state) => const SettingsView(),
              ),
              GoRoute(
                path: AppRoutPath.lenguage,
                builder: (context, state) => const LenguageView(),
              ),
              GoRoute(
                path: AppRoutPath.generalSettings,
                builder: (context, state) => const GeneralSettings(),
              ),
            ],
          ),
        ],
      )
    ],
  );
}
