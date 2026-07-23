class VerifyState {
  bool? loading;
  String? profileImage;
  bool? isLoadingRegister;
  VerifyState({this.loading, this.profileImage, this.isLoadingRegister});

  VerifyState copyWith({
    bool? loading,
    String? profileImage,
    bool? isLoadingRegister,
  }) {
    return VerifyState(
      loading: loading ?? this.loading,
      profileImage: profileImage ?? this.profileImage,

      isLoadingRegister: isLoadingRegister ?? this.isLoadingRegister,
    );
  }
}
