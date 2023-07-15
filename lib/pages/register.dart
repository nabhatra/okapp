// import 'package:flutter/material.dart';
// import 'package:okapp/constants/constant.dart';

// class Register extends StatefulWidget {
//   const Register({ Key? key }) : super(key: key);

//   @override
//   _RegisterState createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//         GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String? userEmail;
//   String? userPassword;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }
// //Header
// Widget _buildHeader() {
//   return Container(
//     child: Center(
//       child: Image.asset((kIsWeb) ? "Logo.png" : "assets/images/Logo.png",
//       width: 204,
//       height: 204,
//       ),
//     ),
//     height: 300,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),
      
//       ),
//       gradient: Constant.linearBackgroundColor,
//     ),
//   );
// }

// //Body

// Widget _buildBody() {
//   return Container(
//     child: Column(
//       children: [
//         TextFormField(
//           decoration: InputDecoration(labelText: 'Email'), 
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Please input email";
//             }
//             return null;
//           },
//           onSaved: (newValue) {
//             userEmail = newValue
//           },
//         )
//       ],
//     ),
//   )
// }



// //Footer