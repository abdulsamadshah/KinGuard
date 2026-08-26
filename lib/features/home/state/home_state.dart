import 'package:kinguard/data/models/GroupModel.dart';
import 'package:kinguard/data/models/member_res.dart';

class HomeState {
  final int selectedIndex;
   Map<String,dynamic> selectedGroupDetail;
  final List<GroupData>? groups;
  final String? errorMessage;

  List<MemberData>? memberDetail;
  bool isLoadingMember;
  final String? memberErrorMessage;



  HomeState({
    this.selectedIndex = 0,
    this.selectedGroupDetail = const {},
    this.groups,
    this.errorMessage,
    this.memberDetail,
    this.isLoadingMember=false,
    this.memberErrorMessage=""
  });

  HomeState copyWith({
    int? selectedIndex,
    Map<String,dynamic>? selectedGroupDetail,
    List<GroupData>? groups,
    String? errorMessage,
    bool clearError = false,
    List<MemberData>? memberDetail,
    bool? isLoadingMember,
     String? memberErrorMessage,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
        selectedGroupDetail: selectedGroupDetail ?? this.selectedGroupDetail,
      groups: groups ?? this.groups,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      isLoadingMember: isLoadingMember ?? this.isLoadingMember,
      memberDetail: memberDetail ?? this.memberDetail,
      memberErrorMessage: memberErrorMessage ?? this.memberErrorMessage
    );
  }

  GroupData? get activeGroup {
    if (groups == null || groups!.isEmpty) return null;
    if (selectedGroupDetail['index'] >= groups!.length) return groups!.first;
    return groups![selectedGroupDetail['index']];
  }
}