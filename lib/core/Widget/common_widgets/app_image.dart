import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppImage extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final BoxFit fit;
  final double borderRadius;
  final bool isNetwork;
  final bool isSvg;
  final bool showLoader;
  final Color color;

  const AppImage({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius = 8,
    this.isNetwork = false,
    this.isSvg = false,
    this.showLoader = true,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (isNetwork) {
      imageWidget = CachedNetworkImage(
        imageUrl: path,
        fit: fit,
        placeholder: (_, __) => showLoader
            ? const Center(child: CircularProgressIndicator())
            : const SizedBox(),
        errorWidget: (_, __, ___) => const Icon(Icons.broken_image),
      );
    } else if (isSvg) {
      imageWidget = SvgPicture.asset(
        path,
        fit: fit,
        color: color,
        height: height?.h,
        width: width?.w,
      );
    } else {
      imageWidget = Image.asset(
        path,
        fit: fit,
        color: color,
        width: width?.w,
        height: height?.h,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: SizedBox(height: height?.h, width: width?.w, child: imageWidget),
    );
  }
}

class AppEmpty extends StatelessWidget {
  final String image;
  final String? title;

  const AppEmpty({super.key, required this.image, this.title});

  @override
  Widget build(BuildContext context) {
    final isSvg = image.endsWith('.svg');

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppImage(path: image, height: 120, width: 120, isSvg: isSvg),
          if (title != null) ...[
            SizedBox(height: 12.h),
            Text(
              title!,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          ],
        ],
      ),
    );
  }
}

class AppIcon extends StatelessWidget {
  final String icon;
  final double size;

  const AppIcon({super.key, required this.icon, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return AppImage(
      path: icon,
      height: size,
      width: size,
      isSvg: true,
      borderRadius: 0,
    );
  }
}
