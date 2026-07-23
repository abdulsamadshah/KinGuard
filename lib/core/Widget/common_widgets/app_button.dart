import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/gen/fonts.gen.dart';

import '../../theme/app_colors.dart';

class ReausableButton extends StatelessWidget {
  final void Function()? ontap;
  final String? title;
  final int width;
  final int height;
  final Color textColor;
  final double borderRadius;
  final List<Color>? colors;
  final bool enable;
  final int buttonfontsize;
  final bool isLoading;

  const ReausableButton({
    super.key,
    this.ontap,
    this.title,
    this.width = 320,
    this.height = 55,
    this.textColor = Colors.white,
    this.borderRadius = 7,
    this.colors,
    this.enable = true,
    this.buttonfontsize = 18,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enable == false ? null : ontap,

      child: Container(
        height: height.h,

        width: width.w,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.sp),

          gradient: enable == false
              ? LinearGradient(
                  colors: [Colors.grey.shade300, Colors.grey.shade300],
                )
              : LinearGradient(
                  colors: AppColors.kBrandGradient,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
          boxShadow: enable == true
              ? [
                  BoxShadow(
                    color: const Color(0xffE12AFB).withOpacity(0.35),
                    blurRadius: 16,
                    offset: Offset(0, 8),
                  ),
                ]
              : null,
        ),

        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
                  "$title",

                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: buttonfontsize.sp,
                    fontFamily: FontFamily.interSemiBold,
                    color: textColor,
                  ),
                ),
        ),
      ),
    );
  }
}
