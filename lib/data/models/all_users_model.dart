class AllUsersRes {
  bool? status;
  String? message;
  List<UserItem>? userData;

  AllUsersRes({this.status, this.message, this.userData});

  AllUsersRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['UserData'] != null) {
      userData = <UserItem>[];
      json['UserData'].forEach((v) {
        userData!.add(UserItem.fromJson(v));
      });
    }
  }
}

class UserItem {
  int? userId;
  String? profileImage;
  String? name;
  String? mobileNo;
  String? contactName; // matched contact name from phone

  UserItem({
    this.userId,
    this.profileImage,
    this.name,
    this.mobileNo,
    this.contactName,
  });

  UserItem.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    profileImage = json['ProfileImage'];
    name = json['Name'];
    mobileNo = json['MobileNo'];
  }

  UserItem copyWith({String? contactName}) {
    return UserItem(
      userId: userId,
      profileImage: profileImage,
      name: name,
      mobileNo: mobileNo,
      contactName: contactName ?? this.contactName,
    );
  }
}