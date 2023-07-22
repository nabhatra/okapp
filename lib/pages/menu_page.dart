import 'package:flutter/material.dart';
import 'package:okapp/constants/constant.dart';

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
            _buildGridMenu,
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      // width: double.infinity,
      width: MediaQuery.of(context).size.width,
      height: 300,
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
              height: 20,
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
            padding: const EdgeInsets.only(left: 10, bottom: 20, top: 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('กูรูที่ชื่นชอบ'),
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
              children: [
                Container(width: 150, height: 150, color: Colors.red),
                Container(width: 150, height: 150, color: Colors.blue),
                Container(width: 150, height: 150, color: Colors.green),
                Container(width: 150, height: 150, color: Colors.black),
                Container(width: 150, height: 150, color: Colors.pink),
                Container(width: 150, height: 150, color: Colors.yellow),
                Container(width: 150, height: 150, color: Colors.lightGreen),
                Container(width: 150, height: 150, color: Colors.grey),
                Container(width: 150, height: 150, color: Colors.deepOrange),
                Container(width: 150, height: 150, color: Colors.purple),
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

  //Grid
}
