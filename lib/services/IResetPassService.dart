import 'package:arcade_blog/models/reset_pass_response_model.dart';
import 'package:arcade_blog/models/reset_pass_request_model.dart';
import 'package:dio/dio.dart';

abstract class IResetPassService {
  final Dio dio;

  IResetPassService(this.dio);

  final String resetPassPath = IResetPassServicePath.RESETPASS.rawValue;

  Future<ResetPassResponseModel?> postUserResetPass(
      ResetPassRequestModel model);
}

enum IResetPassServicePath { RESETPASS }

extension IResetPassServicePathExtension on IResetPassServicePath {
  String get rawValue {
    switch (this) {
      case IResetPassServicePath.RESETPASS:
        return "/users/reset-password";
    }
  }
}
