import 'dart:io';
import 'package:arcade_blog/models/reset_pass_response_model.dart';
import 'package:arcade_blog/models/reset_pass_request_model.dart';
import 'package:arcade_blog/services/IResetPassService.dart';
import 'package:dio/dio.dart';

class ResetPassService extends IResetPassService {
  ResetPassService(Dio dio) : super(dio);

  @override
  Future<ResetPassResponseModel?> postUserResetPass(
      ResetPassRequestModel model) async {
    final response = await dio.post(resetPassPath, data: model);

    if (response.statusCode == HttpStatus.ok) {
      return ResetPassResponseModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
