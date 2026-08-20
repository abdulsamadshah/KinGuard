import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/core/network/Constant.dart';
import 'package:kinguard/data/models/all_users_model.dart';
import 'package:kinguard/features/Group/providers/join_member_provider.dart';

class SelectGroupBottomSheet extends ConsumerStatefulWidget {
  final UserItem user;
  final Function(bool success, int? groupId, String? groupName) onDone;

  const SelectGroupBottomSheet({
    super.key,
    required this.user,
    required this.onDone,
  });

  static Future<void> show(
      BuildContext context, {
        required UserItem user,
        required Function(bool success, int? groupId, String? groupName) onDone,
      }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => SelectGroupBottomSheet(user: user, onDone: onDone),
    );
  }

  @override
  ConsumerState<SelectGroupBottomSheet> createState() =>
      _SelectGroupBottomSheetState();
}

class _SelectGroupBottomSheetState
    extends ConsumerState<SelectGroupBottomSheet> {
  int? _selectedGroupId;
  String? _selectedGroupName;
  bool _isSubmitting = false;

  String? _buildImageUrl(String? path) {
    if (path == null || path.isEmpty) return null;
    if (path.startsWith('http')) return path;
    if (path.startsWith('uploads/')) {
      return '${ConstRes.aImageBaseUrl}$path';
    }
    return '${ConstRes.aImageBaseUrl}$path';
  }

  Future<void> _handleSubmit() async {
    if (_selectedGroupId == null) return;

    setState(() => _isSubmitting = true);

    final success =
    await ref.read(joinMemberProvider.notifier).addMemberToGroup(
      userId: widget.user.userId!,
      groupId: _selectedGroupId!,
    );

    if (!mounted) return;

    Navigator.pop(context);
    widget.onDone(success, _selectedGroupId, _selectedGroupName);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(joinMemberProvider);
    final groups = state.userGroups ?? [];
    final alreadyIn =
        state.userAddedGroups[widget.user.userId] ?? <int>{};

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      padding: EdgeInsets.only(
        top: 8.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Grabber
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: const Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 14.h),

          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Text(
                  'Select Group',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Add ${widget.user.contactName ?? widget.user.name ?? "user"} to a group',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          const Divider(height: 1, color: Color(0xFFF3F4F6)),

          // Group list
          Flexible(
            child: groups.isEmpty
                ? _buildEmpty()
                : ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.all(16.w),
              itemCount: groups.length,
              separatorBuilder: (_, __) => SizedBox(height: 8.h),
              itemBuilder: (context, index) {
                final group = groups[index];
                final isSelected = _selectedGroupId == group.groupId;
                final isAlreadyIn =
                alreadyIn.contains(group.groupId);
                final img = _buildImageUrl(group.groupImage);

                return GestureDetector(
                  onTap: isAlreadyIn
                      ? null
                      : () {
                    setState(() {
                      _selectedGroupId = group.groupId;
                      _selectedGroupName = group.groupName;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFF5F8FF)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
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
                            color: const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(11.r),
                            image: img != null
                                ? DecorationImage(
                              image: NetworkImage(img),
                              fit: BoxFit.cover,
                            )
                                : null,
                          ),
                          child: img == null
                              ? Icon(
                            Icons.groups_rounded,
                            color: const Color(0xFF6366F1),
                            size: 22.sp,
                          )
                              : null,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                group.groupName ?? 'Group',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF1F2937),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                group.groupType ?? 'Family',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: 'Inter',
                                  color: const Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isAlreadyIn)
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD1FAE5),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.check_rounded,
                                    size: 12.sp,
                                    color: const Color(0xFF10B981)),
                                SizedBox(width: 3.w),
                                Text(
                                  'Added',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF10B981),
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
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
                              color: isSelected
                                  ? const Color(0xFF3B82F6)
                                  : Colors.white,
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
            ),
          ),

          // Submit button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: (_selectedGroupId == null || _isSubmitting)
                    ? null
                    : _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  disabledBackgroundColor: const Color(0xFF93C5FD),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: _isSubmitting
                    ? SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
                    : Text(
                  'Add to Group',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmpty() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
      child: Column(
        children: [
          Icon(Icons.groups_outlined,
              size: 50.sp, color: const Color(0xFF9CA3AF)),
          SizedBox(height: 10.h),
          Text(
            'No groups yet',
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Create a group first to add members',
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: 'Inter',
              color: const Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }
}