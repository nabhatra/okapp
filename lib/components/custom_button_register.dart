import 'package:flutter/material.dart';

import '../constants/constant.dart';

class CustomRegisterButton extends StatefulWidget {
  final void Function()? onPressed;

  const CustomRegisterButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  _CustomRegisterButtonState createState() => _CustomRegisterButtonState();
}

class _CustomRegisterButtonState extends State<CustomRegisterButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
      onPressed: widget.onPressed,
      child: Ink(
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: Constant.linearBackgroundColor),
        child: Center(
            child: Text(
          "Register",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
