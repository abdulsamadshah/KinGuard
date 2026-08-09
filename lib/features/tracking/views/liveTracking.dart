import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LiveTrackingScreen extends StatefulWidget {
  const LiveTrackingScreen({super.key});

  @override
  State<LiveTrackingScreen> createState() => _LiveTrackingScreenState();
}

class _LiveTrackingScreenState extends State<LiveTrackingScreen> {
  GoogleMapController? _mapController;

  static const LatLng _userLocation = LatLng(19.0760, 72.8777);
  static const LatLng _carLocation = LatLng(19.0810, 72.8830);
  static const LatLng _mallLocation = LatLng(19.0790, 72.8790);
  static const LatLng _parkLocation = LatLng(19.0740, 72.8720);
  static const LatLng _hospitalLocation = LatLng(19.0720, 72.8740);
  static const LatLng _lakeParkLocation = LatLng(19.0730, 72.8800);

  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  Set<Circle> _circles = {};

  @override
  void initState() {
    super.initState();
    _setupMap();
  }

  void _setupMap() {
    _circles = {
      Circle(
        circleId: const CircleId('user_outer'),
        center: _userLocation,
        radius: 200,
        fillColor: const Color(0xFF2563EB).withOpacity(0.12),
        strokeColor: const Color(0xFF2563EB).withOpacity(0.3),
        strokeWidth: 1,
      ),
      Circle(
        circleId: const CircleId('user_inner'),
        center: _userLocation,
        radius: 120,
        fillColor: const Color(0xFF2563EB).withOpacity(0.2),
        strokeColor: Colors.transparent,
      ),
    };

    _polylines = {
      Polyline(
        polylineId: const PolylineId('route'),
        points: const [
          _userLocation,
          LatLng(19.0775, 72.8800),
          LatLng(19.0795, 72.8815),
          _carLocation,
        ],
        color: const Color(0xFF2563EB),
        width: 4,
      ),
    };

    _markers = {
      Marker(
        markerId: const MarkerId('user'),
        position: _userLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: const InfoWindow(title: 'Abdul', snippet: '2 sec ago'),
      ),
      Marker(
        markerId: const MarkerId('car'),
        position: _carLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: const InfoWindow(title: 'Vehicle', snippet: '40 km/h'),
      ),
      Marker(
        markerId: const MarkerId('mall'),
        position: _mallLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: const InfoWindow(title: 'City Center Mall'),
      ),
      Marker(
        markerId: const MarkerId('park'),
        position: _parkLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: const InfoWindow(title: 'Green Park'),
      ),
      Marker(
        markerId: const MarkerId('hospital'),
        position: _hospitalLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: const InfoWindow(title: 'Sunrise Hospital'),
      ),
      Marker(
        markerId: const MarkerId('lake_park'),
        position: _lakeParkLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: const InfoWindow(title: 'Lake View Park'),
      ),
    };
  }

  void _recenterMap() {
    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(_userLocation, 15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            _buildUserInfoCard(),
            SizedBox(height: 10.h),
            Expanded(child: _buildMapSection()),
            _buildAddressBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_new_rounded,
                size: 18.sp, color: const Color(0xFF1F2937)),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Live Tracking',
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
            width: 34.w,
            height: 34.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Icon(Icons.refresh_rounded,
                size: 18.sp, color: const Color(0xFF1F2937)),
          ),
          SizedBox(width: 8.w),
          Container(
            width: 34.w,
            height: 34.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Icon(Icons.more_vert_rounded,
                size: 18.sp, color: const Color(0xFF1F2937)),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFF3F4F6)),
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
          Stack(
            children: [
              CircleAvatar(
                radius: 26.r,
                backgroundImage: const NetworkImage(
                    'https://i.pravatar.cc/150?img=12'),
              ),
              Positioned(
                bottom: 0,
                right: 2.w,
                child: Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Abdul',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                    color: const Color(0xFF1F2937),
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    _buildBatteryIcon(85),
                    SizedBox(width: 4.w),
                    Text(
                      '85%',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Icon(Icons.speed_rounded,
                        size: 14.sp, color: const Color(0xFF6B7280)),
                    SizedBox(width: 4.w),
                    Text(
                      '40 km/h',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.access_time_rounded,
                        size: 12.sp, color: const Color(0xFF6B7280)),
                    SizedBox(width: 4.w),
                    Text(
                      'Last updated ',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontFamily: 'Inter',
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                    Text(
                      '2 sec ago',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2563EB),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.turn_right_rounded,
                    size: 14.sp, color: const Color(0xFF2563EB)),
                SizedBox(width: 4.w),
                Text(
                  'Directions',
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
        ],
      ),
    );
  }

  Widget _buildBatteryIcon(int percent) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: 22.w,
          height: 11.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.r),
            border: Border.all(color: const Color(0xFF10B981), width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percent / 100,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981),
                  borderRadius: BorderRadius.circular(1.r),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: -3.w,
          child: Container(
            width: 2.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: const Color(0xFF10B981),
              borderRadius: BorderRadius.circular(1.r),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMapSection() {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: _userLocation,
            zoom: 15,
          ),
          onMapCreated: (controller) => _mapController = controller,
          markers: _markers,
          polylines: _polylines,
          circles: _circles,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          mapToolbarEnabled: false,
          compassEnabled: false,
        ),

        Positioned(
          top: 14.h,
          left: 14.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 7.w,
                  height: 7.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFF10B981),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  'Live',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          right: 12.w,
          bottom: 130.h,
          child: Column(
            children: [
              _mapActionButton(Icons.my_location_rounded, onTap: _recenterMap),
              SizedBox(height: 10.h),
              _mapActionButton(Icons.layers_rounded),
              SizedBox(height: 10.h),
              _mapActionButton(Icons.near_me_rounded),
            ],
          ),
        ),

        Positioned(
          left: 14.w,
          bottom: 20.h,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shield_rounded,
                    size: 15.sp, color: const Color(0xFF2563EB)),
                SizedBox(width: 6.w),
                Text(
                  'Safety',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(Icons.chevron_right_rounded,
                    size: 16.sp, color: const Color(0xFF6B7280)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _mapActionButton(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42.w,
        height: 42.w,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 20.sp, color: const Color(0xFF2563EB)),
      ),
    );
  }

  Widget _buildAddressBar() {
    return Container(
      margin: EdgeInsets.all(14.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFE5E7EB)),
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
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.location_on_rounded,
                color: const Color(0xFF2563EB), size: 18.sp),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              '248, Maple Street, Green Valley,\nNew York, USA',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1F2937),
                height: 1.4,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.share_rounded,
                    size: 13.sp, color: const Color(0xFF2563EB)),
                SizedBox(width: 5.w),
                Text(
                  'Share Location',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2563EB),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}