import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildAppBar(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 18.sp,
            color: const Color(0xFF1F2937),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'Add Member',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  color: const Color(0xFF1F2937),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Search from Contacts',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  color: const Color(0xFF6B7280),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 18.w),
      ],
    ),
  );
}

Widget buildSearchBar() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search_rounded,
                  size: 20.sp,
                  color: const Color(0xFF9CA3AF),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 13.sp, fontFamily: 'Inter'),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: 'Search by name or phone number',
                      hintStyle: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'Inter',
                        color: const Color(0xFF9CA3AF),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          width: 48.h,
          height: 48.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Icon(
            Icons.tune_rounded,
            size: 20.sp,
            color: const Color(0xFF1F2937),
          ),
        ),
      ],
    ),
  );
}

Widget buildSearchContactsBanner() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16.w),
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      color: const Color(0xFFF9FAFB),
      borderRadius: BorderRadius.circular(14.r),
      border: Border.all(color: const Color(0xFFE5E7EB)),
    ),
    child: Row(
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: const Color(0xFFDBEAFE),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.perm_contact_cal,
            color: const Color(0xFF3B82F6),
            size: 20.sp,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search from Contacts',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  color: const Color(0xFF1F2937),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Find your friends and family\nfrom your contacts',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: 'Inter',
                  color: const Color(0xFF6B7280),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: const Color(0xFF2563EB),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.contact_page_rounded,
                size: 14.sp,
                color: Colors.white,
              ),
              SizedBox(width: 6.w),
              Text(
                'Search Contacts',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildPeopleHeader() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'People you may know',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
            color: const Color(0xFF1F2937),
          ),
        ),
        Text(
          '3 Found',
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            color: const Color(0xFF3B82F6),
          ),
        ),
      ],
    ),
  );
}

Widget buildUserCard({
  required String name,
  required String phone,
  required String avatar,
  required bool isOnline,
  required bool inContacts,
  required String buttonText,
  required bool isFilled,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16.w),
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14.r),
      border: Border.all(color: const Color(0xFFE5E7EB)),
    ),
    child: Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 26.r,
              backgroundColor: const Color(0xFFE5E7EB),
              backgroundImage: NetworkImage(avatar),
            ),
            Positioned(
              bottom: 2.h,
              right: 2.w,
              child: Container(
                width: 12.w,
                height: 12.w,
                decoration: BoxDecoration(
                  color: isOnline
                      ? const Color(0xFF10B981)
                      : const Color(0xFF9CA3AF),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
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
                name,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  color: const Color(0xFF1F2937),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                phone,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  color: const Color(0xFF6B7280),
                ),
              ),
              SizedBox(height: 6.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: inContacts
                      ? const Color(0xFFD1FAE5)
                      : const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      inContacts
                          ? Icons.contact_page_rounded
                          : Icons.shield_outlined,
                      size: 11.sp,
                      color: inContacts
                          ? const Color(0xFF10B981)
                          : const Color(0xFF6B7280),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      inContacts ? 'In Contacts' : 'Not on KinGuard',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: inContacts
                            ? const Color(0xFF10B981)
                            : const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
          decoration: BoxDecoration(
            color: isFilled ? const Color(0xFFDBEAFE) : Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: isFilled
                  ? const Color(0xFFDBEAFE)
                  : const Color(0xFF3B82F6),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                buttonText == 'Invite'
                    ? Icons.person_add_alt_rounded
                    : Icons.person_add_alt_1_rounded,
                size: 14.sp,
                color: const Color(0xFF3B82F6),
              ),
              SizedBox(width: 6.w),
              Text(
                buttonText,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF3B82F6),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildInviteViaCard() {
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
            ),
            inviteIcon(
              icon: Icons.chat_bubble_rounded,
              label: 'Messages',
              bgColor: const Color(0xFFDBEAFE),
              iconColor: const Color(0xFF3B82F6),
            ),
            inviteIcon(
              icon: Icons.link_rounded,
              label: 'Copy Link',
              bgColor: const Color(0xFFEDE9FE),
              iconColor: const Color(0xFF8B5CF6),
            ),
            inviteIcon(
              icon: Icons.share_rounded,
              label: 'More',
              bgColor: const Color(0xFFFEF3C7),
              iconColor: const Color(0xFFF59E0B),
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
}) {
  return Column(
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
  );
}

Widget buildStayConnectedBanner() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16.w),
    padding: EdgeInsets.all(14.w),
    decoration: BoxDecoration(
      color: const Color(0xFFEFF6FF),
      borderRadius: BorderRadius.circular(14.r),
    ),
    child: Row(
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: const Color(0xFFDBEAFE),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.shield_rounded,
            color: const Color(0xFF3B82F6),
            size: 20.sp,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invite & Stay Connected',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  color: const Color(0xFF1F2937),
                ),
              ),
              SizedBox(height: 3.h),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: 'Inter',
                    color: const Color(0xFF6B7280),
                    height: 1.3,
                  ),
                  children: const [
                    TextSpan(text: 'Invite your loved ones to join '),
                    TextSpan(
                      text: 'KinGuard',
                      style: TextStyle(
                        color: Color(0xFF3B82F6),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(text: ' and stay\nconnected for safety.'),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 8.w),
      ],
    ),
  );
}
