import 'package:kinguard/data/models/GroupModel.dart';

class HomeState {
  final int selectedIndex;
  final int selectedGroupIndex;
  final List<GroupData>? groups;
  final String? errorMessage;

  HomeState({
    this.selectedIndex = 0,
    this.selectedGroupIndex = 0,
    this.groups,
    this.errorMessage,
  });

  HomeState copyWith({
    int? selectedIndex,
    int? selectedGroupIndex,
    List<GroupData>? groups,
    String? errorMessage,
    bool clearError = false,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedGroupIndex: selectedGroupIndex ?? this.selectedGroupIndex,
      groups: groups ?? this.groups,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  GroupData? get activeGroup {
    if (groups == null || groups!.isEmpty) return null;
    if (selectedGroupIndex >= groups!.length) return groups!.first;
    return groups![selectedGroupIndex];
  }
}