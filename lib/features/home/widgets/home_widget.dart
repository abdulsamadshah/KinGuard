import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            color: Colors.blue,
          ),
        ),
        Text(
          'Guard',
          style: TextStyle(
            fontFamily: FontFamily.interBold,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff00C48C),
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



class GroupStyle {
  final IconData icon;
  final List<Color> gradient;

  GroupStyle({required this.icon, required this.gradient});
}

class GroupStyleHelper {
  static GroupStyle getStyle(String? type) {
    switch (type?.toLowerCase()) {
      case 'family':
        return GroupStyle(
          icon: Icons.home_rounded,
          gradient: const [Color(0xFF3B82F6), Color(0xFF6366F1)],
        );
      case 'friends':
        return GroupStyle(
          icon: Icons.people_alt_rounded,
          gradient: const [Color(0xFF10B981), Color(0xFF059669)],
        );
      case 'emergency':
        return GroupStyle(
          icon: Icons.shield_rounded,
          gradient: const [Color(0xFFEF4444), Color(0xFFDC2626)],
        );
      case 'office':
      case 'work':
        return GroupStyle(
          icon: Icons.business_center_rounded,
          gradient: const [Color(0xFFF59E0B), Color(0xFFF97316)],
        );
      case 'trip':
      case 'travel':
        return GroupStyle(
          icon: Icons.flight_rounded,
          gradient: const [Color(0xFF8B5CF6), Color(0xFFA855F7)],
        );
      case 'college':
      case 'school':
        return GroupStyle(
          icon: Icons.school_rounded,
          gradient: const [Color(0xFFEC4899), Color(0xFFDB2777)],
        );
      case 'gym':
      case 'fitness':
        return GroupStyle(
          icon: Icons.fitness_center_rounded,
          gradient: const [Color(0xFF14B8A6), Color(0xFF0891B2)],
        );
      default:
        return GroupStyle(
          icon: Icons.groups_rounded,
          gradient: const [Color(0xFF6366F1), Color(0xFF8B5CF6)],
        );
    }
  }
}