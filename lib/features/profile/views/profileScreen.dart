import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/Routes/app_route_config.dart';
import 'package:kinguard/Routes/app_route_constants.dart';
import 'package:kinguard/core/Widget/common_widgets/NetworkError.dart';
import 'package:kinguard/core/constants/bottomSheet/selectFileBottomSheet.dart';
import 'package:kinguard/core/values/utility.dart';
import 'package:kinguard/features/profile/providers/profile_provider.dart';
import 'package:kinguard/features/profile/widgets/profileHeader.dart';
import 'package:kinguard/features/profile/widgets/profile_Widget.dart'
    hide buildHeader;
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileProvider);
    final user = profileState.userData;
    final isLoading = user == null;

    if (profileState.errorMessage != null && user == null) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: buildErrorState(
            profileState.errorMessage!,
            refreshData: () {
              ref.read(profileProvider.notifier).refreshProfile();
            },
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          color: const Color(0xFF2563EB),
          onRefresh: () => ref.read(profileProvider.notifier).refreshProfile(),
          child: Skeletonizer(
            enabled: isLoading,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  child: profileAppBar(),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildHeader(userData: user,onProfileUpdate: () {
                          ModalImage bottomNavbar = ModalImage(
                            isImageCroppable: true,
                            onImageSelect: (path) async {
                              if (Utility.isNotNullEmptyOrFalse(path)) {
                                Navigator.pop(context);

                              }
                            },
                          );
                          bottomNavbar.mainBottomSheet(context);
                        },),
                        SizedBox(height: 14.h),
                        buildEditProfileButton(),
                        SizedBox(height: 20.h),
                        buildSectionTitle('ACCOUNT & SAFETY'),
                        SizedBox(height: 10.h),
                        buildMenuGroup([
                          MenuItem(
                            icon: Icons.phone_in_talk_rounded,
                            iconColor: const Color(0xFFEF4444),
                            iconBg: const Color(0xFFFEE2E2),
                            title: 'Emergency Contacts',
                            onTap: () {
                              appRouter.router.pushNamed(
                                RouteConstants.emergencyContact,
                              );
                            },
                          ),
                          MenuItem(
                            icon: Icons.shield_rounded,
                            iconColor: const Color(0xFF3B82F6),
                            iconBg: const Color(0xFFDBEAFE),
                            title: 'Privacy',
                          ),
                          MenuItem(
                            icon: Icons.lock_rounded,
                            iconColor: const Color(0xFF10B981),
                            iconBg: const Color(0xFFD1FAE5),
                            title: 'Permissions',
                          ),
                          MenuItem(
                            icon: Icons.emoji_events_rounded,
                            iconColor: const Color(0xFFF59E0B),
                            iconBg: const Color(0xFFFEF3C7),
                            title: 'Premium',
                            trailingBadge: 'Active',
                          ),
                        ]),
                        SizedBox(height: 20.h),
                        buildSectionTitle('SUPPORT & INFO'),
                        SizedBox(height: 10.h),
                        buildMenuGroup([
                          MenuItem(
                            icon: Icons.headset_mic_rounded,
                            iconColor: const Color(0xFF8B5CF6),
                            iconBg: const Color(0xFFEDE9FE),
                            title: 'Help & Support',
                          ),
                          MenuItem(
                            icon: Icons.info_outline_rounded,
                            iconColor: const Color(0xFF6B7280),
                            iconBg: const Color(0xFFF3F4F6),
                            title: 'About KinGuard',
                          ),
                          MenuItem(
                            icon: Icons.star_border_rounded,
                            iconColor: const Color(0xFFF59E0B),
                            iconBg: const Color(0xFFFEF3C7),
                            title: 'Rate KinGuard',
                          ),
                        ]),
                        SizedBox(height: 20.h),
                        buildLogoutButton(
                          onTap: () {
                            ref.read(profileProvider.notifier).logOut();
                          },
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
