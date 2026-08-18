class CreateGroupState {
  final int selectedIndex;
  final String groupType;
  final String? imagePath;
  final String groupName;
  final bool isSubmitting;
  final String? errorMessage;
  final bool isSuccess;

  CreateGroupState({
    this.selectedIndex = 0,
    this.groupType = "Family",
    this.imagePath,
    this.groupName = "My Family",
    this.isSubmitting = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  CreateGroupState copyWith({
    int? selectedIndex,
    String? groupType,
    String? imagePath,
    String? groupName,
    bool? isSubmitting,
    String? errorMessage,
    bool? isSuccess,
    bool clearImage = false,
    bool clearError = false,
  }) {
    return CreateGroupState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      groupType: groupType ?? this.groupType,
      imagePath: clearImage ? null : (imagePath ?? this.imagePath),
      groupName: groupName ?? this.groupName,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}