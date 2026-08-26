import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/Routes/app_route_config.dart';
import 'package:kinguard/Routes/app_route_constants.dart';
import 'package:kinguard/data/models/GroupModel.dart';
import 'package:kinguard/features/home/providers/home_provider.dart';
import 'package:kinguard/features/home/widgets/MemberStatus.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("========buildContext-rebuild====");
    final homeState = ref.watch(homeProvider);
    final groups = homeState.groups;
    final isLoading = groups == null;

    final displayGroups = isLoading ? _skeletonGroups : groups;

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
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Skeletonizer(
                  enabled: isLoading,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Groups',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: FontFamily.interSemiBold,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                      // SizedBox(height: 4.h),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     _buildActiveCard(activeGroup,),
                      //     _buildAllGroupsButton(),
                      //   ],
                      // ),
                      SizedBox(height: 4.h),
                      if (displayGroups.isEmpty)
                        _buildEmptyGroups()
                      else
                        SizedBox(
                          height: 50.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: displayGroups.length,
                            separatorBuilder: (_, __) => SizedBox(width: 7.w),
                            itemBuilder: (context, index) {
                              return _buildGroupCard(
                                displayGroups[index],
                                index,
                                isLoading,
                                onTap: () {
                                  ref
                                      .read(homeProvider.notifier)
                                      .selectGroup(
                                        index,
                                        displayGroups[index].groupId!.toInt(),
                                        displayGroups[index].groupName.toString(),

                                      );
                                },
                              );
                            },
                          ),
                        ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
              MemberStatus(
                viewAll: () {
                  appRouter.router.pushNamed(RouteConstants.groupDetails);
                },
                onPressMemberStatus: () {},
                memberDetail: homeState.memberDetail,
                isLoading: homeState.isLoadingMember,
                groupName: homeState.selectedGroupDetail['groupName'],
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
            onTap: () => appRouter.router.pushNamed(RouteConstants.createGroup),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
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




  Widget _buildGroupCard(
    GroupData group,
    int index,
    bool isLoading, {
    void Function()? onTap,
  }) {
    return Consumer(
      builder: (context, ref, child) {
        final isActive = ref.watch(
          homeProvider.select((s) => s.selectedGroupDetail['index'] == index),
        );

        final style = GroupStyleHelper.getStyle(group.groupType);
        final name = group.groupName ?? 'Loading';


        return GestureDetector(
          onTap: isLoading ? null : onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFFF5F3FF) : Colors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: isActive ? const Color(0xFF6366F1) : Colors.transparent,
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
                  child: Icon(style.icon, color: Colors.white, size: 15.sp),
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
                      '${group.totalMembers} Members',
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
