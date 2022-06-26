import 'package:arcade_blog/components/logo.dart';
import 'package:arcade_blog/components/logo_text.dart';
import 'package:arcade_blog/components/splash_text_button.dart';
import 'package:arcade_blog/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/register_service.dart';
import '../splash_view/splash_view.dart';
import 'register_cubit.dart';

class RegisterView extends StatelessWidget {
  static String routeName = "/register";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formRegisterKey = GlobalKey();

  final String baseUrl = "http://localhost:3000";

  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        nameController,
        emailController,
        passController,
        formRegisterKey,
        service: RegisterService(Dio(BaseOptions(baseUrl: baseUrl))),
      ),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return buildScaffold(context, state);
        },
      ),
    );
  }

  Scaffold buildScaffold(BuildContext context, RegisterState state) {
    return Scaffold(
        body: Column(children: [
      const Spacer(flex: 4),
      const Logo(),
      const LogoText(),
      const Spacer(flex: 2),
      Form(
          key: formRegisterKey,
          autovalidateMode: state is RegisterValidateState
              ? (state.isValidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled)
              : AutovalidateMode.disabled,
          child: Column(children: [
            nameTextFromField(context),
            SizedBox(height: MediaQuery.of(context).size.height * .023),
            emailTextFromField(context),
            SizedBox(height: MediaQuery.of(context).size.height * .023),
            passTextFromField(context),
            SizedBox(height: MediaQuery.of(context).size.height * .023),
          ])),
      const Spacer(flex: 2),
      TextButton(
        onPressed: context.watch<RegisterCubit>().isLoading
            ? null
            : () {
                context.read<RegisterCubit>().postUserModel();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SplashView()));
              }
//!Navigator.of(context).push(MaterialPageRoute(builder: (context) => SplashView()));
        , //as void Function()?,
        child: Container(
          decoration: BoxDecoration(
              color: kNightPearlColor,
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
            child: Text("Register",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: kRedColor)),
          ),
        ),
      ),
      const Spacer(flex: 1),
      const SplashTextButton(
          label: "Don’t have an account? ",
          linkLabel: "Sign Up",
          otherSide: true),
      const Spacer(flex: 6)
    ]));
  }

  Padding nameTextFromField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .070),
      child: Container(
        decoration: _boxDecoration(),
        child: TextFormField(
          controller: nameController,
          validator: (value) => (value ?? "").length >= 3 ? null : "3ten küçük",
          keyboardType: TextInputType.name,
          style: const TextStyle(fontSize: 10),
          maxLines: 1,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.person, color: Colors.black.withOpacity(.7)),
            hintText: "Enter your username",
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
            hintText: "Enter your email",
            focusedBorder: _outlineInputBorder(),
            enabledBorder: _outlineInputBorder(),
          ),
        ),
      ),
    );
  }

  Padding passTextFromField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .070,
      ),
      child: Container(
        decoration: _boxDecoration(),
        child: TextFormField(
          controller: passController,
          validator: (value) => (value ?? "").length > 5 ? null : "5ten küçük",
          keyboardType: TextInputType.name,
          style: const TextStyle(fontSize: 10),
          maxLines: 1,
          obscureText: true,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.key, color: Colors.black.withOpacity(.7)),
            hintText: "Enter your password",
            focusedBorder: _outlineInputBorder(),
            enabledBorder: _outlineInputBorder(),
          ),
        ),
      ),
    );
  }

  Padding verifyPassTextFromField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .070,
      ),
      child: Container(
        decoration: _boxDecoration(),
        child: TextFormField(
          controller: passController,
          validator: (value) => (value ?? "").length > 5 ? null : "5ten küçük",
          keyboardType: TextInputType.name,
          style: const TextStyle(fontSize: 10),
          maxLines: 1,
          obscureText: true,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.key, color: Colors.black.withOpacity(.7)),
            hintText: "Enter your password",
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
