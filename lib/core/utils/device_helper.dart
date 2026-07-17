import 'package:flutter/material.dart';
import 'package:kinguard/core/utils/deep_Link/Context_Utility.dart';

class DeviceHelper {
  static double screenWidth() {
    return MediaQuery.of(
      ContextUtility.navigatorkey.currentState!.context,
    ).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double widthPercent(double percent) {
    return screenWidth() * percent;
  }

  static double heightPercent(BuildContext context, double percent) {
    return screenHeight(context) * percent;
  }

  static bool get isMobile {
    return screenWidth() < 600;
  }

  static bool get isTablet {
    return screenWidth() >= 600;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static double statusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double bottomPadding(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }
}
