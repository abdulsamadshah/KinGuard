class UserGroupsRes {
  bool? status;
  String? message;
  List<UserGroup>? data;

  UserGroupsRes({this.status, this.message, this.data});

  UserGroupsRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <UserGroup>[];
      json['data'].forEach((v) {
        data!.add(UserGroup.fromJson(v));
      });
    }
  }
}

class UserGroup {
  int? groupId;
  String? groupImage;
  String? groupName;
  String? groupType;
  int? createdBy;
  bool? isActive;
  GroupCreator? creator;

  UserGroup({
    this.groupId,
    this.groupImage,
    this.groupName,
    this.groupType,
    this.createdBy,
    this.isActive,
    this.creator,
  });

  UserGroup.fromJson(Map<String, dynamic> json) {
    groupId = json['GroupId'];
    groupImage = json['GroupImage'];
    groupName = json['GroupName'];
    groupType = json['GroupType'];
    createdBy = json['CreatedBy'];
    isActive = json['IsActive'];
    creator = json['creator'] != null
        ? GroupCreator.fromJson(json['creator'])
        : null;
  }
}

class GroupCreator {
  int? userId;
  String? name;
  String? profileImage;

  GroupCreator({this.userId, this.name, this.profileImage});

  GroupCreator.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    name = json['Name'];
    profileImage = json['ProfileImage'];
  }
}