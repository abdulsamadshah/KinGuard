import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/core/utils/contact_helper.dart';
import 'package:kinguard/data/models/all_users_model.dart';
import 'package:kinguard/data/models/member_res.dart';
import 'package:kinguard/features/Group/services/join_member_services.dart';
import 'package:kinguard/features/Group/state/join_member_state.dart';


class JoinMemberController extends StateNotifier<JoinMemberState> {
  JoinMemberController(this.ref) : super(JoinMemberState()) {
    loadData();
  }

  final Ref ref;

  Future<void> loadData() async {
    await Future.wait([
      _loadMatchedUsers(),
      _loadUserGroups(),
    ]);
  }

  Future<void> _loadMatchedUsers() async {
    try {
      state = state.copyWith(clearError: true);

      // 1. Get device contacts
      final contactMap = await ContactHelper.getContactPhoneMap();

      if (contactMap.isEmpty) {
        state = state.copyWith(
          contactPermissionDenied: true,
          matchedUsers: [],
          filteredUsers: [],
        );
        return;
      }

      // 2. Get all users from server
      final response = await JoinMemberServices.getAllUsers();
      if (response.status != true) {
        state = state.copyWith(
          errorMessage: response.message ?? 'Failed to load users',
        );
        return;
      }

      final allUsers = response.userData ?? [];

      // 3. Match server users with device contacts
      final matched = <UserItem>[];
      for (final user in allUsers) {
        final serverPhone =
        ContactHelper.normalizeForMatch(user.mobileNo ?? '');
        if (serverPhone.isEmpty) continue;

        if (contactMap.containsKey(serverPhone)) {
          matched.add(user.copyWith(contactName: contactMap[serverPhone]));
        }
      }

      state = state.copyWith(
        matchedUsers: matched,
        filteredUsers: matched,
        contactPermissionDenied: false,
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> _loadUserGroups() async {
    try {
      final response = await JoinMemberServices.getUserGroups();
      if (response.status == true) {
        state = state.copyWith(userGroups: response.data ?? []);

        // Pre-fill userAddedGroups from existing members
        await _fetchAllGroupMembers();
      }
    } catch (_) {
      // Non-blocking
    }
  }

  Future<void> _fetchAllGroupMembers() async {
    if (state.userGroups == null) return;

    final Map<int, Set<int>> userAddedGroups = {};

    for (final group in state.userGroups!) {
      if (group.groupId == null) continue;
      try {
        final res = await JoinMemberServices.getMembers(group.groupId!);
        if (res.status == true && res.data != null) {
          for (final m in res.data!) {
            if (m.userId == null) continue;
            userAddedGroups.putIfAbsent(m.userId!, () => {})
                .add(group.groupId!);
          }
        }
      } catch (_) {}
    }

    state = state.copyWith(userAddedGroups: userAddedGroups);
  }

  void searchUsers(String query) {
    if (state.matchedUsers == null) return;

    final q = query.trim().toLowerCase();
    final list = state.matchedUsers!;

    final filtered = q.isEmpty
        ? list
        : list.where((u) {
      final name = (u.name ?? '').toLowerCase();
      final contactName = (u.contactName ?? '').toLowerCase();
      final phone = (u.mobileNo ?? '').toLowerCase();
      return name.contains(q) ||
          contactName.contains(q) ||
          phone.contains(q);
    }).toList();

    state = state.copyWith(searchQuery: query, filteredUsers: filtered);
  }

  Future<bool> addMemberToGroup({
    required int userId,
    required int groupId,
    String role = 'Member',
  }) async {
    try {
      final inviting = Set<int>.from(state.invitingUserIds)..add(userId);
      state = state.copyWith(invitingUserIds: inviting, clearError: true);

      final response = await JoinMemberServices.addMember(
        groupId: groupId,
        userId: userId,
        role: role,
      );

      final invitingAfter =
      Set<int>.from(state.invitingUserIds)..remove(userId);

      if (response.status == true) {
        final updated = Map<int, Set<int>>.from(state.userAddedGroups);
        updated.putIfAbsent(userId, () => <int>{}).add(groupId);

        state = state.copyWith(
          invitingUserIds: invitingAfter,
          userAddedGroups: updated,
        );
        return true;
      } else {
        state = state.copyWith(
          invitingUserIds: invitingAfter,
          errorMessage: response.message ?? 'Failed to add member',
        );
        return false;
      }
    } catch (e) {
      final invitingAfter =
      Set<int>.from(state.invitingUserIds)..remove(userId);
      state = state.copyWith(
        invitingUserIds: invitingAfter,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  Future<void> refresh() async {
    await loadData();
  }
}