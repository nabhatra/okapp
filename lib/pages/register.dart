import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:okapp/components/custom_gradient_button.dart';
import 'package:okapp/constants/constant.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? userName;
  String? userLastname;
  String? userEmail;
  String? userPassword;
  String? confirmPassword;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            _registerHeader(),

            // Body
            _registerBody(),

            // Footer
            _registerFooter(),
          ],
        ),
      ),
    );
  }

  // Header
  Widget _registerHeader() {
    return Container(
      child: Center(
        child: Image.asset(
          (kIsWeb) ? "Logo.png" : "assets/images/Logo.png",
          width: 204,
          height: 204,
        ),
      ),
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          gradient: Constant.linearBackgroundColor),
    );
  }

  // Body
  Widget _registerBody() {
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            //userName
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Firstname',
                hintText: "Firstname",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please input email.";
                }
                return null;
              },
              onSaved: (newValue) {
                userName = newValue;
              },
            ),
            Container(height: 10),
            //userLastname
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Lastname',
                hintText: "Lastname",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please input email.";
                }
                return null;
              },
              onSaved: (newValue) {
                userLastname = newValue;
              },
            ),
            Container(height: 10),
//email
            TextFormField(
              decoration: InputDecoration(
                labelText: 'email',
                hintText: "Please input your email",
              ),
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
            Container(height: 10),
//password
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
            Container(height: 10),
            TextFormField(
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                hintText: 'Please confirm your password',
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
                  return 'Please enter a password agian.';
                } else if (userPassword != value) {
                  return 'Passwords do not match.';
                }
                return null;
              },
            ),
            Container(height: 10),

            CustomGradientButton(
              onPressed: () async {
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate()) {
                  var url = Uri.http('10.0.2.2:3000', '/okapp/register.php');

                  // Await the http post response, then decode the json-formatted response.
                  var response = await http.post(url, body: {
                    "userEmail": userEmail,
                    "userPassword": userPassword,
                    "userName": userName,
                    "userLastname": userLastname,
                  });

                  if (response.statusCode == 200) {
                    var jsonResponse =
                        jsonDecode(response.body) as Map<String, dynamic>;
                    if (jsonResponse["status"]) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/dashboard", (route) => false);
                    }
                  } else {
                    print(
                        'Request failed with status: ${response.statusCode}.');
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

// Footer
  Widget _registerFooter() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text.rich(
        TextSpan(
          text: 'Have an account? ',
          style: TextStyle(fontSize: 16),
          children: [
            TextSpan(
              text: 'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, '/');
                },
            ),
          ],
        ),
      ),
    );
  }
}
