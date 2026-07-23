import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/core/constants/asset_res.dart';
import 'package:kinguard/core/theme/app_colors.dart';
import 'package:kinguard/core/utils/device_helper.dart';
import 'package:kinguard/core/utils/validator.dart';
import 'package:kinguard/features/auth/providers/login_provider.dart';
import 'package:kinguard/gen/fonts.gen.dart';

const double _kDesignWidth = 375;

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _countryCodeController = TextEditingController(
    text: '+91',
  );
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _countryCodeController.dispose();
    _phoneController.dispose();
    super.dispose();
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
    final loginState = ref.watch(loginControllerProvider);
    final loginNotifier = ref.read(loginControllerProvider.notifier);

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
                  child: Form(
                    key: _formKey,
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
                              TextSpan(text: 'Welcome to '),
                              TextSpan(
                                text: 'KinGuard',
                                style: TextStyle(color: Color(0xff8E51FF)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: s(8)),
                        Text(
                          'Stay connect with loved ones.',
                          style: TextStyle(
                            fontSize: s(14),
                            color: Colors.grey.shade500,
                          ),
                        ),
                        SizedBox(height: s(32)),
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                width: s(64),
                                child: TextField(
                                  enabled: false,
                                  controller: _countryCodeController,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(
                                    fontSize: s(15),
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff1A1A2E),
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: s(14),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(s(6)),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(s(7)),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(s(7)),
                                      borderSide: const BorderSide(
                                        color: Color(0xff8E51FF),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: s(12)),
                              Expanded(
                                child: TextFormField(
                                  controller: _phoneController,
                                  validator: (value) =>
                                      Validator.validatePhone(value),
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(
                                    fontSize: s(18),
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff1A1A2E),
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: s(14),
                                      horizontal: s(16),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Enter Mobile Number",
                                    hintStyle: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: FontFamily.interMedium,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(s(7)),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(s(7)),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(s(7)),
                                      borderSide: const BorderSide(
                                        color: Color(0xff8E51FF),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: s(68)),
                        SizedBox(
                          width: double.infinity,
                          height: s(54),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(s(7)),
                              gradient: const LinearGradient(
                                colors: AppColors.kBrandGradient,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xffE12AFB,
                                  ).withOpacity(0.35),
                                  blurRadius: s(16),
                                  offset: Offset(0, s(8)),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(s(14)),
                                onTap: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    final fullPhone = _phoneController.text;
                                    loginNotifier.sendOtp(
                                      fullPhone,
                                      _countryCodeController.text,
                                    );
                                  }
                                },
                                child: Center(
                                  child: loginState.isLoading
                                      ? const SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2.5,
                                          ),
                                        )
                                      : Text(
                                          'Send OTP',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: s(16),
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.3,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
