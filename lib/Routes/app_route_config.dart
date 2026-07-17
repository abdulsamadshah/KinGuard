import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kinguard/core/utils/deep_Link/Context_Utility.dart';
import 'package:kinguard/features/splash/views/SplashScreen.dart';
import 'package:kinguard/features/auth/views/login_screen.dart';
import 'package:kinguard/features/home/views/HomeScreen.dart';
import 'package:kinguard/riverPod_learn/NotePade/noteScreen.dart';
import 'package:kinguard/riverPod_learn/Search_provider/searchScreen.dart';
import 'package:kinguard/riverPod_learn/multi_provider/MultiStateProvider_Screen.dart';
import 'app_route_constants.dart';

class MyAppRouter {
  final GoRouter router;

  MyAppRouter()
    : router = GoRouter(
        navigatorKey: ContextUtility.navigatorkey,
        routes: [
          GoRoute(
            name: RouteConstants.splashscreen,
            path: '/',
            pageBuilder: (context, state) {
              return MaterialPage(child: SplashScreen());
            },
          ),

          GoRoute(
            name: RouteConstants.loginScreen,
            path: '/LoginScreen',
            pageBuilder: (context, state) {
              return MaterialPage(child: LoginScreen());
            },
          ),

          GoRoute(
            name: RouteConstants.homeScreen,
            path: '/HomeScreen',
            pageBuilder: (context, state) {
              return MaterialPage(child: HomeScreen());
            },
          ),

        ],
        errorPageBuilder: (context, state) {
          return const MaterialPage(child: Text("No Routes Found"));
        },
      );
}

final MyAppRouter appRouter = MyAppRouter();
