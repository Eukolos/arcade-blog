import 'package:arcade_blog/constants.dart';
import 'package:arcade_blog/views/register_view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/reset_pass_view/reset_pass_view.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  void _push() {
    Navigator.pushNamed(context, ResetPassView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 4, top: 8),
      width: MediaQuery.of(context).size.width * .9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, ResetPassView.routeName);
              },
              clipBehavior: Clip.none,
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.black87,
                primary: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              child: RichText(
                  text: TextSpan(
                text: "Forgot Password ?",
                style: GoogleFonts.pressStart2p(
                    fontSize: 7, color: kNightdarkPearlColor),
              ))),
        ],
      ),
    );
  }
}
