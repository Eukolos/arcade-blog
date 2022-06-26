import 'package:arcade_blog/constants.dart';
import 'package:arcade_blog/views/login_view/login_view.dart';
import 'package:arcade_blog/views/register_view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';

class SplashTextButton extends StatefulWidget {
  const SplashTextButton(
      {Key? key,
      required this.label,
      required this.linkLabel,
      required this.otherSide})
      : super(key: key);

  final String label;
  final String linkLabel;
  final bool otherSide;

  @override
  State<SplashTextButton> createState() => _SplashTextButtonState();
}

class _SplashTextButtonState extends State<SplashTextButton> {
  void otherSidee(bool) {
    if (bool == false) {
      Navigator.pushNamed(context, RegisterView.routeName);
    } else {
      Navigator.pushNamed(context, LoginView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          otherSidee(widget.otherSide);
        },
        child: RichText(
            text: TextSpan(
                text: widget.label,
                style:
                    GoogleFonts.pressStart2p(fontSize: 10, color: Colors.black),
                children: <TextSpan>[
              TextSpan(
                  text: widget.linkLabel,
                  style: GoogleFonts.pressStart2p(color: kNightdarkPearlColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      otherSidee(widget.otherSide);
                    })
            ])),
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.black87,
          primary: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ));
  }
}
