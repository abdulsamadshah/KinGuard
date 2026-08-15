import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/Routes/app_route_config.dart';
import 'package:kinguard/Routes/app_route_constants.dart';
import 'package:kinguard/core/constants/asset_res.dart';
import 'package:kinguard/features/splash/providers/splash_provider.dart';
import 'package:kinguard/features/splash/viewmodels/splash_view_model.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(splashProvider.notifier).initializeApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SplashState>(splashProvider, (previous, next) {
      if (next == SplashState.authenticated) {
        appRouter.router.goNamed(RouteConstants.homeScreen);
      }
      if (next == SplashState.unauthenticated) {
        // appRouter.router.goNamed(RouteConstants.homeScreen);
        appRouter.router.pushReplacementNamed(RouteConstants.loginScreen);
      }
    });

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xffE12AFB), Color(0xff8E51FF)],
          ),
        ),
        child: Center(
          child: Container(
            width: 240.w,
            height: 240.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20.r,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Image.asset(Assets.appIcon, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
