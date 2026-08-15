import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/core/network/Constant.dart';
import 'package:kinguard/core/values/utility.dart';
import 'package:kinguard/data/models/user-profile.dart';

class buildHeader extends StatelessWidget {
  buildHeader({super.key, this.userData, this.onProfileUpdate});
  void Function()? onProfileUpdate;
  UserData? userData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2563EB).withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFEEF4FF),
                    Color(0xFFDCE7FB),
                    Color(0xFFC7DBFA),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),
            Positioned(
              top: -40.h,
              right: -40.w,
              child: Container(
                width: 160.w,
                height: 160.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF2563EB).withOpacity(0.18),
                      const Color(0xFF2563EB).withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -50.h,
              left: -30.w,
              child: Container(
                width: 140.w,
                height: 140.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF8B5CF6).withOpacity(0.15),
                      const Color(0xFF8B5CF6).withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18.w),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Color(0xFF2563EB), Color(0xFF8B5CF6)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF2563EB).withOpacity(0.35),
                              blurRadius: 14,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 40.r,
                            backgroundColor: const Color(0xFFE5E7EB),
                            backgroundImage:
                                Utility.isNotNullEmptyOrFalse(
                                  userData?.profileImage,
                                )
                                ? NetworkImage(
                                    "${ConstRes.aImageBaseUrl}${userData?.profileImage}",
                                  )
                                : null,
                            child: userData?.profileImage == null
                                ? Text(
                                    userData?.name?.toUpperCase() ?? "",
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF2563EB),
                                      fontFamily: 'Inter',
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 2.h,
                        right: 2.w,
                        child: InkWell(
                          onTap: onProfileUpdate,
                          child: Container(
                            width: 30.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF2563EB,
                                  ).withOpacity(0.4),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                              size: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 18.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "${userData?.name}",
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFF0F172A),
                                  letterSpacing: -0.5,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF3B82F6),
                                    Color(0xFF2563EB),
                                  ],
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.verified_rounded,
                                color: Colors.white,
                                size: 12.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        _buildInfoRow(
                          Icons.phone_rounded,
                          "${userData?.mobileNo}",
                        ),
                        SizedBox(height: 5.h),
                        _buildInfoRow(
                          Icons.location_on_outlined,
                          'Mumbai, India',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14.sp, color: const Color(0xFF6B7280)),
        SizedBox(width: 6.w),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: 'Inter',
              color: const Color(0xFF374151),
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
