import 'dart:io';

import 'package:arcade_blog/models/register_response_model.dart';
import 'package:arcade_blog/models/register_request_model.dart';
import 'package:arcade_blog/services/IRegisterService.dart';
import 'package:dio/dio.dart';

class RegisterService extends IRegisterService {
  RegisterService(Dio dio) : super(dio);

  @override
  Future<RegisterResponseModel?> postUserRegister(
      RegisterRequestModel model) async {
    final response = await dio.post(registerPath, data: model);

    if (response.statusCode == HttpStatus.ok) {
      return RegisterResponseModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
