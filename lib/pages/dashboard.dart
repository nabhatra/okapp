import 'package:flutter/material.dart';
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
              MenuPage(),
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.red,
              ),
            ],
          ),
        ),
        TabBar(
          padding: EdgeInsets.only(
            left: 10,
            bottom: 20,
            right: 10,
          ),
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
              ),
              child: Text("Home"),
            ),
            Tab(
              icon: Icon(
                Icons.production_quantity_limits_sharp,
              ),
              child: Text("Product"),
            ),
            Tab(
              icon: Icon(
                Icons.history,
              ),
              child: Text("History"),
            ),
            Tab(
              icon: Icon(
                Icons.portrait_rounded,
              ),
              child: Text("Profile"),
            ),
          ],
        )
      ],
    ));
  }
}
