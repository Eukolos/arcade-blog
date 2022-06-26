import 'package:flutter/material.dart';

class SplashTextField extends StatefulWidget {
  const SplashTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashTextField> createState() => _SplashTextFieldState();
}

class _SplashTextFieldState extends State<SplashTextField> {
  static bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: const BorderSide(color: Colors.black, width: 2.5),
    );
    BoxDecoration boxDecoration = const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          spreadRadius: 1,
          blurRadius: .5,
          offset: Offset(3, 3), // changes position of shadow
        ),
      ],
    );
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .070),
      child: Container(
          decoration: boxDecoration,
          child: TextField(
            keyboardType: TextInputType.name,
            style: const TextStyle(fontSize: 10),
            maxLines: 1,
            obscureText: _isObscured,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon:
                  Icon(Icons.email, color: Colors.black.withOpacity(.7)),
              suffixIcon: IconButton(
                  onPressed: () {
                    if (true) {
                      _isObscured = !_isObscured;
                      setState(() {});
                    }
                  },
                  icon: _isObscured
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  color: Colors.black.withOpacity(.7)),
              hintText: "deneme",
              focusedBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder,
            ),
          )),
    );
  }
}
