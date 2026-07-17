import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/gen/fonts.gen.dart';

import '../../theme/app_colors.dart';

class ReausableButton extends StatelessWidget {
  final void Function()? ontap;
  final String? title;
  final int width;
  final int height;
  final Color textcolor;
  final double borderradiues;
  final List<Color>? colors;
  final bool enable;
  final int buttonfontsize;

  const ReausableButton({
    super.key,
    this.ontap,
    this.title,
    this.width = 320,
    this.height = 50,
    this.textcolor = Colors.white,
    this.borderradiues = 30,
    this.colors,
    this.enable = true,
    this.buttonfontsize = 18,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColors = colors ?? [AppColors.primary, AppColors.secondary];

    return GestureDetector(
      onTap: enable == false ? null : ontap,

      child: Container(
        height: height.h,

        width: width.w,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderradiues.r),

          gradient: enable == false
              ? LinearGradient(
                  colors: [Colors.grey.shade300, Colors.grey.shade300],
                )
              : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: buttonColors,
                ),
        ),

        child: Center(
          child: Text(
            "$title",

            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: buttonfontsize.sp,
              fontFamily: FontFamily.interSemiBold,
              color: textcolor,
            ),
          ),
        ),
      ),
    );
  }
}
