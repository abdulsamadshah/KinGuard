import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupDetailsScreen extends StatelessWidget {
  const GroupDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            const Divider(height: 1, color: Color(0xFFF3F4F6)),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildGroupHeader(),
                    SizedBox(height: 16.h),
                    _buildMembersCard(),
                    SizedBox(height: 16.h),
                    _buildGroupMapCard(),
                    SizedBox(height: 16.h),
                    _buildGroupActions(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============ APP BAR ============
  Widget _buildAppBar(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_new_rounded,
                size: 18.sp, color: const Color(0xFF1F2937)),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Group Details',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  color: const Color(0xFF1F2937),
                ),
              ),
            ),
          ),
          Icon(Icons.more_vert_rounded,
              size: 20.sp, color: const Color(0xFF1F2937)),
        ],
      ),
    );
  }

  // ============ GROUP HEADER ============
  Widget _buildGroupHeader() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            width: 66.w,
            height: 66.w,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(Icons.home_rounded,
                color: const Color(0xFF6366F1), size: 32.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Family Group',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                    color: const Color(0xFF1F2937),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Stay connected, stay safe.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    color: const Color(0xFF6B7280),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    _buildTag(
                      icon: Icons.people_alt_rounded,
                      text: '4 Members',
                      color: const Color(0xFF6366F1),
                      bgColor: const Color(0xFFF3F4F6),
                    ),
                    SizedBox(width: 6.w),
                    _buildTag(
                      icon: Icons.circle,
                      text: '4 Active',
                      color: const Color(0xFF10B981),
                      bgColor: const Color(0xFFF3F4F6),
                      iconSize: 8,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right_rounded,
              color: const Color(0xFF9CA3AF), size: 22.sp),
        ],
      ),
    );
  }

  Widget _buildTag({
    required IconData icon,
    required String text,
    required Color color,
    required Color bgColor,
    double iconSize = 12,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize.sp, color: color),
          SizedBox(width: 4.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 10.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: const Color(0xFF374151),
            ),
          ),
        ],
      ),
    );
  }

  // ============ MEMBERS CARD ============
  Widget _buildMembersCard() {
    final members = [
      _MemberData('Abdul', 'Online', Colors.green, 85, Icons.circle,
          const Color(0xFF10B981), 'https://i.pravatar.cc/150?img=12'),
      _MemberData('Mother', 'Traveling', const Color(0xFF3B82F6), 40,
          Icons.directions_car_rounded, const Color(0xFF3B82F6),
          'https://i.pravatar.cc/150?img=45'),
      _MemberData('Father', 'At Home', const Color(0xFFF59E0B), 70,
          Icons.home_rounded, const Color(0xFFF59E0B),
          'https://i.pravatar.cc/150?img=52'),
      _MemberData('Brother', 'Online', Colors.green, 90, Icons.circle,
          const Color(0xFF10B981), 'https://i.pravatar.cc/150?img=15'),
    ];

    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Members',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  color: const Color(0xFF1F2937),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 6.w,
                    height: 6.w,
                    decoration: const BoxDecoration(
                      color: Color(0xFF10B981),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '4 Members Active',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontFamily: 'Inter',
                      color: const Color(0xFF10B981),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 14.h),
          ...members.map((m) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _buildMemberRow(m),
          )),
          SizedBox(height: 4.h),
          _buildAddMemberButton(),
        ],
      ),
    );
  }

  Widget _buildMemberRow(_MemberData member) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 22.r,
              backgroundColor: const Color(0xFFE5E7EB),
              backgroundImage: NetworkImage(member.avatar),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 10.w,
                height: 10.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                member.name,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  color: const Color(0xFF1F2937),
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Icon(member.statusIcon,
                      size: member.statusIcon == Icons.circle ? 8.sp : 12.sp,
                      color: member.statusColor),
                  SizedBox(width: 4.w),
                  Text(
                    member.status,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: member.statusColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        _buildBatteryIndicator(member.battery),
        SizedBox(width: 8.w),
        Icon(Icons.more_vert_rounded,
            size: 18.sp, color: const Color(0xFF9CA3AF)),
      ],
    );
  }

  Widget _buildBatteryIndicator(int percent) {
    Color batteryColor;
    if (percent >= 60) {
      batteryColor = const Color(0xFF10B981);
    } else if (percent >= 30) {
      batteryColor = const Color(0xFFF59E0B);
    } else {
      batteryColor = const Color(0xFFEF4444);
    }
    return Row(
      children: [
        // Battery icon
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              width: 26.w,
              height: 12.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.r),
                border: Border.all(color: const Color(0xFFD1D5DB), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: percent / 100,
                  child: Container(
                    decoration: BoxDecoration(
                      color: batteryColor,
                      borderRadius: BorderRadius.circular(1.r),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: -3.w,
              child: Container(
                width: 2.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFD1D5DB),
                  borderRadius: BorderRadius.circular(1.r),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 8.w),
        Text(
          '$percent%',
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F2937),
          ),
        ),
      ],
    );
  }

  Widget _buildAddMemberButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_add_alt_1_rounded,
              size: 18.sp, color: const Color(0xFF3B82F6)),
          SizedBox(width: 8.w),
          Text(
            'Add Member',
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: const Color(0xFF3B82F6),
            ),
          ),
        ],
      ),
    );
  }

  // ============ GROUP MAP CARD ============
  Widget _buildGroupMapCard() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Group Map',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  color: const Color(0xFF1F2937),
                ),
              ),
              Row(
                children: [
                  Text(
                    'View Full Map',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3B82F6),
                    ),
                  ),
                  Icon(Icons.chevron_right_rounded,
                      size: 18.sp, color: const Color(0xFF3B82F6)),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Map placeholder
          Container(
            height: 170.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(12.r),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://maps.googleapis.com/maps/api/staticmap?center=40.7128,-74.0060&zoom=14&size=600x300&maptype=roadmap',
                ),
                fit: BoxFit.cover,
                onError: null,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 20.h,
                  right: 60.w,
                  child: _buildMapPin(
                      'https://i.pravatar.cc/150?img=45',
                      const Color(0xFFEC4899)),
                ),
                Positioned(
                  top: 60.h,
                  left: 60.w,
                  child: _buildMapPin(
                      'https://i.pravatar.cc/150?img=12',
                      const Color(0xFF3B82F6),
                      showMe: true),
                ),
                Positioned(
                  top: 55.h,
                  right: 30.w,
                  child: _buildMapPin(
                      'https://i.pravatar.cc/150?img=52',
                      const Color(0xFFF59E0B)),
                ),
                Positioned(
                  bottom: 30.h,
                  left: 140.w,
                  child: _buildMapPin(
                      'https://i.pravatar.cc/150?img=15',
                      const Color(0xFF10B981)),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          // Bottom status
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD1FAE5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(Icons.people_alt_rounded,
                      color: const Color(0xFF10B981), size: 18.sp),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '4 Members Active',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                          color: const Color(0xFF1F2937),
                        ),
                      ),
                      Text(
                        'All members are safe',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: 'Inter',
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.verified_rounded,
                        color: const Color(0xFF10B981), size: 16.sp),
                    SizedBox(width: 4.w),
                    Text(
                      'All Safe',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF10B981),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapPin(String url, Color color, {bool showMe = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 16.r,
            backgroundImage: NetworkImage(url),
          ),
        ),
        if (showMe)
          Container(
            margin: EdgeInsets.only(top: 2.h),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              'Me',
              style: TextStyle(
                color: Colors.white,
                fontSize: 9.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
          ),
      ],
    );
  }


  Widget _buildGroupActions() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Group Actions',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: const Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              Expanded(
                child: _actionCard(
                  icon: Icons.person_add_alt_1_rounded,
                  label: 'Invite Member',
                  color: const Color(0xFF3B82F6),
                  bgColor: const Color(0xFFDBEAFE),
                ),
              ),
              SizedBox(width: 7.w),
              Expanded(
                child: _actionCard(
                  icon: Icons.share_rounded,
                  label: 'Share Group',
                  color: const Color(0xFF10B981),
                  bgColor: const Color(0xFFD1FAE5),
                ),
              ),
              SizedBox(width: 7.w),
              Expanded(
                child: _actionCard(
                  icon: Icons.settings_rounded,
                  label: 'Group Settings',
                  color: const Color(0xFF8B5CF6),
                  bgColor: const Color(0xFFEDE9FE),
                ),
              ),
              SizedBox(width: 7.w),
              Expanded(
                child: _actionCard(
                  icon: Icons.warning_amber_rounded,
                  label: 'Emergency Alert',
                  color: const Color(0xFFEF4444),
                  bgColor: const Color(0xFFFEE2E2),
                  isSOS: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionCard({
    required IconData icon,
    required String label,
    required Color color,
    required Color bgColor,
    bool isSOS = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 6.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: isSOS ? color : bgColor,
              shape: BoxShape.circle,
            ),
            child: isSOS
                ? Center(
              child: Text(
                'SOS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Inter',
                ),
              ),
            )
                : Icon(icon, color: color, size: 18.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 7.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1F2937),
            ),
          ),
        ],
      ),
    );
  }
}

// ============ MEMBER DATA MODEL ============
class _MemberData {
  final String name;
  final String status;
  final Color statusColor;
  final int battery;
  final IconData statusIcon;
  final Color iconColor;
  final String avatar;

  _MemberData(
      this.name,
      this.status,
      this.statusColor,
      this.battery,
      this.statusIcon,
      this.iconColor,
      this.avatar,
      );
}