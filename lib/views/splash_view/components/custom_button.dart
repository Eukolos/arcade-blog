import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.buttonText,
      required this.buttonColor,
      required this.press})
      : super(key: key);

  final String buttonText;
  final Color buttonColor;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press as void Function()?,
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor,
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
        height: MediaQuery.of(context).size.height * .087,
        width: MediaQuery.of(context).size.width * .654,
        child: Center(
          child: Text(buttonText,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
      ),
    );
  }
}
