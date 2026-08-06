import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/gen/fonts.gen.dart';

class QuickActions extends StatelessWidget {
  void Function() startJourney;
  void Function() createGroup;
  void Function() iAmSafe;
  QuickActions({
    super.key,
    required this.createGroup,
    required this.iAmSafe,
    required this.startJourney,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: FontFamily.interSemiBold,
              color: const Color(0xff1A1A2E),
            ),
          ),
          SizedBox(height: 7.h),
          Row(
            children: [
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.location_on_rounded,
                  label: 'Start Journey',
                  iconColor: const Color(0xff00C48C),
                  onTap: startJourney,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.group_add_rounded,
                  label: 'Create Group',
                  iconColor: const Color(0xff8E51FF),
                  onTap: createGroup,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.shield_rounded,
                  label: "I'm Safe",
                  iconColor: const Color(0xff3B82F6),
                  onTap: iAmSafe,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 22.sp),
            ),
            SizedBox(height: 10.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                fontFamily: FontFamily.interSemiBold,
                fontWeight: FontWeight.w600,
                color: const Color(0xff1A1A2E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
