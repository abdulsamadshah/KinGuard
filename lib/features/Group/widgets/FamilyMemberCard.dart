
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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