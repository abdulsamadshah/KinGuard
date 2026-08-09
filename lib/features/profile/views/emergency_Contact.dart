import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({super.key});

  @override
  State<EmergencyContactsScreen> createState() =>
      _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  int selectedTab = 4;

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
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStayConnectedCard(),
                    SizedBox(height: 20.h),
                    Text(
                      'Your Emergency Contacts',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    _buildContactCard(
                      initial: 'M',
                      avatarBg: const Color(0xFFD1FAE5),
                      avatarColor: const Color(0xFF10B981),
                      name: 'Mother',
                      phone: '+91 98765 11111',
                      isPrimary: true,
                    ),
                    SizedBox(height: 12.h),
                    _buildContactCard(
                      initial: 'F',
                      avatarBg: const Color(0xFFDBEAFE),
                      avatarColor: const Color(0xFF3B82F6),
                      name: 'Father',
                      phone: '+91 98765 22222',
                      isPrimary: false,
                    ),
                    SizedBox(height: 12.h),
                    _buildContactCard(
                      initial: 'B',
                      avatarBg: const Color(0xFFEDE9FE),
                      avatarColor: const Color(0xFF8B5CF6),
                      name: 'Brother',
                      phone: '+91 98765 33333',
                      isPrimary: false,
                    ),
                    SizedBox(height: 16.h),
                    _buildAddContactCard(),
                    SizedBox(height: 14.h),
                    _buildImportantCard(),
                    SizedBox(height: 16.h),
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
            child: Icon(Icons.arrow_back_rounded,
                size: 22.sp, color: const Color(0xFF1F2937)),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Emergency Contacts',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  color: const Color(0xFF1F2937),
                ),
              ),
            ),
          ),
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Icon(Icons.add_rounded,
                size: 20.sp, color: const Color(0xFF2563EB)),
          ),
        ],
      ),
    );
  }

  Widget _buildStayConnectedCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FB),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44.w,
            height: 50.w,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22),
              ),
            ),
            child: Icon(Icons.person_rounded,
                color: Colors.white, size: 26.sp),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stay Safe, Stay Connected',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'These contacts will be notified immediately in case of an emergency or SOS.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    color: const Color(0xFF6B7280),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required String initial,
    required Color avatarBg,
    required Color avatarColor,
    required String name,
    required String phone,
    required bool isPrimary,
  }) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFF3F4F6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: avatarBg,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                initial,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: avatarColor,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    if (isPrimary) ...[
                      SizedBox(width: 6.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD1FAE5),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          'Primary',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF10B981),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  phone,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    color: const Color(0xFF6B7280),
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Icon(Icons.verified_user_rounded,
                        size: 12.sp, color: const Color(0xFF10B981)),
                    SizedBox(width: 4.w),
                    Text(
                      'Will be notified in emergencies',
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'Inter',
                        color: const Color(0xFF10B981),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 34.w,
            height: 34.w,
            decoration: BoxDecoration(
              color: const Color(0xFFD1FAE5),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.phone_rounded,
                color: const Color(0xFF10B981), size: 16.sp),
          ),
          SizedBox(width: 8.w),
          Container(
            width: 34.w,
            height: 34.w,
            decoration: BoxDecoration(
              color: const Color(0xFFDBEAFE),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.chat_bubble_outline_rounded,
                color: const Color(0xFF3B82F6), size: 16.sp),
          ),
          SizedBox(width: 4.w),
          Icon(Icons.chevron_right_rounded,
              size: 20.sp, color: const Color(0xFF9CA3AF)),
        ],
      ),
    );
  }

  Widget _buildAddContactCard() {
    return DottedBorderContainer(
      child: Container(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: const BoxDecoration(
                color: Color(0xFF2563EB),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add_rounded, color: Colors.white, size: 22.sp),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Contact',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2563EB),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Add a new emergency contact',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      color: const Color(0xFF6B7280),
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

  Widget _buildImportantCard() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFF3F4F6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.notifications_rounded,
              color: const Color(0xFF2563EB), size: 20.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Important',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'SOS alerts and important updates will be sent to all your emergency contacts.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    color: const Color(0xFF6B7280),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}

class DottedBorderContainer extends StatelessWidget {
  final Widget child;
  const DottedBorderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFF),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: child,
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF93C5FD)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const dashWidth = 6.0;
    const dashSpace = 4.0;
    final radius = Radius.circular(14.r);

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        radius,
      ));

    final dashPath = Path();
    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final len =
        distance + dashWidth < metric.length ? dashWidth : metric.length - distance;
        dashPath.addPath(metric.extractPath(distance, distance + len), Offset.zero);
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}