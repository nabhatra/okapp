import 'package:flutter/material.dart';
import 'package:okapp/constants/constant.dart';
import 'package:sizer/sizer.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildFavoriteComponent(),
            _buildCategoriesComponent(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: 100.w,
      height: 32.h,
      // width: MediaQuery.of(context).size.width,
      // height: 300,
      decoration: BoxDecoration(
          gradient: Constant.linearBackgroundColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(),
                Column(
                  children: [
                    Text(
                      'Hello Patto !',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "What's on your mind",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            Container(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _createButton(
                          "Scan QR", Icons.qr_code_scanner, () => null),
                      Container(
                        width: 30,
                      ),
                      _createButton("Rewards", Icons.favorite, () => null),
                      Container(
                        width: 30,
                      ),
                      _createButton(
                          "Balance", Icons.account_balance_wallet, () => null),
                      Container(
                        width: 30,
                      ),
                      _createButton(
                          "Coupon", Icons.airplane_ticket, () => null),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

//BODY :
  Widget _buildFavoriteComponent() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20, top: 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('กูรูที่ชื่นชอบ',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('ค้นหาอย่างรวดเร็ว'),
                  ],
                ),
                Spacer(), // Spacer will take up the available space between the two columns
                TextButton(
                  child: Text('ดูทั้งหมด'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _createCard("Cardiac", Icons.heat_pump_rounded, Colors.blue),
                _createCard("Brain", Icons.face, Colors.red),
                _createCard(
                    "Pediatics", Icons.heart_broken_rounded, Colors.purple),
                _createCard("Cardiac", Icons.heat_pump_rounded, Colors.green),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _createButton(String title, IconData icon, Function() onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Column(children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          )
        ]),
      ),
    );
  }

  Widget _createCard(String title, IconData icon, Color color,
      {double width = 85, double height = 85}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 36,
            color: Colors.white,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoriesComponent() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //แถวที่ 1
            Text(
              'หมวดหมู่ยอดนิยม',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            //แถวที่ 2
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Container(height: 160, color: Colors.green)),
                Container(
                  width: 20,
                ),
                Expanded(child: Container(height: 160, color: Colors.pink)),
              ],
            ),
            Container(
              height: 20,
            ),
            //แถวที่ 3
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(height: 160, color: Colors.blueAccent)),
                Container(
                  width: 20,
                ),
                Expanded(
                    child: Container(height: 160, color: Colors.orangeAccent)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
