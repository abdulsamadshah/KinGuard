import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/core/theme/app_colors.dart';
import 'package:kinguard/gen/fonts.gen.dart';

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.menu, color: Colors.black, size: 28.sp),
      onPressed: () {},
    ),
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Kin',
          style: TextStyle(
            fontFamily: FontFamily.interBold,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.blue, // Green
          ),
        ),
        Text(
          'Guard',
          style: TextStyle(
            fontFamily: FontFamily.interBold,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff00C48C), // Purple
          ),
        ),
      ],
    ),
    centerTitle: true,
    actions: [
      Stack(
        clipBehavior: Clip.none,
        children: [
          IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
              size: 28.sp,
            ),
            onPressed: () {},
          ),
          Positioned(
            right: 11,
            top: 11,
            child: Container(
              width: 9.w,
              height: 9.w,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
      SizedBox(width: 8.w),
    ],
  );
}
