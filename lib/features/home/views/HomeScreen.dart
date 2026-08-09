import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/Routes/app_route_config.dart';
import 'package:kinguard/Routes/app_route_constants.dart';
import 'package:kinguard/data/models/GroupModel.dart';
import 'package:kinguard/features/home/widgets/FamilyStatus.dart';
import 'package:kinguard/features/home/widgets/HomeMap.dart';
import 'package:kinguard/features/home/widgets/QuickActions.dart';
import 'package:kinguard/features/home/widgets/home_widget.dart';
import 'package:kinguard/gen/fonts.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<GroupModel> groups = [
    GroupModel(
      name: 'My Family',
      members: 4,
      icon: Icons.people_alt_rounded,
      gradient: const [Color(0xFF3B82F6), Color(0xFF6366F1)],
    ),
    GroupModel(
      name: 'Parents Group',
      members: 3,
      icon: Icons.groups_rounded,
      gradient: const [Color(0xFF10B981), Color(0xFF059669)],
    ),
    GroupModel(
      name: 'Office Team',
      members: 12,
      icon: Icons.business_center_rounded,
      gradient: const [Color(0xFFF59E0B), Color(0xFFF97316)],
    ),
    GroupModel(
      name: 'Trip Group',
      members: 5,
      icon: Icons.flight_rounded,
      gradient: const [Color(0xFF8B5CF6), Color(0xFFA855F7)],
    ),
    GroupModel(
      name: 'College Friends',
      members: 8,
      icon: Icons.school_rounded,
      gradient: const [Color(0xFFEC4899), Color(0xFFDB2777)],
    ),
    GroupModel(
      name: 'Gym Buddies',
      members: 6,
      icon: Icons.fitness_center_rounded,
      gradient: const [Color(0xFF14B8A6), Color(0xFF0891B2)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final activeGroup = groups[selectedIndex];
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: homeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
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

                  SizedBox(
                    height: 50.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: groups.length,
                      separatorBuilder: (_, __) => SizedBox(width: 7.w),
                      itemBuilder: (context, index) {
                        return _buildGroupCard(groups[index], index);
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),

            FamilyStatus(
              viewAll: () {
                appRouter.router.pushNamed(RouteConstants.groupDetails);
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
    );
  }

  // Active Card Widget
  Widget _buildActiveCard(GroupModel group) {
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
              gradient: const LinearGradient(
                colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(11.r),
            ),
            child: Icon(
              Icons.people_alt_rounded,
              color: Colors.white,
              size: 18.sp,
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                group.name,
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
                    '${group.members} Members',
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
    return Container(
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
    );
  }

  Widget _buildGroupCard(GroupModel group, int index) {
    final isActive = selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
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
                  colors: group.gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(group.icon, color: Colors.white, size: 15.sp),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  group.name,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: FontFamily.interBold,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  '${group.members} Members',
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
  }
}

class FamilyMemberCard extends StatelessWidget {
  final String name;
  final String relation;
  final String status;
  final String battery;
  final Color color;
  final String image;
  final bool isTraveling;
  final bool isHome;

  const FamilyMemberCard({
    super.key,
    required this.name,
    required this.relation,
    required this.status,
    required this.battery,
    required this.color,
    required this.image,
    this.isTraveling = false,
    this.isHome = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              CircleAvatar(radius: 32.r, backgroundImage: NetworkImage(image)),
              if (isTraveling)
                CircleAvatar(
                  radius: 10.r,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.directions_car,
                    size: 14,
                    color: Colors.blue,
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            name,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
          Text(
            status,
            style: TextStyle(fontSize: 12.sp, color: color),
          ),
          const Spacer(),
          Text(
            battery,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
