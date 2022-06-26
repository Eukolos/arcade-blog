import 'package:arcade_blog/services/IResetPassService.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:arcade_blog/models/reset_pass_response_model.dart';
import 'package:arcade_blog/models/reset_pass_request_model.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  final TextEditingController emailController;
  final GlobalKey<FormState> formResetPassKey;

  final IResetPassService service;

  bool isResetPassFail = false;
  bool isSplash = false;

  bool isLoading = false;

  ResetPassCubit(this.formResetPassKey, this.emailController,
      {required this.service})
      : super(ResetPassInitial());

  Future<void> postUserModel() async {
    if (formResetPassKey.currentState != null &&
        formResetPassKey.currentState!.validate()) {
      changeLoadingView();
      final data = await service.postUserResetPass(
          ResetPassRequestModel(email: emailController.text.trim()));
      changeLoadingView();
//!4150
      if (data is ResetPassResponseModel) {
        emit(ResetPassComplete(data));
      }
    } else {
      isResetPassFail = true;
      emit(ResetPassValidateState(isResetPassFail));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(ResetPassLoadingState(isLoading));
  }
}

abstract class ResetPassState {}

class ResetPassInitial extends ResetPassState {}

class ResetPassComplete extends ResetPassState {
  final ResetPassResponseModel model;

  ResetPassComplete(this.model);
}

class ResetPassValidateState extends ResetPassState {
  final bool isValidate;

  ResetPassValidateState(this.isValidate);
}

class ResetPassLoadingState extends ResetPassState {
  final bool isLoading;

  ResetPassLoadingState(this.isLoading);
}
