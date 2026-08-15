import 'package:kinguard/data/models/user-profile.dart';

class ProfileState {
  final bool isLoading;
  final bool isLogOutLoading;
  final UserData? userData;
  final String? errorMessage;

  ProfileState({
    this.isLoading = false,
    this.isLogOutLoading = false,
    this.userData,
    this.errorMessage,
  });

  ProfileState copyWith({
    bool? isLoading,
    bool? isLogOutLoading,
    UserData? userData,
    String? errorMessage,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      isLogOutLoading: isLogOutLoading ?? this.isLogOutLoading,
      userData: userData ?? this.userData,
      errorMessage: errorMessage,
    );
  }
}
