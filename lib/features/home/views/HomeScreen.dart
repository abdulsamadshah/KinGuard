import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/core/constants/asset_res.dart';
import 'package:kinguard/core/theme/app_colors.dart';
import 'package:kinguard/features/home/widgets/FamilyStatus.dart';
import 'package:kinguard/features/home/widgets/HomeMap.dart';
import 'package:kinguard/features/home/widgets/home_widget.dart';
import 'package:kinguard/gen/fonts.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar:homeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            FamilyStatus(viewAll: () {  }, onPressFamilyStatus: () {  },),

            SizedBox(height: 16.h),

            // In your HomeScreen body
            const HomeMapSection(),
            // Quick Actions
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Actions',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff1A1A2E),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _QuickActionButton(
                        icon: Icons.location_on,
                        label: 'Start Journey',
                        color: const Color(0xff00C48C),
                      ),
                      _QuickActionButton(
                        icon: Icons.group_add,
                        label: 'Create Group',
                        color: const Color(0xff8E51FF),
                      ),
                      _QuickActionButton(
                        icon: Icons.shield,
                        label: "I'm Safe",
                        color: const Color(0xff00C48C),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xff00C48C),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Groups'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// Family Member Card Widget
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
                 CircleAvatar(radius: 10.r, backgroundColor: Colors.white, child: Icon(Icons.directions_car, size: 14, color: Colors.blue)),
            ],
          ),
          SizedBox(height: 8.h),
          Text(name, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
          Text(status, style: TextStyle(fontSize: 12.sp, color: color)),
          const Spacer(),
          Text(battery, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _MapActionButton extends StatelessWidget {
  final IconData icon;
  const _MapActionButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: IconButton(icon: Icon(icon, color: Colors.black87), onPressed: () {}),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _QuickActionButton({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            SizedBox(height: 8.h),
            Text(label, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}