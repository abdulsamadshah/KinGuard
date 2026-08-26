import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/core/network/Constant.dart';
import 'package:kinguard/core/values/utility.dart';
import 'package:kinguard/data/models/member_res.dart';
import 'package:kinguard/gen/fonts.gen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MemberStatus extends StatelessWidget {
  const MemberStatus({
    super.key,
    required this.viewAll,
    required this.onPressMemberStatus,
    this.memberDetail,
    this.isLoading = false,
    this.errorMessage,
    this.groupName
  });

  final VoidCallback viewAll;
  final VoidCallback onPressMemberStatus;
  final List<MemberData>? memberDetail;
  final bool isLoading;
  final String? errorMessage;
  final String? groupName;

  @override
  Widget build(BuildContext context) {
    if (!Utility.isNullEmptyOrFalse(errorMessage)) {
      return Center(child: Text(errorMessage ?? ''));
    }

    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  groupName ?? "",
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

              itemCount: memberDetail?.length ?? 0,

              itemBuilder: (context, index) {
                final member = memberDetail?[index];

                return InkWell(
                  onTap: onPressMemberStatus,
                  child: FamilyMemberCard(memberDetail: member),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FamilyMemberCard extends StatelessWidget {
  const FamilyMemberCard({super.key, this.memberDetail});

  final MemberData? memberDetail;

  @override
  Widget build(BuildContext context) {
    final status = memberDetail?.status ?? 'Offline';
    final batteryLevel = memberDetail?.batteryLevel ?? 0;

    final bool isOnline = status.toLowerCase() == 'online';

    final Color statusColor = isOnline ? const Color(0xff00C48C) : Colors.grey;

    final imageUrl = memberDetail?.profileImage;

    return Container(
      width: 115.w,
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17.r),
        border: Border.all(color: statusColor.withOpacity(0.25), width: 1.5),
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
                backgroundImage: imageUrl != null && imageUrl.isNotEmpty
                    ? NetworkImage(ConstRes.aImageBaseUrl+imageUrl)
                    : null,
                child: imageUrl == null || imageUrl.isEmpty
                    ? Icon(Icons.person, size: 30.r, color: Colors.white)
                    : null,
              ),


              Container(
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.5),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          Text(
            memberDetail?.name ?? 'Unknown',
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
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
              ),

              SizedBox(width: 4.w),

              Flexible(
                child: Text(
                  status,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: FontFamily.interSemiBold,
                    color: statusColor,
                    fontWeight: FontWeight.w500,
                  ),
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
                child: Icon(Icons.battery_full, size: 18.r, color: statusColor),
              ),

              SizedBox(width: 4.w),

              Text(
                '$batteryLevel%',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: FontFamily.interSemiBold,
                  fontWeight: FontWeight.w600,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
