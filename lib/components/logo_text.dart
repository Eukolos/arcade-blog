import 'package:arcade_blog/constants.dart';
import 'package:arcade_blog/utils/gradient.dart';
import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  const LogoText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientText(
      "Arcade \nBlog",
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      gradient: kPrimaryGradientColor,
    );
  }
}
