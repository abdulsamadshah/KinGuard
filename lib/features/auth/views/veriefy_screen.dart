import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/core/Widget/common_widgets/app_button.dart';
import 'package:kinguard/core/constants/asset_res.dart';
import 'package:kinguard/core/theme/app_colors.dart';
import 'package:kinguard/core/utils/device_helper.dart';
import 'package:kinguard/core/values/Utils.dart';
import 'package:kinguard/core/values/utility.dart';
import 'package:kinguard/features/auth/providers/verify_provider.dart';
import 'package:kinguard/gen/fonts.gen.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

const double _kDesignWidth = 375;

class VerifyScreen extends ConsumerStatefulWidget {
  String mobileNumber;
  String countryCode;

  VerifyScreen({
    super.key,
    required this.mobileNumber,
    required this.countryCode,
  });

  @override
  ConsumerState<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends ConsumerState<VerifyScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    otpController.dispose();
  }

  double s(double value) => DeviceHelper.widthPercent(value / _kDesignWidth);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    final double topPadding = DeviceHelper.statusBarHeight(context);
    final loginState = ref.watch(verifyControllerProvider);
    final verifyOtpNotifier = ref.read(verifyControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: topPadding + s(16), bottom: s(100)),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.kBrandGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: CircleAvatar(
                radius: s(90),
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(s(100)),
                  child: Padding(
                    padding: EdgeInsets.all(s(18)),
                    child: Image.asset(Assets.appIcon, fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Transform.translate(
              offset: Offset(0, -s(22)),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(s(28)),
                    topRight: Radius.circular(s(28)),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(s(24), s(36), s(24), s(24)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: s(24),
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff1A1A2E),
                          ),
                          children: const [
                            TextSpan(text: 'Verify your phone number'),
                            TextSpan(
                              text: '',
                              style: TextStyle(color: Color(0xff8E51FF)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: s(10)),
                      Text(
                        'We have send a 4-digit OTP to',
                        style: TextStyle(
                          fontSize: s(14),
                          color: Colors.grey.shade500,
                        ),
                      ),

                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusGeometry.circular(50.sp),
                            color: Color(0xffE7E3F2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.call,
                                    size: 19.sp,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "${widget.countryCode}${widget.mobileNumber}",
                                    style: TextStyle(
                                      fontSize: s(14),
                                      color: Colors.black,
                                      fontFamily: FontFamily.interMedium,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Edit",
                                    style: TextStyle(
                                      fontSize: s(15),
                                      color: AppColors.primary,
                                      fontFamily: FontFamily.interSemiBold,
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Icon(
                                    Icons.edit,
                                    size: 19.sp,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: s(32)),
                      Center(
                        child: PinCodeTextField(
                          controller: otpController,
                          pinBoxWidth: 70.w,
                          pinBoxHeight: 65.w,
                          // pinBoxBorderWidth: 0.8,
                          pinBoxRadius: 7.r,

                          pinTextStyle: TextStyle(
                            fontSize: 27.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          defaultBorderColor: Colors.grey.shade300,
                          highlight: true,
                          hasTextBorderColor: Colors.grey.shade300,

                          pinBoxOuterPadding: EdgeInsets.all(6.sp),
                        ),
                      ),


                      SizedBox(height: s(68)),
                      ReausableButton(title: "Verify OTP",ontap: () {
                        if (Utility.isNotNullEmptyOrFalse(
                          otpController.text,
                        ) &&
                            otpController.text.length == 4) {
                          verifyOtpNotifier.verifyOtp(
                            phone: widget.mobileNumber,
                            countryCode: widget.countryCode,
                            otp: otpController.text,
                          );
                        } else {
                          Utils.flutterToast("Otp can not be empty");
                        }
                      },isLoading: loginState.loading ?? false,),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
