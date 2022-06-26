import 'package:arcade_blog/services/ILoginService.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:arcade_blog/models/login_response_model.dart';
import 'package:arcade_blog/models/login_request_model.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController;
  final TextEditingController passController;
  final GlobalKey<FormState> formKey;

  final ILoginService service;

  bool isLoginFail = false;

  bool isLoading = false;

  LoginCubit(this.formKey, this.emailController, this.passController,
      {required this.service})
      : super(LoginInitial());

  Future<void> postUserModel() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      final data = await service.postUserLogin(LoginRequestModel(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      ));
      changeLoadingView();
//!4150
      if (data is LoginResponseModel) {
        emit(LoginComplete(data));
      }
    } else {
      isLoginFail = true;
      emit(LoginValidateState(isLoginFail));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(LoginLoadingState(isLoading));
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginComplete extends LoginState {
  final LoginResponseModel model;

  LoginComplete(this.model);
}

class LoginValidateState extends LoginState {
  final bool isValidate;

  LoginValidateState(this.isValidate);
}

class LoginLoadingState extends LoginState {
  final bool isLoading;

  LoginLoadingState(this.isLoading);
}
