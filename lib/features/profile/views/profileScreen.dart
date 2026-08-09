import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/Routes/app_route_config.dart';
import 'package:kinguard/Routes/app_route_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedTab = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    SizedBox(height: 16.h),
                    _buildProfileCard(),
                    SizedBox(height: 14.h),
                    _buildEditProfileButton(),
                    SizedBox(height: 20.h),
                    _buildSectionTitle('ACCOUNT & SAFETY'),
                    SizedBox(height: 10.h),
                    _buildMenuGroup([
                      _MenuItem(
                        icon: Icons.phone_in_talk_rounded,
                        iconColor: const Color(0xFFEF4444),
                        iconBg: const Color(0xFFFEE2E2),
                        title: 'Emergency Contacts',
                        onTap: () {
                          appRouter.router.pushNamed(RouteConstants.emergencyContact);
                        },

                      ),
                      _MenuItem(
                        icon: Icons.shield_rounded,
                        iconColor: const Color(0xFF3B82F6),
                        iconBg: const Color(0xFFDBEAFE),
                        title: 'Privacy',
                      ),
                      _MenuItem(
                        icon: Icons.lock_rounded,
                        iconColor: const Color(0xFF10B981),
                        iconBg: const Color(0xFFD1FAE5),
                        title: 'Permissions',
                      ),
                      _MenuItem(
                        icon: Icons.emoji_events_rounded,
                        iconColor: const Color(0xFFF59E0B),
                        iconBg: const Color(0xFFFEF3C7),
                        title: 'Premium',
                        trailingBadge: 'Active',
                      ),
                    ]),
                    SizedBox(height: 20.h),
                    _buildSectionTitle('SUPPORT & INFO'),
                    SizedBox(height: 10.h),
                    _buildMenuGroup([
                      _MenuItem(
                        icon: Icons.headset_mic_rounded,
                        iconColor: const Color(0xFF8B5CF6),
                        iconBg: const Color(0xFFEDE9FE),
                        title: 'Help & Support',
                      ),
                      _MenuItem(
                        icon: Icons.info_outline_rounded,
                        iconColor: const Color(0xFF6B7280),
                        iconBg: const Color(0xFFF3F4F6),
                        title: 'About KinGuard',
                      ),
                      _MenuItem(
                        icon: Icons.star_border_rounded,
                        iconColor: const Color(0xFFF59E0B),
                        iconBg: const Color(0xFFFEF3C7),
                        title: 'Rate KinGuard',
                      ),
                    ]),
                    SizedBox(height: 20.h),
                    _buildLogoutButton(),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
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

  Widget _buildProfileCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2563EB).withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFEEF4FF),
                    Color(0xFFDCE7FB),
                    Color(0xFFC7DBFA),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),

            Positioned(
              top: -40.h,
              right: -40.w,
              child: Container(
                width: 160.w,
                height: 160.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF2563EB).withOpacity(0.18),
                      const Color(0xFF2563EB).withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: -50.h,
              left: -30.w,
              child: Container(
                width: 140.w,
                height: 140.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF8B5CF6).withOpacity(0.15),
                      const Color(0xFF8B5CF6).withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: 20.h,
              right: 30.w,
              child: Container(
                width: 6.w,
                height: 6.w,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 60.h,
              right: 80.w,
              child: Container(
                width: 4.w,
                height: 4.w,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: 30.h,
              right: 40.w,
              child: Container(
                width: 5.w,
                height: 5.w,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(18.w),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Color(0xFF2563EB), Color(0xFF8B5CF6)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF2563EB).withOpacity(0.35),
                              blurRadius: 14,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 40.r,
                            backgroundImage: const NetworkImage(
                              'https://i.pravatar.cc/150?img=12',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 2.h,
                        right: 2.w,
                        child: Container(
                          width: 30.w,
                          height: 30.w,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2.5),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF2563EB).withOpacity(0.4),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 18.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Abdul',
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF0F172A),
                                letterSpacing: -0.5,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF3B82F6),
                                    Color(0xFF2563EB),
                                  ],
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.verified_rounded,
                                color: Colors.white,
                                size: 12.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        _buildInfoRow(Icons.phone_rounded, '+91 98765 43210'),
                        SizedBox(height: 5.h),
                        _buildInfoRow(Icons.email_outlined, 'abdul@gmail.com'),
                        SizedBox(height: 5.h),
                        _buildInfoRow(
                          Icons.location_on_outlined,
                          'Mumbai, India',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Icon(icon, size: 11.sp, color: const Color(0xFF2563EB)),
        ),
        SizedBox(width: 8.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'Inter',
            color: const Color(0xFF334155),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14.sp, color: const Color(0xFF6B7280)),
        SizedBox(width: 6.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'Inter',
            color: const Color(0xFF374151),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildEditProfileButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFDBEAFE)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.edit_outlined,
            size: 18.sp,
            color: const Color(0xFF2563EB),
          ),
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

  Widget _buildSectionTitle(String title) {
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

  Widget _buildMenuGroup(List<_MenuItem> items) {
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
              _buildMenuItem(items[index]),
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

  Widget _buildMenuItem(_MenuItem item) {
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

  Widget _buildLogoutButton() {
    return Container(
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
    );
  }
}

class _MenuItem {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final String? trailingBadge;
  void Function()? onTap;

  _MenuItem({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    this.trailingBadge,
    this.onTap,
  });
}
