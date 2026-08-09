import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SafeJourneyScreen extends StatefulWidget {
  const SafeJourneyScreen({super.key});

  @override
  State<SafeJourneyScreen> createState() => _SafeJourneyScreenState();
}

class _SafeJourneyScreenState extends State<SafeJourneyScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStartJourneyCard(),
                    SizedBox(height: 16.h),
                    _buildActiveJourneyCard(),
                    SizedBox(height: 12.h),
                    _buildLocationSharingBanner(),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 18.sp,
              color: const Color(0xFF1F2937),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Safe Journey',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  color: const Color(0xFF1F2937),
                ),
              ),
            ),
          ),
          SizedBox(width: 18.w),
        ],
      ),
    );
  }

  Widget _buildStartJourneyCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFF3F4F6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFDBEAFE),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.verified_user_rounded,
                  color: const Color(0xFF2563EB),
                  size: 22.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start Safe Journey',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Share your trip in real-time and stay safe',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontFamily: 'Inter',
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          Text(
            'Destination',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: const Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 8.h),

          Container(
            height: 46.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search_rounded,
                  size: 18.sp,
                  color: const Color(0xFF9CA3AF),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 13.sp, fontFamily: 'Inter'),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: 'Search Place',
                      hintStyle: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'Inter',
                        color: const Color(0xFF9CA3AF),
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.my_location_rounded,
                  size: 18.sp,
                  color: const Color(0xFF2563EB),
                ),
              ],
            ),
          ),
          SizedBox(height: 18.h),

          Text(
            'ETA',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: const Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 8.h),

          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD1FAE5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.access_time_rounded,
                    color: const Color(0xFF10B981),
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '45 mins',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'Estimated time of arrival',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontFamily: 'Inter',
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 18.h),

          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.near_me_rounded, color: Colors.white, size: 18.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveJourneyCard() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FB),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF2563EB),
                  shape: BoxShape.circle,
                ),
                child: Transform.rotate(
                  angle: -0.5,
                  child: Icon(
                    Icons.near_me_rounded,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Active Journey',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Journey Active',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2563EB),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFD1FAE5),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFF10B981),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'LIVE',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF10B981),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Icon(
                Icons.trip_origin_rounded,
                size: 18.sp,
                color: const Color(0xFF2563EB),
              ),
              SizedBox(width: 6.w),
              Text(
                'Mumbai',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  color: const Color(0xFF1F2937),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: CustomPaint(
                    size: Size(double.infinity, 2.h),
                    painter: _DashedLinePainter(),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                size: 14.sp,
                color: const Color(0xFF2563EB),
              ),
              SizedBox(width: 6.w),
              Icon(
                Icons.location_on_rounded,
                size: 18.sp,
                color: const Color(0xFF2563EB),
              ),
              SizedBox(width: 4.w),
              Text(
                'Thane',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  color: const Color(0xFF1F2937),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD1FAE5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.access_time_rounded,
                    color: const Color(0xFF10B981),
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ETA',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: 'Inter',
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                      Text(
                        '25 mins',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                          color: const Color(0xFF1F2937),
                        ),
                      ),
                      Text(
                        'Estimated time of arrival',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: 'Inter',
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 46.h,
                  width: 1,
                  color: const Color(0xFFE5E7EB),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 12.w,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEE2E2),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 18.w,
                            height: 18.w,
                            decoration: const BoxDecoration(
                              color: Color(0xFFEF4444),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.stop_rounded,
                              color: Colors.white,
                              size: 12.sp,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            'Stop',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFEF4444),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSharingBanner() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FB),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: const Color(0xFFDBEAFE),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shield_rounded,
              color: const Color(0xFF2563EB),
              size: 18.sp,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your location is being shared with group members.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    color: const Color(0xFF1F2937),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Manage Settings',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF2563EB),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: const Color(0xFF9CA3AF),
            size: 20.sp,
          ),
        ],
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const dashWidth = 5.0;
    const dashSpace = 4.0;
    double startX = 0;
    final paint = Paint()
      ..color = const Color(0xFF93C5FD)
      ..strokeWidth = 1.5;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
