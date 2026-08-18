import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kinguard/core/theme/app_colors.dart';
import 'package:kinguard/core/utils/deep_Link/Context_Utility.dart';
import 'package:kinguard/gen/fonts.gen.dart';

class Utils {
  static flutterToast(
    String message, {
    ToastGravity gravitys = ToastGravity.BOTTOM,
    Toast toastlenght = Toast.LENGTH_SHORT,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravitys,
      timeInSecForIosWeb: 1,

      backgroundColor: AppColors.primary,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static snackBar(
    String message, {
    Color backgroundColor = const Color(0xFF10B981),
  }) {
    ScaffoldMessenger.of(
      ContextUtility.navigatorkey.currentState!.context,
    ).showSnackBar(
      SnackBar(
        content:  Text(message,style: TextStyle(fontSize: 13.sp,fontFamily: FontFamily.interMedium),),
        backgroundColor: const Color(0xFF10B981),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
