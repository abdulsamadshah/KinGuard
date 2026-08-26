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
        data!.add(new MemberData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberData {
  int? memberId;
  int? groupId;
  int? userId;
  String? role;
  String? status;
  int? batteryLevel;
  bool? isLocationSharing;
  String? name;
  String? mobileNo;
  String? profileImage;
  dynamic? location;

  MemberData({
    this.memberId,
    this.groupId,
    this.userId,
    this.role,
    this.status,
    this.batteryLevel,
    this.isLocationSharing,
    this.name,
    this.mobileNo,
    this.profileImage,
    this.location,
  });

  MemberData.fromJson(Map<String, dynamic> json) {
    memberId = json['MemberId'];
    groupId = json['GroupId'];
    userId = json['UserId'];
    role = json['Role'];
    status = json['Status'];
    batteryLevel = json['BatteryLevel'];
    isLocationSharing = json['IsLocationSharing'];
    name = json['Name'];
    mobileNo = json['MobileNo'];
    profileImage = json['ProfileImage'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MemberId'] = this.memberId;
    data['GroupId'] = this.groupId;
    data['UserId'] = this.userId;
    data['Role'] = this.role;
    data['Status'] = this.status;
    data['BatteryLevel'] = this.batteryLevel;
    data['IsLocationSharing'] = this.isLocationSharing;
    data['Name'] = this.name;
    data['MobileNo'] = this.mobileNo;
    data['ProfileImage'] = this.profileImage;
    data['location'] = this.location;
    return data;
  }
}
