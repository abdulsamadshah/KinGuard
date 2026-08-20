import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/data/models/all_users_model.dart';
import 'package:kinguard/features/Group/providers/join_member_provider.dart';
import 'package:kinguard/features/Group/widgets/Invite_via.dart';
import 'package:kinguard/features/Group/widgets/member_widget.dart'; // your path
import 'package:permission_handler/permission_handler.dart';
import 'package:skeletonizer/skeletonizer.dart';

class JoinMemberScreen extends ConsumerStatefulWidget {
  const JoinMemberScreen({super.key});

  @override
  ConsumerState<JoinMemberScreen> createState() => _JoinMemberScreenState();
}

class _JoinMemberScreenState extends ConsumerState<JoinMemberScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<UserItem> _skeletonUsers = List.generate(
    3,
    (i) => UserItem(
      userId: i,
      name: 'Loading User',
      mobileNo: '+91 00000 00000',
      contactName: 'Loading Contact',
    ),
  );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Member added successfully!'),
        backgroundColor: const Color(0xFF10B981),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: const Color(0xFFEF4444),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(joinMemberProvider);
    final isLoading = state.matchedUsers == null;
    final users = isLoading ? _skeletonUsers : (state.filteredUsers ?? []);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(context),
            Expanded(
              child: RefreshIndicator(
                color: const Color(0xFF3B82F6),
                onRefresh: () =>
                    ref.read(joinMemberProvider.notifier).refresh(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),
                      buildSearchBar(
                        controller: _searchController,
                        onChanged: (value) {
                          ref
                              .read(joinMemberProvider.notifier)
                              .searchUsers(value);
                        },
                      ),
                      SizedBox(height: 14.h),
                      buildSearchContactsBanner(),
                      SizedBox(height: 18.h),
                      buildPeopleHeader(users.length),
                      SizedBox(height: 10.h),
                      Skeletonizer(
                        enabled: isLoading,
                        child: users.isEmpty && !isLoading
                            ? buildEmptyState()
                            : Column(
                                children: users.map((user) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 10.h),
                                    child: buildUserCard(
                                      user: user,
                                      context: context,
                                      onSuccess: _showSuccess,
                                      onError: _showError,
                                    ),
                                  );
                                }).toList(),
                              ),
                      ),
                      SizedBox(height: 18.h),
                      BuildInviteViaCard(
                        onPressCopyLink: () {},
                        onPressMessages: () {},
                        onPressShare: () {},
                        onPressWhatsApp: () {},
                      ),
                      SizedBox(height: 14.h),
                      buildStayConnectedBanner(),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionDeniedUI() {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.contact_phone_outlined,
            size: 60.sp,
            color: const Color(0xFF9CA3AF),
          ),
          SizedBox(height: 14.h),
          Text(
            'Contacts permission required',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Allow access to your contacts to find friends already on KinGuard.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: 'Inter',
              color: const Color(0xFF6B7280),
            ),
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: () async {
              await openAppSettings();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2563EB),
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Text(
              'Open Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          TextButton(
            onPressed: () => ref.read(joinMemberProvider.notifier).refresh(),
            child: Text(
              'Try Again',
              style: TextStyle(
                color: const Color(0xFF2563EB),
                fontSize: 13.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
