import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/data/models/GroupModel.dart';
import 'package:kinguard/features/Group/providers/createGroupProvider.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final TextEditingController _nameController = TextEditingController(
    text: 'My Family',
  );
  final formKey = GlobalKey<FormState>();
  final List<GroupTypeModel> groupTypes = [
    GroupTypeModel(
      title: 'Family',
      subtitle: 'For family members and loved ones',
      icon: Icons.home_rounded,
      iconColor: const Color(0xFF3B82F6),
      bgColor: const Color(0xFFDDE7FF),
    ),
    GroupTypeModel(
      title: 'Friends',
      subtitle: 'For friends and close connections',
      icon: Icons.people_alt_rounded,
      iconColor: const Color(0xFF10B981),
      bgColor: const Color(0xFFD1FAE5),
    ),
    GroupTypeModel(
      title: 'Emergency',
      subtitle: 'For emergency and safety purposes',
      icon: Icons.shield_rounded,
      iconColor: const Color(0xFFEF4444),
      bgColor: const Color(0xFFFEE2E2),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            const Divider(height: 1, color: Color(0xFFF3F4F6)),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle('Group Image', 'Choose a group image'),
                      SizedBox(height: 16.h),
                      Center(child: _buildGroupImagePicker()),
                      SizedBox(height: 28.h),

                      _buildSectionTitle(
                        'Group Name',
                        'Enter a name for your group',
                      ),
                      SizedBox(height: 12.h),
                      _buildNameField(),
                      SizedBox(height: 28.h),

                      _buildSectionTitle(
                        'Choose Group Type (Optional)',
                        'Select a type that best describes your group',
                      ),
                      SizedBox(height: 14.h),

                      ...List.generate(groupTypes.length, (index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: _buildTypeOption(groupTypes[index], index),
                        );
                      }),

                      SizedBox(height: 20.h),

                      _buildCreateButton(),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20.sp,
                color: const Color(0xFF1F2937),
              ),
            ),
          ),
          Text(
            'Create Group',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: const Color(0xFF1F2937),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
            color: const Color(0xFF1F2937),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'Inter',
            color: const Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }

  Widget _buildGroupImagePicker() {
    return SizedBox(
      width: 120.w,
      height: 120.w,
      child: Stack(
        children: [
          Container(
            width: 120.w,
            height: 120.w,
            decoration: const BoxDecoration(
              color: Color(0xFFEEF2FF),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.people_alt_rounded,
              size: 55.sp,
              color: const Color(0xFF6366F1),
            ),
          ),
          Positioned(
            bottom: 4.w,
            right: 4.w,
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: const Color(0xFF3B82F6),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Icon(
                Icons.camera_alt_rounded,
                size: 15.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      cursorColor: const Color(0xFF3B82F6),

      style: TextStyle(
        fontSize: 14.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1F2937),
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.r)),
        ),

        prefixIcon: Icon(
          Icons.people_alt_rounded,
          color: const Color(0xFF3B82F6),
          size: 18.sp,
        ),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        hintText: 'Enter group name',
        hintStyle: TextStyle(color: const Color(0xFF9CA3AF), fontSize: 14.sp),
      ),
      validator: (value) {
        if (value == null) {
          return null;
        } else {
          return "Group Name is required";
        }
      },
    );
  }

  Widget _buildTypeOption(GroupTypeModel type, int index) {
    return Consumer(
      builder: (context, ref, child) {
        final isSelected = ref.watch(
          createGroupProvider.select((state) => state.selectedIndex == index),
        );

        print("=============isSelected;${isSelected}");
        return GestureDetector(
          onTap: () {
            final stateProvider = ref.read(createGroupProvider.notifier);
            // stateProvider.selectType(type.title);
            stateProvider.state = stateProvider.state.copyWith(
              selectedIndex: index,
              groupType: type.title,
            );
          },

          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFF5F8FF) : Colors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF3B82F6)
                    : const Color(0xFFE5E7EB),
                width: 1.2,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 42.w,
                  height: 42.w,
                  decoration: BoxDecoration(
                    color: type.bgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(type.icon, color: type.iconColor, size: 20.sp),
                ),
                SizedBox(width: 12.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        type.title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                          color: isSelected
                              ? const Color(0xFF3B82F6)
                              : const Color(0xFF1F2937),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        type.subtitle,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: 'Inter',
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF3B82F6)
                          : const Color(0xFFD1D5DB),
                      width: 1.5,
                    ),
                    color: isSelected ? const Color(0xFF3B82F6) : Colors.white,
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 8.w,
                            height: 8.w,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCreateButton() {
    return Consumer(
      builder: (context, ref, child) => SizedBox(
        width: double.infinity,
        height: 52.h,
        child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {}
            var groupName = ref.watch(createGroupProvider).groupType;
            print("====GroupName:${groupName}");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2563EB),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_rounded, color: Colors.white, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                'Create',
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
    );
  }
}
