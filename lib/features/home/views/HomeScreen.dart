import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/Routes/app_route_config.dart';
import 'package:kinguard/Routes/app_route_constants.dart';
import 'package:kinguard/data/models/GroupModel.dart';
import 'package:kinguard/features/home/providers/home_provider.dart';
import 'package:kinguard/features/home/widgets/FamilyStatus.dart';
import 'package:kinguard/features/home/widgets/HomeMap.dart';
import 'package:kinguard/features/home/widgets/QuickActions.dart';
import 'package:kinguard/features/home/widgets/home_widget.dart';
import 'package:kinguard/gen/fonts.gen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<GroupData> _skeletonGroups = List.generate(
    5,
        (index) => GroupData(
      groupId: index,
      groupName: 'Loading Group',
      groupType: 'Family',
      createdBy: 0,
      isActive: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeProvider);
    final groups = homeState.groups;
    final isLoading = groups == null;

    final displayGroups = isLoading ? _skeletonGroups : groups;
    final activeGroup = isLoading
        ? _skeletonGroups.first
        : (homeState.activeGroup ?? _skeletonGroups.first);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: homeAppBar(),
      body: RefreshIndicator(
        color: const Color(0xFF6366F1),
        onRefresh: () => ref.read(homeProvider.notifier).refresh(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Skeletonizer(
                  enabled: isLoading,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Active Group',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: FontFamily.interMedium,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildActiveCard(activeGroup),
                          _buildAllGroupsButton(),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      if (displayGroups.isEmpty)
                        _buildEmptyGroups()
                      else
                        SizedBox(
                          height: 50.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: displayGroups.length,
                            separatorBuilder: (_, __) =>
                                SizedBox(width: 7.w),
                            itemBuilder: (context, index) {
                              return _buildGroupCard(
                                displayGroups[index],
                                index,
                                isLoading,
                              );
                            },
                          ),
                        ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
              FamilyStatus(
                viewAll: () {
                  appRouter.router
                      .pushNamed(RouteConstants.groupDetails);
                },
                onPressFamilyStatus: () {},
              ),
              SizedBox(height: 10.h),
              const HomeMapSection(),
              QuickActions(
                createGroup: () {
                  appRouter.router.pushNamed(RouteConstants.createGroup);
                },
                iAmSafe: () {
                  appRouter.router.pushNamed(RouteConstants.safeJourney);
                },
                startJourney: () {
                  appRouter.router.pushNamed(RouteConstants.liveTracking);
                },
                addMember: () {
                  appRouter.router.pushNamed(RouteConstants.joinMember);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyGroups() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: const Color(0xFF6B7280),
            size: 18.sp,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              'No groups yet. Create your first group!',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: FontFamily.interMedium,
                color: const Color(0xFF6B7280),
              ),
            ),
          ),
          GestureDetector(
            onTap: () =>
                appRouter.router.pushNamed(RouteConstants.createGroup),
            child: Container(
              padding:
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                'Create',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11.sp,
                  fontFamily: FontFamily.interSemiBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveCard(GroupData group) {
    final style = GroupStyleHelper.getStyle(group.groupType);
    final name = group.groupName ?? 'Loading Group';
    final memberCount = 0;

    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: style.gradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(11.r),
            ),
            child: Icon(
              style.icon,
              color: Colors.white,
              size: 18.sp,
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: FontFamily.interBold,
                  color: const Color(0xFF1F2937),
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Text(
                    '$memberCount Members',
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontFamily: FontFamily.interRegular,
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                  Text(
                    ' • ',
                    style: TextStyle(
                      color: const Color(0xFF6B7280),
                      fontSize: 9.sp,
                    ),
                  ),
                  Text(
                    'All Safe',
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontFamily: FontFamily.interSemiBold,
                      color: const Color(0xFF10B981),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 10.w),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: const Color(0xFF374151),
            size: 20.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildAllGroupsButton() {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
        decoration: BoxDecoration(
          color: const Color(0xFFEDE9FE),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.grid_view_rounded,
              color: const Color(0xFF6366F1),
              size: 15.sp,
            ),
            SizedBox(width: 6.w),
            Text(
              'All Groups',
              style: TextStyle(
                color: const Color(0xFF6366F1),
                fontFamily: FontFamily.interSemiBold,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupCard(GroupData group, int index, bool isLoading) {
    return Consumer(
      builder: (context, ref, child) {
        final isActive = ref.watch(
          homeProvider.select((s) => s.selectedGroupIndex == index),
        );

        final style = GroupStyleHelper.getStyle(group.groupType);
        final name = group.groupName ?? 'Loading';
        final memberCount = 0; // TODO: fetch from member count API

        return GestureDetector(
          onTap: isLoading
              ? null
              : () => ref.read(homeProvider.notifier).selectGroup(index),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFFF5F3FF) : Colors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: isActive
                    ? const Color(0xFF6366F1)
                    : Colors.transparent,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(7.r),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: style.gradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    style.icon,
                    color: Colors.white,
                    size: 15.sp,
                  ),
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: FontFamily.interBold,
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      '$memberCount Members',
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontFamily: FontFamily.interRegular,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}