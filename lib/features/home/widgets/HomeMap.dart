import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kinguard/gen/fonts.gen.dart';

class HomeMapSection extends StatefulWidget {
  const HomeMapSection({super.key});

  @override
  State<HomeMapSection> createState() => _HomeMapSectionState();
}

class _HomeMapSectionState extends State<HomeMapSection> {
  GoogleMapController? mapController;

  final LatLng _center = const LatLng(19.0760, 72.8777);

  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('me'),
      position: LatLng(19.0760, 72.8777),
      infoWindow: InfoWindow(title: 'Me'),
    ),
    const Marker(
      markerId: MarkerId('mother'),
      position: LatLng(19.0850, 72.8900),
      infoWindow: InfoWindow(title: 'Mother'),
    ),
    const Marker(
      markerId: MarkerId('ayesha'),
      position: LatLng(19.0650, 72.8600),
      infoWindow: InfoWindow(title: 'Ayesha'),
    ),
    const Marker(
      markerId: MarkerId('grandpa'),
      position: LatLng(19.0950, 72.8500),
      infoWindow: InfoWindow(title: 'Grandpa'),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 280.h,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.5,
            ),
            markers: _markers,
            polylines: {
              Polyline(
                polylineId: const PolylineId('route'),
                points: const [
                  LatLng(19.0760, 72.8777),
                  LatLng(19.0850, 72.8900),
                ],
                color: Colors.blue,
                width: 4,
              ),
            },
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),
        ),

        // SOS Button
        Positioned(
          top: 20.h,
          right: 16.w,
          child: GestureDetector(
            onTap: () {
              // Handle SOS
            },
            child: Container(
              width: 64.w,
              height: 64.w,
              decoration: const BoxDecoration(
                color: Color(0xffFF3B30),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'SOS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.interBold,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Map Controls (Right Side)
        Positioned(
          bottom: 100.h,
          right: 16.w,
          child: Column(
            children: [
              _MapActionButton(icon: Icons.my_location_outlined),
              SizedBox(height: 12.h),
              _MapActionButton(icon: Icons.layers_outlined),
              SizedBox(height: 12.h),
              _MapActionButton(icon: Icons.navigation_outlined),
            ],
          ),
        ),
      ],
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
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 2)),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black87, size: 26),
        onPressed: () {},
      ),
    );
  }
}