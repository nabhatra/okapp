import 'package:flutter/material.dart';
import 'package:okapp/constants/constant.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
// Header
            _headerDashboard(context),

            //body
            //footer
          ],
        ),
      ),
    );
  }
}
//header

// Header
Widget _headerDashboard(BuildContext context) {
  return Container(
    height: 140,
    decoration: BoxDecoration(gradient: Constant.linearBackgroundColor),
    child: Stack(
      children: [
        Positioned(
          left: 16,
          top: 40,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              // ใช้สำหรับหน้า register กด confirm แล้วย้อนกลับไปแก้ไม่ได้
              Navigator.popAndPushNamed(context, '/');
            },
          ),
        ),
        Center(
          child: Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
