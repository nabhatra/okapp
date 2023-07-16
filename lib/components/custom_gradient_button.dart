import 'package:flutter/material.dart';

import '../constants/constant.dart';

class CustomGradientButton extends StatefulWidget {
  final void Function()? onPressed;
  final String title;

  const CustomGradientButton(
      {Key? key, required this.onPressed, this.title = "เข้าสู่ระบบ"})
      : super(key: key);

  @override
  _CustomGradientButtonState createState() => _CustomGradientButtonState();
}

class _CustomGradientButtonState extends State<CustomGradientButton> {
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
          widget.title,
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
