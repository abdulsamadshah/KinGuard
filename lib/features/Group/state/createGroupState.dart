class CreateGroupState {
  int selectedIndex;
  String groupType;
  CreateGroupState({this.selectedIndex = 0, this.groupType = "Family"});

  CreateGroupState copyWith({int? selectedIndex, String? groupType}) {
    return CreateGroupState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      groupType: groupType ?? this.groupType,
    );
  }
}
