import 'dart:io';

import 'package:arcade_blog/models/login_response_model.dart';
import 'package:arcade_blog/models/login_request_model.dart';
import 'package:arcade_blog/services/ILoginService.dart';
import 'package:dio/dio.dart';

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model) async {
    final response = await dio.post(loginPath, data: model);

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
