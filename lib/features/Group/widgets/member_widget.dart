import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/core/network/Constant.dart';
import 'package:kinguard/data/models/all_users_model.dart';
import 'package:kinguard/features/Group/providers/join_member_provider.dart';
import 'package:kinguard/features/Group/widgets/select_group_bottom_sheet.dart';
import 'package:skeletonizer/skeletonizer.dart';

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

Widget buildSearchBar({
  required TextEditingController controller,
  required ValueChanged<String> onChanged,
}) {
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
                Icon(Icons.search_rounded,
                    size: 20.sp, color: const Color(0xFF9CA3AF)),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged,
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
          child: Icon(Icons.tune_rounded,
              size: 20.sp, color: const Color(0xFF1F2937)),
        ),
      ],
    ),
  );
}


Widget buildEmptyState() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
    child: Column(
      children: [
        Icon(Icons.people_outline_rounded,
            size: 60.sp, color: const Color(0xFF9CA3AF)),
        SizedBox(height: 12.h),
        Text(
          'No users found',
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1F2937),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Try a different search or refresh',
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'Inter',
            color: const Color(0xFF6B7280),
          ),
        ),
      ],
    ),
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
          decoration: const BoxDecoration(
            color: Color(0xFFDBEAFE),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.shield_rounded,
              color: const Color(0xFF3B82F6), size: 20.sp),
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
          decoration: const BoxDecoration(
            color: Color(0xFFDBEAFE),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.perm_contact_cal,
              color: const Color(0xFF3B82F6), size: 20.sp),
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
              Icon(Icons.contact_page_rounded,
                  size: 14.sp, color: Colors.white),
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

Widget buildPeopleHeader(int count) {
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
          '$count Found',
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
















String? _buildImageUrl(String? path) {
  if (path == null || path.isEmpty) return null;
  if (path.startsWith('http')) return path;
  if (path.startsWith('uploads/')) {
    return '${ConstRes.aImageBaseUrl}$path';
  }
  return '${ConstRes.aImageBaseUrl}uploads/Auth/$path';
}

Widget buildUserCard({
  required UserItem user,
  required BuildContext context,
  required VoidCallback onSuccess,
  required Function(String) onError,
}) {
  return Consumer(
    builder: (context, ref, child) {
      final state = ref.watch(joinMemberProvider);
      final userId = user.userId ?? 0;

      final isInviting = state.invitingUserIds.contains(userId);
      final isAdded = state.isUserAddedToAnyGroup(userId);
      final addedCount = state.userAddedGroups[userId]?.length ?? 0;

      final avatar = _buildImageUrl(user.profileImage);
      final displayName = user.contactName ?? user.name ?? 'Unknown';
      final phone = user.mobileNo ?? '-';

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
                  backgroundImage:
                  avatar != null ? NetworkImage(avatar) : null,
                  child: avatar == null
                      ? Text(
                    displayName.isNotEmpty
                        ? displayName[0].toUpperCase()
                        : 'U',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF6B7280),
                    ),
                  )
                      : null,
                ),
                Positioned(
                  bottom: 2.h,
                  right: 2.w,
                  child: Container(
                    width: 12.w,
                    height: 12.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981),
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
                    displayName,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                      color: const Color(0xFF1F2937),
                    ),
                    overflow: TextOverflow.ellipsis,
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
                    padding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: isAdded
                          ? const Color(0xFFD1FAE5)
                          : const Color(0xFFDBEAFE),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isAdded
                              ? Icons.check_circle_rounded
                              : Icons.contact_page_rounded,
                          size: 11.sp,
                          color: isAdded
                              ? const Color(0xFF10B981)
                              : const Color(0xFF3B82F6),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          isAdded
                              ? 'In $addedCount ${addedCount == 1 ? "group" : "groups"}'
                              : 'In Contacts',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            color: isAdded
                                ? const Color(0xFF10B981)
                                : const Color(0xFF3B82F6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: isInviting
                  ? null
                  : () async {
                await SelectGroupBottomSheet.show(
                  context,
                  user: user,
                  onDone: (success, groupId, groupName) {
                    if (success) {
                      onSuccess();
                    } else {
                      final msg =
                          ref.read(joinMemberProvider).errorMessage ??
                              'Failed to add member';
                      onError(msg);
                    }
                  },
                );
              },
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
                decoration: BoxDecoration(
                  color: isAdded ? const Color(0xFFD1FAE5) : Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: isAdded
                        ? const Color(0xFF10B981)
                        : const Color(0xFF3B82F6),
                  ),
                ),
                child: isInviting
                    ? SizedBox(
                  width: 16.w,
                  height: 16.w,
                  child: const CircularProgressIndicator(
                    color: Color(0xFF3B82F6),
                    strokeWidth: 2,
                  ),
                )
                    : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isAdded
                          ? Icons.add_rounded
                          : Icons.person_add_alt_1_rounded,
                      size: 14.sp,
                      color: isAdded
                          ? const Color(0xFF10B981)
                          : const Color(0xFF3B82F6),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      isAdded ? 'Add More' : 'Add',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: isAdded
                            ? const Color(0xFF10B981)
                            : const Color(0xFF3B82F6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}