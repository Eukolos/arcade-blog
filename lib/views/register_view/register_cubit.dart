import 'package:arcade_blog/services/IRegisterService.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:arcade_blog/models/register_response_model.dart';
import 'package:arcade_blog/models/register_request_model.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passController;
  final GlobalKey<FormState> formRegisterKey;

  final IRegisterService service;

  bool isRegisterFail = false;
  bool isSplash = false;

  bool isLoading = false;

  RegisterCubit(this.nameController, this.emailController, this.passController,
      this.formRegisterKey,
      {required this.service})
      : super(RegisterInitial());

  Future<void> postUserModel() async {
    if (formRegisterKey.currentState != null &&
        formRegisterKey.currentState!.validate()) {
      changeLoadingView();
      final data = await service.postUserRegister(RegisterRequestModel(
        fullName: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passController.text.trim(),
      ));
      changeLoadingView();
//!4150
      if (data is RegisterResponseModel) {
        isSplash = !isSplash;
        emit(RegisterComplete(data));
      }
    } else {
      isRegisterFail = true;
      emit(RegisterValidateState(isRegisterFail));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(RegisterLoadingState(isLoading));
  }
}

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterComplete extends RegisterState {
  final RegisterResponseModel model;

  RegisterComplete(this.model);
}

class RegisterValidateState extends RegisterState {
  final bool isValidate;

  RegisterValidateState(this.isValidate);
}

class RegisterLoadingState extends RegisterState {
  final bool isLoading;

  RegisterLoadingState(this.isLoading);
}
