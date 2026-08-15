import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/core/network/logoutuser.dart';
import 'package:kinguard/core/values/Utils.dart';
import 'package:kinguard/features/profile/services/profile_services.dart';
import 'package:kinguard/features/profile/state/profileState.dart';

class ProfileController extends StateNotifier<ProfileState> {
  ProfileController(this.ref) : super(ProfileState()) {
    getUserProfile();
  }

  final Ref ref;

  Future<void> getUserProfile() async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);

      final profile = await ProfileServices.getUserProfileData();

      state = state.copyWith(isLoading: false, userData: profile.data);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> logOut() async {
    try {
      state = state.copyWith(isLogOutLoading: true, errorMessage: null);

      final result = await ProfileServices.logOut();

      if (result.status == true) {
        state = state.copyWith(isLogOutLoading: false);
        LogoutUser().logout();
      } else {
        state = state.copyWith(isLogOutLoading: false);
        Utils.flutterToast(result.message.toString());
      }
    } catch (e) {
      state = state.copyWith(isLogOutLoading: false);
      Utils.flutterToast(e.toString());
    }
  }

  Future<void> refreshProfile() async {
    await getUserProfile();
  }
}
