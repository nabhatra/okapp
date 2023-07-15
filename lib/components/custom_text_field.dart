// import 'package:flutter/material.dart';
// import 'package:flutterlab/extensions/hex_color.dart';

// class CustomTextField extends StatefulWidget {
//   final String titleText;
//   final String labelText;
//   final ValueChanged<String>? onChanged;
//   final bool obscureText;

//   const CustomTextField({Key? key, this.titleText = "", this.labelText = "", this.onChanged, this.obscureText = false}) : super(key: key);

//   @override
//   _CustomTextFieldState createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   FocusNode _focusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(onFocusChange);
//   }

//   @override
//   void dispose() {
//     _focusNode.removeListener(onFocusChange);
//     _focusNode.dispose();
//     super.dispose();
//   }

//   void onFocusChange() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         GestureDetector(
//           onTap: () {
//             _focusNode.requestFocus();
//           },
//           child: Container(
//             margin: EdgeInsets.only(top: 10),
//             decoration: BoxDecoration(
//               border: (_focusNode.hasFocus) ? Border.all(color: HexColor.fromHex("#4A5CD0"), width: 1.5) : Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//               child: TextField(
//                 autocorrect: false,
//                 enableSuggestions: false,
//                 focusNode: _focusNode,
//                 obscureText: widget.obscureText,
//                 decoration: InputDecoration(
//                   isCollapsed: true,
//                   suffixIcon: (widget.obscureText) ? Icon(Icons.visibility_off) : null,
//                   suffixIconConstraints: BoxConstraints.loose(const Size.fromWidth(20)),
//                   floatingLabelBehavior: FloatingLabelBehavior.never,
//                   border: InputBorder.none,
//                   labelText: widget.labelText,
//                   labelStyle: TextStyle(color: Colors.grey),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(left: 20),
//           padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//           color: Colors.white,
//           child: Text(
//             widget.titleText,
//             style: TextStyle(color: Colors.grey),
//           ),
//         )
//       ],
//     );
//   }
// }
