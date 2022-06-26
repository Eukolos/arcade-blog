class RegisterResponseModel {
  String? fullName;
  String? password;
  String? email;
  String? sId;
  String? createdAt;
  String? updatedAt;

  RegisterResponseModel(
      {this.fullName,
      this.password,
      this.email,
      this.sId,
      this.createdAt,
      this.updatedAt});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    password = json['password'];
    email = json['email'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['password'] = this.password;
    data['email'] = this.email;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
