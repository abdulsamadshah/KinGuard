import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/features/Group/services/createGroupServices.dart';
import '../state/createGroupState.dart';

class createGroupController extends StateNotifier<CreateGroupState> {
  createGroupController(this.ref) : super(CreateGroupState());

  final Ref ref;

  void selectType({required int index, required String type}) {
    state = state.copyWith(selectedIndex: index, groupType: type);
  }

  void setImage(String path) {
    state = state.copyWith(imagePath: path);
  }

  void setGroupName(String name) {
    state = state.copyWith(groupName: name);
  }

  void clearImage() {
    state = state.copyWith(clearImage: true);
  }

  Future<bool> createGroup() async {
    try {
      state = state.copyWith(
        isSubmitting: true,
        clearError: true,
        isSuccess: false,
      );

      final response = await CreateGroupServices.createGroup(
        groupName: state.groupName,
        groupType: state.groupType,
        imagePath: state.imagePath,
      );

      if (response['status'] == true) {
        state = state.copyWith(isSubmitting: false, isSuccess: true);
        return true;
      } else {
        state = state.copyWith(
          isSubmitting: false,
          errorMessage: response['message'] ?? 'Failed to create group',
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(isSubmitting: false, errorMessage: e.toString());
      return false;
    }
  }

  void resetState() {
    state = CreateGroupState();
  }
}
