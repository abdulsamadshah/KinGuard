import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildInviteViaCard extends StatelessWidget {
   BuildInviteViaCard({super.key,required this.onPressCopyLink,required this.onPressMessages,required this.onPressShare,required this.onPressWhatsApp});
  void Function() onPressWhatsApp;
  void Function() onPressMessages;
  void Function() onPressCopyLink;
  void Function() onPressShare;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Invite via',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: const Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              inviteIcon(
                icon: Icons.phone,
                label: 'WhatsApp',
                bgColor: const Color(0xFFD1FAE5),
                iconColor: const Color(0xFF10B981),
                onTap: onPressWhatsApp

              ),
              inviteIcon(
                icon: Icons.chat_bubble_rounded,
                label: 'Messages',
                bgColor: const Color(0xFFDBEAFE),
                iconColor: const Color(0xFF3B82F6),
                onTap: onPressMessages
              ),
              inviteIcon(
                icon: Icons.link_rounded,
                label: 'Copy Link',
                bgColor: const Color(0xFFEDE9FE),
                iconColor: const Color(0xFF8B5CF6),
                onTap: onPressCopyLink
              ),
              inviteIcon(
                icon: Icons.share_rounded,
                label: 'More',
                bgColor: const Color(0xFFFEF3C7),
                iconColor: const Color(0xFFF59E0B),
                onTap: onPressShare
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget inviteIcon({
    required IconData icon,
    required String label,
    required Color bgColor,
    required Color iconColor,
    required void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 22.sp),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
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
