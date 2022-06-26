import 'package:arcade_blog/components/forgot_password.dart';
import 'package:arcade_blog/components/logo.dart';
import 'package:arcade_blog/components/logo_text.dart';
import 'package:arcade_blog/components/splash_text_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../services/login_service.dart';
import '../home_view/home_view.dart';
import 'login_cubit.dart';

class LoginView extends StatelessWidget {
  static String routeName = "/login";
  static bool _isObscured = true;
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final String baseUrl = "http://localhost:3000";

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        formKey,
        emailController,
        passController,
        service: LoginService(Dio(BaseOptions(baseUrl: baseUrl))),
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginComplete) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomeView(
                      model: state.model,
                    )));
          }
        },
        builder: (context, state) {
          return buildScaffold(context, state);
        },
      ),
    );
  }

  Scaffold buildScaffold(BuildContext context, LoginState state) {
    return Scaffold(
        body: Column(children: [
      const Spacer(flex: 5),
      const Logo(),
      const LogoText(),
      const Spacer(flex: 2),
      Form(
          key: formKey,
          autovalidateMode: state is LoginValidateState
              ? (state.isValidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled)
              : AutovalidateMode.disabled,
          child: Column(children: [
            emailTextFromField(context),
            passTextFromField(context)
          ])),
      const ForgotPassword(),
      TextButton(
        onPressed: context.watch<LoginCubit>().isLoading
            ? null
            : () {
                context.read<LoginCubit>().postUserModel();
              }, //as void Function()?,
        child: Container(
          decoration: BoxDecoration(
              color: kRedColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 1,
                  blurRadius: .5,
                  offset: Offset(5, 6), // changes position of shadow
                ),
              ],
              border: Border.all(
                  color: Colors.black, width: 5, style: BorderStyle.solid)),
          height: MediaQuery.of(context).size.height * .077,
          width: MediaQuery.of(context).size.width * .654,
          child: const Center(
            child: Text("Login",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: kNightPearlColor,
                )),
          ),
        ),
      ),
      const Spacer(flex: 1),
      const SplashTextButton(
          label: "Don’t have an account? ",
          linkLabel: "Sign Up",
          otherSide: false),
      const Spacer(flex: 1),
      Visibility(
        visible: context.watch<LoginCubit>().isLoading,
        child: const CircularProgressIndicator(),
      ),
      const Spacer(flex: 5)
    ]));
  }

  Padding passTextFromField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .070,
        right: MediaQuery.of(context).size.width * .070,
        top: MediaQuery.of(context).size.height * .023,
      ),
      child: Container(
        decoration: _boxDecoration(),
        child: TextFormField(
          controller: passController,
          validator: (value) => (value ?? "").length > 5 ? null : "5ten küçük",
          keyboardType: TextInputType.name,
          style: const TextStyle(fontSize: 10),
          maxLines: 1,
          obscureText: _isObscured,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.key, color: Colors.black.withOpacity(.7)),
            suffixIcon: IconButton(
                onPressed: () {
                  if (true) {
                    _isObscured = !_isObscured;
                  }
                },
                icon: _isObscured
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                color: Colors.black.withOpacity(.7)),
            hintText: "Enter your password",
            focusedBorder: _outlineInputBorder(),
            enabledBorder: _outlineInputBorder(),
          ),
        ),
      ),
    );
  }

  Padding emailTextFromField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .070),
      child: Container(
        decoration: _boxDecoration(),
        child: TextFormField(
          controller: emailController,
          validator: (value) => (value ?? "").length > 5 ? null : "5ten küçük",
          keyboardType: TextInputType.name,
          style: const TextStyle(fontSize: 10),
          maxLines: 1,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.email, color: Colors.black.withOpacity(.7)),
            hintText: "Enter your email adress",
            focusedBorder: _outlineInputBorder(),
            enabledBorder: _outlineInputBorder(),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          spreadRadius: 1,
          blurRadius: .5,
          offset: Offset(3, 3), // changes position of shadow
        ),
      ],
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: const BorderSide(color: Colors.black, width: 2.5),
    );
  }
}
