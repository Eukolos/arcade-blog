import 'package:arcade_blog/models/register_response_model.dart';
import 'package:arcade_blog/models/register_request_model.dart';
import 'package:dio/dio.dart';

abstract class IRegisterService {
  final Dio dio;

  IRegisterService(this.dio);

  final String registerPath = IRegisterServicePath.REGISTER.rawValue;

  Future<RegisterResponseModel?> postUserRegister(RegisterRequestModel model);
}

enum IRegisterServicePath { REGISTER }

extension IRegisterServicePathExtension on IRegisterServicePath {
  String get rawValue {
    switch (this) {
      case IRegisterServicePath.REGISTER:
        return "/users";
    }
  }
}
