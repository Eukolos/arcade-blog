class RegisterRequestModel {
  String? fullName;
  String? password;
  String? email;

  RegisterRequestModel({this.fullName, this.password, this.email});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }
}
