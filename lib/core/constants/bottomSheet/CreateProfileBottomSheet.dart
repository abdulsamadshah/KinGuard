import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/core/Widget/common_widgets/app_button.dart';
import 'package:kinguard/core/constants/bottomSheet/selectFileBottomSheet.dart';
import 'package:kinguard/core/values/utility.dart';
import 'package:kinguard/features/auth/providers/verify_provider.dart';
import 'package:kinguard/gen/fonts.gen.dart';

class CreateProfileBottomSheet extends StatelessWidget {
  const CreateProfileBottomSheet({super.key});

  static Future<void> show(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      isDismissible: false,
      builder: (context) => const CreateProfileBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _CreateProfileBottomSheetContent();
  }
}

class _CreateProfileBottomSheetContent extends ConsumerStatefulWidget {
  const _CreateProfileBottomSheetContent();

  @override
  ConsumerState<_CreateProfileBottomSheetContent> createState() =>
      _CreateProfileBottomSheetContentState();
}

class _CreateProfileBottomSheetContentState
    extends ConsumerState<_CreateProfileBottomSheetContent> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: EdgeInsets.only(
        top: 20.h,
        left: 24.w,
        right: 24.w,
        bottom: bottomPadding + 32.h,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 5.h,
                margin: EdgeInsets.only(bottom: 24.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Create Your Profile',
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff1A1A2E),
                  fontFamily: FontFamily.interBold,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Complete your profile to get started',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.grey.shade600,
                  fontFamily: FontFamily.interMedium,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 40.h),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return GestureDetector(
                    onTap: () {
                      ModalImage bottomNavbar = ModalImage(
                        isImageCroppable: true,
                        onImageSelect: (path) async {
                          if (Utility.isNotNullEmptyOrFalse(path)) {
                            Navigator.pop(context);
                            ref
                                .read(verifyControllerProvider.notifier)
                                .profileImage(imagePath: path);
                          }
                        },
                      );
                      bottomNavbar.mainBottomSheet(context);
                    },

                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xff8E51FF).withOpacity(0.3),
                              width: 4,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 72.r,
                            backgroundColor: Colors.grey.shade100,
                            backgroundImage:
                                ref
                                        .watch(verifyControllerProvider)
                                        .profileImage !=
                                    null
                                ? FileImage(
                                    File(
                                      ref
                                          .watch(verifyControllerProvider)
                                          .profileImage!,
                                    ),
                                  )
                                : null,
                            child:
                                Utility.isNullEmptyOrFalse(
                                  ref
                                      .watch(verifyControllerProvider)
                                      .profileImage,
                                )
                                ? Icon(
                                    Icons.person,
                                    size: 85.r,
                                    color: Colors.grey.shade400,
                                  )
                                : SizedBox(),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: const BoxDecoration(
                              color: Color(0xff8E51FF),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              size: 22.r,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 32.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff1A1A2E),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _nameController,
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Please enter your full name'
                    : null,

                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'Enter your full name',
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.grey.shade500,
                    size: 22,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(
                      color: Color(0xff8E51FF),
                      width: 1.8,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 20.w,
                  ),
                ),
              ),
              SizedBox(height: 48.h),

              ReausableButton(
                title: "Continue",
                ontap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ref
                        .read(verifyControllerProvider.notifier)
                        .register(userName: _nameController.text);

                    Navigator.pop(context);
                  }
                },
                isLoading:
                    ref.watch(verifyControllerProvider).isLoadingRegister ??
                    false,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
