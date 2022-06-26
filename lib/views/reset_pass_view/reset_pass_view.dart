import 'package:arcade_blog/components/logo.dart';
import 'package:arcade_blog/components/logo_text.dart';
import 'package:arcade_blog/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/reset_pass_service.dart';
import '../splash_view/splash_view.dart';
import 'reset_pass_cubit.dart';

class ResetPassView extends StatefulWidget {
  static String routeName = "/resetpass";

  ResetPassView({Key? key}) : super(key: key);

  @override
  State<ResetPassView> createState() => _ResetPassViewState();
}

class _ResetPassViewState extends State<ResetPassView> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formResetPassKey = GlobalKey();

  final String baseUrl = "http://localhost:3000";

  String? isVerify;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPassCubit(
        formResetPassKey,
        emailController,
        service: ResetPassService(Dio(BaseOptions(baseUrl: baseUrl))),
      ),
      child: BlocConsumer<ResetPassCubit, ResetPassState>(
        listener: (context, state) {},
        builder: (context, state) {
          return buildScaffold(context, state);
        },
      ),
    );
  }

  Scaffold buildScaffold(BuildContext context, ResetPassState state) {
    return Scaffold(
        body: Column(children: [
      const Spacer(flex: 4),
      const Logo(),
      const LogoText(),
      const Spacer(flex: 2),
      Form(
          key: formResetPassKey,
          autovalidateMode: state is ResetPassValidateState
              ? (state.isValidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled)
              : AutovalidateMode.disabled,
          child: Column(children: [
            emailTextFromField(context),
            SizedBox(height: MediaQuery.of(context).size.height * .023),
          ])),
      const Spacer(flex: 1),
      TextButton(
        onPressed: () {
          context.read<ResetPassCubit>().postUserModel();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SplashView()));
        }, //as void Function()?,
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
          width: MediaQuery.of(context).size.width * .754,
          child: const Center(
            child: Text("Reset Your Password",
                style: TextStyle(
                    fontSize: 13,
                    letterSpacing: .5,
                    fontWeight: FontWeight.w400,
                    color: kRedColor)),
          ),
        ),
      ),
      const Spacer(flex: 3),
      const Spacer(flex: 6)
    ]));
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
