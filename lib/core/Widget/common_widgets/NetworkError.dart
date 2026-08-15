import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildErrorState(String message, {void Function()? refreshData}) {
  return Center(
    child: Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 60.sp,
            color: const Color(0xFFEF4444),
          ),
          SizedBox(height: 12.h),
          Text(
            'Failed to load profile',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1F2937),
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xFF6B7280),
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: refreshData,

            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2563EB),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Text(
              'Retry',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
