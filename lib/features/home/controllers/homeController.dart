import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/features/Group/services/join_member_services.dart';
import 'package:kinguard/features/home/services/homeServices.dart';
import 'package:kinguard/features/home/state/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController(this.ref) : super(HomeState()) {
    getUserGroups();
  }

  final Ref ref;

  Future<void> getUserGroups() async {
    try {
      state = state.copyWith(clearError: true);

      final response = await HomeServices.getUserGroups();

      if (response.status == true) {
        state = state.copyWith(groups: response.data ?? []);
        selectGroup(0, int.parse(response.data![0].groupId.toString()), response.data![0].groupName.toString());


      } else {
        state = state.copyWith(
          errorMessage: response.message ?? 'Failed to load groups',
        );
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  void selectGroup(int index,int groupId,String groupName) {
    var groupDetail = {
      "index":index,
      "groupId":groupId,
      "groupName":groupName,
    };
    state = state.copyWith(selectedGroupDetail: groupDetail );
    getGroupMembersById(
      groupId:
      groupId.toString(),
    );
  }

  void selectBottomIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  Future<void> refresh() async {
    await getUserGroups();
  }

  Future<void> getGroupMembersById({required dynamic groupId}) async {
    try {
      state =  state.copyWith(isLoadingMember: true);
      final res = await JoinMemberServices.getMembers(groupId);
      state =  state.copyWith(isLoadingMember: false);
      if (res.status == true) {
       state =  state.copyWith(memberDetail: res.data);
      } else {
        state =  state.copyWith(errorMessage: res.message);
      }
    } catch (e) {
      state =  state.copyWith(isLoadingMember: false);
      state =  state.copyWith(errorMessage: e.toString());
    }
  }
}
