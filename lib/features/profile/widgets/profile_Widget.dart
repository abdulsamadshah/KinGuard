import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Profile',
        style: TextStyle(
          fontSize: 24.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w800,
          color: const Color(0xFF1F2937),
        ),
      ),
      Container(
        width: 38.w,
        height: 38.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Icon(
          Icons.settings_outlined,
          size: 18.sp,
          color: const Color(0xFF1F2937),
        ),
      ),
    ],
  );
}

Widget buildEditProfileButton() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: const Color(0xFFDBEAFE)),
    ),
    child: Row(
      children: [
        Icon(Icons.edit_outlined, size: 18.sp, color: const Color(0xFF2563EB)),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              color: const Color(0xFF2563EB),
            ),
          ),
        ),
        Icon(
          Icons.chevron_right_rounded,
          size: 20.sp,
          color: const Color(0xFF2563EB),
        ),
      ],
    ),
  );
}

Widget buildSectionTitle(String title) {
  return Padding(
    padding: EdgeInsets.only(left: 4.w),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 11.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        color: const Color(0xFF9CA3AF),
        letterSpacing: 0.8,
      ),
    ),
  );
}

Widget buildMenuGroup(List<MenuItem> items) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14.r),
      border: Border.all(color: const Color(0xFFF3F4F6)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      children: List.generate(items.length, (index) {
        return Column(
          children: [
            buildMenuItem(items[index]),
            if (index != items.length - 1)
              Padding(
                padding: EdgeInsets.only(left: 60.w, right: 16.w),
                child: Divider(height: 1, color: const Color(0xFFF3F4F6)),
              ),
          ],
        );
      }),
    ),
  );
}

Widget buildMenuItem(MenuItem item) {
  return InkWell(
    onTap: item.onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: item.iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: item.iconColor, size: 18.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              item.title,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1F2937),
              ),
            ),
          ),
          if (item.trailingBadge != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
              margin: EdgeInsets.only(right: 6.w),
              decoration: BoxDecoration(
                color: const Color(0xFFD1FAE5),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                item.trailingBadge!,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF10B981),
                ),
              ),
            ),
          Icon(
            Icons.chevron_right_rounded,
            size: 20.sp,
            color: const Color(0xFF9CA3AF),
          ),
        ],
      ),
    ),
  );
}

Widget profileAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Profile',
        style: TextStyle(
          fontSize: 24.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w800,
          color: const Color(0xFF1F2937),
        ),
      ),
      Container(
        width: 38.w,
        height: 38.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Icon(
          Icons.settings_outlined,
          size: 18.sp,
          color: const Color(0xFF1F2937),
        ),
      ),
    ],
  );
}

Widget buildLogoutButton({required void Function() onTap}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12.r),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFEE2E2).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.logout_rounded,
            color: const Color(0xFFEF4444),
            size: 18.sp,
          ),
          SizedBox(width: 8.w),
          Text(
            'Logout',
            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              color: const Color(0xFFEF4444),
            ),
          ),
        ],
      ),
    ),
  );
}

class MenuItem {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final String? trailingBadge;
  void Function()? onTap;

  MenuItem({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    this.trailingBadge,
    this.onTap,
  });
}
