class AddMemberRes {
  bool? status;
  String? message;
  MemberData? data;

  AddMemberRes({this.status, this.message, this.data});

  AddMemberRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? MemberData.fromJson(json['data']) : null;
  }
}

class GetMembersRes {
  bool? status;
  String? message;
  List<MemberData>? data;

  GetMembersRes({this.status, this.message, this.data});

  GetMembersRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MemberData>[];
      json['data'].forEach((v) {
        data!.add(MemberData.fromJson(v));
      });
    }
  }
}

class MemberData {
  int? memberId;
  int? groupId;
  int? userId;
  String? role;
  String? status;

  MemberData({this.memberId, this.groupId, this.userId, this.role, this.status});

  MemberData.fromJson(Map<String, dynamic> json) {
    memberId = json['MemberId'];
    groupId = json['GroupId'];
    userId = json['UserId'];
    role = json['Role'];
    status = json['Status'];
  }
}