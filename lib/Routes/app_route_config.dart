import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kinguard/core/utils/deep_Link/Context_Utility.dart';
import 'package:kinguard/features/Group/views/createGroup.dart';
import 'package:kinguard/features/Group/views/groupDetail.dart';
import 'package:kinguard/features/auth/views/veriefy_screen.dart';
import 'package:kinguard/features/home/views/MainNavigationScreen.dart';
import 'package:kinguard/features/splash/views/SplashScreen.dart';
import 'package:kinguard/features/auth/views/login_screen.dart';
import 'package:kinguard/features/home/views/HomeScreen.dart';
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
            name: RouteConstants.otpScreen,
            path: '/OtpScreen/:mobNo',
            pageBuilder: (context, state) {
              return MaterialPage(
                child: VerifyScreen(
                  mobileNumber: state.pathParameters['mobNo'] ?? '',
                  countryCode:
                      state.uri.queryParameters['countryCode'] ?? '+91',
                ),
              );
            },
          ),

          GoRoute(
            name: RouteConstants.homeScreen,
            path: '/Home',
            pageBuilder: (context, state) {
              return MaterialPage(child: MainNavigationScreen());
            },
          ),
          GoRoute(
            name: RouteConstants.createGroup,
            path: '/createGroup',
            pageBuilder: (context, state) {
              return MaterialPage(child: CreateGroupScreen());
            },
          ),

          GoRoute(
            name: RouteConstants.groupDetails,
            path: '/GroupDetailsScreen',
            pageBuilder: (context, state) {
              return MaterialPage(child: GroupDetailsScreen());
            },
          ),
        ],
        errorPageBuilder: (context, state) {
          return const MaterialPage(child: Text("No Routes Found"));
        },
      );
}

final MyAppRouter appRouter = MyAppRouter();
