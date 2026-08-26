import 'package:flutter/cupertino.dart';

class GroupRes {
  bool? status;
  String? message;
  List<GroupData>? data;

  GroupRes({this.status, this.message, this.data});

  GroupRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GroupData>[];
      json['data'].forEach((v) {
        data!.add(GroupData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroupData {
  int? groupId;
  String? groupImage;
  String? groupName;
  String? groupType;
  int? createdBy;
  bool? isActive;
  int? totalMembers;
  Creator? creator;

  GroupData({
    this.groupId,
    this.groupImage,
    this.groupName,
    this.groupType,
    this.createdBy,
    this.isActive,
    this.creator,
    this.totalMembers
  });

  GroupData.fromJson(Map<String, dynamic> json) {
    groupId = json['GroupId'];
    groupImage = json['GroupImage'];
    groupName = json['GroupName'];
    groupType = json['GroupType'];
    createdBy = json['CreatedBy'];
    isActive = json['IsActive'];
    totalMembers = json['TotalMembers'];
    creator = json['creator'] != null
        ? Creator.fromJson(json['creator'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['GroupId'] = groupId;
    data['GroupImage'] = groupImage;
    data['GroupName'] = groupName;
    data['GroupType'] = groupType;
    data['CreatedBy'] = createdBy;
    data['IsActive'] = isActive;
    data['TotalMembers'] = totalMembers;
    if (creator != null) {
      data['creator'] = creator!.toJson();
    }
    return data;
  }
}

class Creator {
  int? userId;
  String? name;
  String? profileImage;

  Creator({this.userId, this.name, this.profileImage});

  Creator.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    name = json['Name'];
    profileImage = json['ProfileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['Name'] = name;
    data['ProfileImage'] = profileImage;
    return data;
  }
}

class GroupTypeModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;

  GroupTypeModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
  });
}
