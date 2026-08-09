import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  int selectedTab = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            const Divider(height: 1, color: Color(0xFFF3F4F6)),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader(),
                    SizedBox(height: 14.h),
                    _buildNotificationCard(
                      icon: Icons.home_outlined,
                      iconColor: const Color(0xFF10B981),
                      iconBg: const Color(0xFFD1FAE5),
                      title: 'Mother Reached Home',
                      subtitle: 'Mother has reached Home\nsafely.',
                      time: '10:30 AM',
                      badgeColor: const Color(0xFFD1FAE5),
                      badgeTextColor: const Color(0xFF10B981),
                    ),
                    SizedBox(height: 12.h),
                    _buildNotificationCard(
                      icon: Icons.battery_2_bar_rounded,
                      iconColor: const Color(0xFFF59E0B),
                      iconBg: const Color(0xFFFEF3C7),
                      title: 'Abdul Battery Low',
                      subtitle: "Abdul's phone battery is\nbelow 20%.",
                      time: '09:15 AM',
                      badgeColor: const Color(0xFFFEF3C7),
                      badgeTextColor: const Color(0xFFF59E0B),
                    ),
                    SizedBox(height: 12.h),
                    _buildNotificationCard(
                      icon: Icons.flag_rounded,
                      iconColor: const Color(0xFF3B82F6),
                      iconBg: const Color(0xFFDBEAFE),
                      title: 'Journey Completed',
                      subtitle:
                      'Abdul has completed the\njourney Mumbai → Thane.',
                      time: '08:45 AM',
                      badgeColor: const Color(0xFFDBEAFE),
                      badgeTextColor: const Color(0xFF3B82F6),
                    ),
                    SizedBox(height: 12.h),
                    _buildSOSCard(),
                    SizedBox(height: 20.h),
                    Text(
                      'Earlier',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    _buildEarlierCard(
                      icon: Icons.person_add_alt_1_rounded,
                      iconColor: const Color(0xFF8B5CF6),
                      iconBg: const Color(0xFFEDE9FE),
                      title: 'New Member Added',
                      subtitle: 'Rahul has been added to\nFamily Group.',
                      time: 'Yesterday, 9:30 PM',
                    ),
                    SizedBox(height: 12.h),
                    _buildEarlierCard(
                      icon: Icons.location_on_outlined,
                      iconColor: const Color(0xFF14B8A6),
                      iconBg: const Color(0xFFCCFBF1),
                      title: 'Abdul Left Work',
                      subtitle: 'Abdul has left Work.',
                      time: 'Yesterday, 6:20 PM',
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        children: [
          SizedBox(width: 36.w),
          Expanded(
            child: Center(
              child: Text(
                'Alerts',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  color: const Color(0xFF1F2937),
                ),
              ),
            ),
          ),
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Icon(Icons.filter_alt_outlined,
                size: 18.sp, color: const Color(0xFF1F2937)),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Notifications',
          style: TextStyle(
            fontSize: 15.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1F2937),
          ),
        ),
        Text(
          'Mark all as read',
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            color: const Color(0xFF3B82F6),
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String subtitle,
    required String time,
    required Color badgeColor,
    required Color badgeTextColor,
  }) {
    return Container(
      padding: EdgeInsets.all(14.w),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46.w,
            height: 46.w,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 22.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    color: const Color(0xFF6B7280),
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: 'Inter',
                    color: const Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      'New',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: badgeTextColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Container(
                    width: 7.w,
                    height: 7.w,
                    decoration: const BoxDecoration(
                      color: Color(0xFF3B82F6),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSOSCard() {
    return Container(
      padding: EdgeInsets.all(14.w),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46.w,
            height: 46.w,
            decoration: BoxDecoration(
              color: const Color(0xFFFEE2E2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                'SOS',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFFEF4444),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SOS Alert',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFEF4444),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'SOS triggered by Abdul.\nLocation shared.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    color: const Color(0xFF6B7280),
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '08:10 AM',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: 'Inter',
                    color: const Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEE2E2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  'New',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFEF4444),
                  ),
                ),
              ),
              SizedBox(width: 6.w),
              Container(
                width: 7.w,
                height: 7.w,
                decoration: const BoxDecoration(
                  color: Color(0xFF3B82F6),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEarlierCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Container(
      padding: EdgeInsets.all(14.w),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46.w,
            height: 46.w,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 22.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    color: const Color(0xFF6B7280),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontFamily: 'Inter',
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Container(
                    width: 7.w,
                    height: 7.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD1D5DB),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }


}