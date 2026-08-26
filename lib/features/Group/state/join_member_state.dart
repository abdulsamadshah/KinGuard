import 'package:kinguard/data/models/all_users_model.dart';
import 'package:kinguard/data/models/user_groups_model.dart';




class JoinMemberState {
  final List<UserItem>? matchedUsers;
  final List<UserItem>? filteredUsers;
  final List<UserGroup>? userGroups;
  final String searchQuery;
  final String? errorMessage;
  final Set<int> invitingUserIds;

  final Map<int, Set<int>> userAddedGroups;

  final bool contactPermissionDenied;

  JoinMemberState({
    this.matchedUsers,
    this.filteredUsers,
    this.userGroups,
    this.searchQuery = '',
    this.errorMessage,
    this.invitingUserIds = const {},
    this.userAddedGroups = const {},
    this.contactPermissionDenied = false,
  });

  JoinMemberState copyWith({
    List<UserItem>? matchedUsers,
    List<UserItem>? filteredUsers,
    List<UserGroup>? userGroups,
    String? searchQuery,
    String? errorMessage,
    Set<int>? invitingUserIds,
    Map<int, Set<int>>? userAddedGroups,
    bool? contactPermissionDenied,
    bool clearError = false,
  }) {
    return JoinMemberState(
      matchedUsers: matchedUsers ?? this.matchedUsers,
      filteredUsers: filteredUsers ?? this.filteredUsers,
      userGroups: userGroups ?? this.userGroups,
      searchQuery: searchQuery ?? this.searchQuery,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      invitingUserIds: invitingUserIds ?? this.invitingUserIds,
      userAddedGroups: userAddedGroups ?? this.userAddedGroups,
      contactPermissionDenied:
      contactPermissionDenied ?? this.contactPermissionDenied,
    );
  }

  bool isUserAddedToAnyGroup(int userId) {
    final set = userAddedGroups[userId];
    return set != null && set.isNotEmpty;
  }
}