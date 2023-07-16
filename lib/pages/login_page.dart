import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../components/custom_gradient_button.dart';
import '../constants/constant.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? userEmail;
  String? userPassword;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildBody(),
            Container(
              height: 15,
            ),
            _buildFooter()
          ],
        ),
      ),
    );
  }

  //Image
  Widget _buildHeader() {
    return Container(
      child: Center(
        child: Image.asset(
          (kIsWeb) ? "Logo.png" : "assets/images/Logo.png",
          width: 204,
          height: 204,
        ),
      ),
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          gradient: Constant.linearBackgroundColor),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'อีเมล', hintText: "กรุณากรอกอีเมล"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please input email.";
                }
                return null;
              },
              onSaved: (newValue) {
                userEmail = newValue;
              },
            ),
            Container(
              height: 20,
            ),
            TextFormField(
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: "Please enter a password.",
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a password.";
                }
                return null;
              },
              onSaved: (newValue) {
                userPassword = newValue;
              },
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("ลืมรหัสผ่าน?"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: CustomGradientButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        var url =
                            Uri.http('127.0.0.1:3000', '/okapp/login.php');

                        // Await the http get response, then decode the json-formatted response.
                        var response = await http.post(url, body: {
                          "userEmail": userEmail,
                          "userPassword": userPassword
                        });
                        if (response.statusCode == 200) {
                          var jsonResponse =
                              jsonDecode(response.body) as Map<String, dynamic>;
                          if (jsonResponse["status"]) {
                            Navigator.pushNamed(context, "/dashboard");
                          }
                        } else {
                          print(
                              'Request failed with status: ${response.statusCode}.');
                        }
                      }
                    },
                  )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.fingerprint,
                        size: 50,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text("ยังไม่มีบัญชี? "),
        //     Text("สมัครสมาชิก"),
        //   ],
        // ),
        RichText(
            text: TextSpan(
                style: TextStyle(
                    fontSize: 12, color: Colors.black, fontFamily: 'Kanit'),
                children: [
              TextSpan(text: "ยังไม่มีบัญชี?"),
              TextSpan(
                  text: "สมัครสมาชิก",
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, "/register");
                    }),
            ])),
        Container(height: 10),
        Text("หรือเข้าสู่ระบบโดย"),
        Container(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              (kIsWeb) ? "btn_apple.png" : "assets/images/btn_apple.png",
              width: 40,
              height: 40,
            ),
            Container(width: 10),
            Image.asset(
              (kIsWeb) ? "btn_google.png" : "assets/images/btn_google.png",
              width: 40,
              height: 40,
            ),
            Container(width: 10),
            Image.asset(
              (kIsWeb) ? "btn_facebook.png" : "assets/images/btn_facebook.png",
              width: 40,
              height: 40,
            ),
          ],
        ),
        Container(
          height: 100,
        )
      ],
    );
  }
}
