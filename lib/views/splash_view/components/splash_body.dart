import 'package:arcade_blog/constants.dart';
import 'package:arcade_blog/views/register_view/register_view.dart';
import 'package:arcade_blog/views/splash_view/components/custom_button.dart';

import 'package:flutter/material.dart';

import '../../../components/logo.dart';
import '../../../components/logo_text.dart';
import '../../login_view/login_view.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 5),
            const Logo(),
            const Spacer(flex: 1),
            const LogoText(),
            const Spacer(flex: 2),
            CustomButton(
                buttonText: "LOG IN",
                buttonColor: Colors.white,
                press: () {
                  Navigator.pushNamed(context, LoginView.routeName);
                }),
            const Spacer(flex: 1),
            CustomButton(
                buttonText: "SIGN UP",
                buttonColor: kNightPearlColor,
                press: () {
                  Navigator.pushNamed(context, RegisterView.routeName);
                }),
            const Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}
