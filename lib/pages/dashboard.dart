import 'package:flutter/material.dart';
import 'package:okapp/constants/constant.dart';
import 'package:okapp/pages/menu_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              //import menu_page.dart
              const MenuPage(),
              Container(color: Colors.amber),
              Container(color: Colors.blue),
              Container(color: Colors.red),
            ],
          ),
        ),
        Container(
          height: 20,
        ),
        TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            gradient: Constant.linearBackgroundColor,
            borderRadius: BorderRadius.circular(40),
          ),
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 0,
          dividerColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          padding: EdgeInsets.only(left: 10, bottom: 20, right: 10),
          tabs: [
            Expanded(
              child: Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.home),
                    Text(
                      "Home",
                      style: TextStyle(fontSize: 11),
                    )
                  ],
                ),
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.shop),
                  Text(
                    "Product",
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.history),
                  Text(
                    "History",
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.portrait_rounded),
                  Text(
                    "Profile",
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}
