import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/gen/fonts.gen.dart';

class FamilyStatus extends StatelessWidget {
  FamilyStatus({
    super.key,
    required this.viewAll,
    required this.onPressFamilyStatus,
  });
  void Function() viewAll;
  void Function() onPressFamilyStatus;

  final List<FamilyMember> familyMembers = [
    FamilyMember(
      name: 'Abdul',
      status: 'Online',
      battery: '85%',
      color: const Color(0xff00C48C),
      image: 'https://i.pravatar.cc/300?u=abdul',
      isOnline: true,
    ),
    FamilyMember(
      name: 'Mother',
      status: 'Traveling',
      battery: '40%',
      color: const Color(0xffFF9500),
      image: 'https://i.pravatar.cc/300?u=mother',
      isTraveling: true,
    ),
    FamilyMember(
      name: 'Ayesha',
      status: 'Online',
      battery: '95%',
      color: const Color(0xff00C48C),
      image: 'https://i.pravatar.cc/300?u=ayesha',
      isOnline: true,
    ),
    FamilyMember(
      name: 'Grandpa',
      status: 'At Home',
      battery: '65%',
      color: const Color(0xffFF9500),
      image: 'https://i.pravatar.cc/300?u=grandpa',
      isHome: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Family Status',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: FontFamily.interBold,
                  color: const Color(0xff1A1A2E),
                ),
              ),
              TextButton(
                onPressed: viewAll,
                child: Text(
                  'View All >',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: FontFamily.interMedium,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 170.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            itemCount: familyMembers.length,
            itemBuilder: (context, index) {
              final member = familyMembers[index];
              return InkWell(
                onTap: onPressFamilyStatus,
                child: FamilyMemberCard(
                  name: member.name,
                  status: member.status,
                  battery: member.battery,
                  color: member.color,
                  image: member.image,
                  isOnline: member.isOnline,
                  isTraveling: member.isTraveling,
                  isHome: member.isHome,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class FamilyMember {
  final String name;
  final String status;
  final String battery;
  final Color color;
  final String image;
  final bool isOnline;
  final bool isTraveling;
  final bool isHome;

  FamilyMember({
    required this.name,
    required this.status,
    required this.battery,
    required this.color,
    required this.image,
    this.isOnline = true,
    this.isTraveling = false,
    this.isHome = false,
  });
}

class FamilyMemberCard extends StatelessWidget {
  final String name;
  final String status;
  final String battery;
  final Color color;
  final String image;
  final bool isOnline;
  final bool isTraveling;
  final bool isHome;

  const FamilyMemberCard({
    super.key,
    required this.name,
    required this.status,
    required this.battery,
    required this.color,
    required this.image,
    this.isOnline = true,
    this.isTraveling = false,
    this.isHome = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115.w,
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17.r),
        border: Border.all(color: color.withOpacity(0.25), width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              CircleAvatar(
                radius: 29.r,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(image),
              ),
              if (isOnline)
                Container(
                  width: 18.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                    color: const Color(0xff00C48C),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.5),
                  ),
                ),
              if (isTraveling)
                Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.directions_car,
                    size: 18.r,
                    color: Colors.blue,
                  ),
                ),
              if (isHome)
                Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.home,
                    size: 18.r,
                    color: const Color(0xffFF9500),
                  ),
                ),
            ],
          ),
          SizedBox(height: 10.h),

          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15.sp,

              fontFamily: FontFamily.interSemiBold,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1A1A2E),
            ),
          ),
          SizedBox(height: 7.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(
                  color: const Color(0xff00C48C),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.5),
                ),
              ),
              SizedBox(width: 3.w),
              Text(
                status,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: FontFamily.interSemiBold,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.battery_full, size: 18.r, color: color),
              ),
              SizedBox(width: 4.w),
              Text(
                battery,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: FontFamily.interSemiBold,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
