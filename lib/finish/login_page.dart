// import 'package:flutter/material.dart';
// import 'package:flutterlab/components/custom_button.dart';
// import 'package:flutterlab/components/custom_text_field.dart';
// import 'package:flutterlab/constants/constant.dart';
// import 'package:flutterlab/extensions/hex_color.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool showHeader = false;
//   bool showLogo = false;

//   @override
//   void initState() {
//     Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         showHeader = true;
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _buildHeader(),
//             _buildBody(),
//             _buildFooter()
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 500),
//       onEnd: () {
//         setState(() {
//           showLogo = true;
//         });
//       },
//       curve: Curves.decelerate,
//       height: showHeader ? 300 : 0,
//       decoration: BoxDecoration(
//         gradient: Constant.linearBackgroundColor,
//         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//       ),
//       child: Center(
//         child: AnimatedOpacity(
//           duration: Duration(milliseconds: 1000),
//           opacity: showLogo ? 1 : 0,
//           child: Image.asset(
//             "images/Logo.png",
//             width: 204,
//             height: 204,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildBody() {
//     return Padding(
//       padding: EdgeInsets.only(top: 40, left: 20, right: 20),
//       child: Column(
//         children: [
//           CustomTextField(
//             titleText: "อีเมล",
//             labelText: "กรุณาทำการกรอกอีเมล",
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           CustomTextField(
//             titleText: "รหัสผ่าน",
//             labelText: "กรุณาทำการกรอกรหัสผ่าน",
//             obscureText: true,
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 "ลืมรหัสผ่าน?",
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             children: [
//               Expanded(child: CustomButton(title: "เข้าสู่ระบบ")),
//               SizedBox(
//                 width: 10,
//               ),
//               Image.asset(
//                 "images/fingerprint.png",
//                 width: 32,
//                 height: 36,
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildFooter() {
//     return Column(
//       children: [
//         SizedBox(
//           height: 20,
//         ),
//         RichText(
//             text: TextSpan(style: TextStyle(fontFamily: 'Kanit'), children: [
//           TextSpan(text: "ยังไม่มีบัญชี ? ", style: TextStyle(color: Colors.grey)),
//           TextSpan(text: "สมัครสมาชิก", style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
//         ])),
//         SizedBox(
//           height: 20,
//         ),
//         Text(
//           "หรือเข้าสู่ระบบโดย",
//           style: TextStyle(fontSize: 11, color: Colors.grey),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 "images/btn_apple.png",
//                 width: 40,
//                 height: 40,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Image.asset(
//                 "images/btn_google.png",
//                 width: 40,
//                 height: 40,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Image.asset(
//                 "images/btn_facebook.png",
//                 width: 40,
//                 height: 40,
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
