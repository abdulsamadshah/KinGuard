class UserProfile {
  bool? status;
  String? message;
  UserData? data;

  UserProfile({this.status, this.message, this.data});

  UserProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  int? userId;
  String? profileImage;
  String? name;
  String? mobileNo;
  String? gender;
  String? deviceId;

  UserData(
      {this.userId,
        this.profileImage,
        this.name,
        this.mobileNo,
        this.gender,
        this.deviceId});

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    profileImage = json['ProfileImage'];
    name = json['Name'];
    mobileNo = json['MobileNo'];
    gender = json['Gender'];
    deviceId = json['Device_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['ProfileImage'] = profileImage;
    data['Name'] = name;
    data['MobileNo'] = mobileNo;
    data['Gender'] = gender;
    data['Device_Id'] = deviceId;
    return data;
  }
}
