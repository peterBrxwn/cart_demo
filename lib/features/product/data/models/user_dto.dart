class UserDto {
  int? status;
  UserData? data;

  UserDto({this.status, this.data});

  UserDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  String? id;
  String? username;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? createdAt;
  bool? isEmailVerified;
  bool? kycCompleted;
  bool? kycVerified;

  UserData(
      {this.id,
      this.username,
      this.firstName,
      this.middleName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.createdAt,
      this.isEmailVerified});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    isEmailVerified = json['email_verified'];
    createdAt = json['created_at'];
    kycCompleted = json['kyc_completed'];
    kycVerified = json['kyc_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['username'] = username;
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['created_at'] = createdAt;
    return data;
  }
}
