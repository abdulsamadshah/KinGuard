import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/features/Alert/views/AlertScreen.dart';
import 'package:kinguard/features/home/providers/home_provider.dart';
import 'package:kinguard/features/profile/views/profileScreen.dart';
import 'package:kinguard/gen/fonts.gen.dart';
import 'HomeScreen.dart';

class MainNavigationScreen extends ConsumerWidget {
   MainNavigationScreen({super.key});

  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text("Groups")),
    AlertsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(homeProvider).selectedIndex;

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              ref.read(homeProvider.notifier).selectBottomIndex(index);
            },
            backgroundColor: Colors.transparent,
            selectedItemColor: const Color(0xff00C48C),
            unselectedItemColor: const Color(0xff9CA3AF),
            selectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontFamily: FontFamily.interSemiBold,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontFamily: FontFamily.interMedium,
            ),
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: [
              _buildNavItem(
                icon: Icons.home_outlined,
                activeIcon: Icons.home_rounded,
                label: 'Home',
                isSelected: currentIndex == 0,
              ),
              _buildNavItem(
                icon: Icons.group_outlined,
                activeIcon: Icons.group_rounded,
                label: 'Groups',
                isSelected: currentIndex == 1,
              ),
              _buildNavItem(
                icon: Icons.notifications_outlined,
                activeIcon: Icons.notifications_rounded,
                label: 'Alerts',
                isSelected: currentIndex == 2,
                showBadge: true,
              ),
              _buildNavItem(
                icon: Icons.person_outline_rounded,
                activeIcon: Icons.person_rounded,
                label: 'Profile',
                isSelected: currentIndex == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required bool isSelected,
    bool showBadge = false,
  }) {
    return BottomNavigationBarItem(
      icon: _NavIcon(icon: icon, showBadge: showBadge, isSelected: false),
      activeIcon: _NavIcon(
        icon: activeIcon,
        showBadge: showBadge,
        isSelected: true,
      ),
      label: label,
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final bool showBadge;
  final bool isSelected;

  const _NavIcon({
    required this.icon,
    required this.showBadge,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: isSelected ? 24.w : 0,
          height: 3.h,
          margin: EdgeInsets.only(bottom: 6.h),
          decoration: BoxDecoration(
            color: const Color(0xff00C48C),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(icon, size: 26.sp),
            if (showBadge)
              Positioned(
                right: -3,
                top: -3,
                child: Container(
                  width: 9.w,
                  height: 9.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffFF3B30),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
