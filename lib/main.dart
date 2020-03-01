import 'package:flutter/material.dart';
import 'homepage.dart';
import 'searchpage.dart';

void main() => runApp(OurApp());

class OurApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: OurAppTabBar(),
    );
  }
}

class OurAppTabBar extends StatelessWidget {
  final TextStyle topMenuStyle = new TextStyle(
      fontFamily: 'Avenir next',
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w600);
  final TextStyle buttonInfoStyle = new TextStyle(
      fontFamily: 'Avenir next',
      fontSize: 10,
      color: Colors.white,
      fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Theme(
          data: ThemeData(brightness: Brightness.dark),
          child: Scaffold(
            bottomNavigationBar: TabBar(
                isScrollable: false,
                tabs: [
                  Tab(
                      icon: Icon(
                        Icons.home,
                      ),
                      text: "Home"),
                  Tab(icon: Icon(Icons.search), text: "Search"),
                  Tab(icon: Icon(Icons.book), text: "Your Library"),
                  // Tab(icon: Icon(Icons.local_airport), text: "Trips"),
                  // Tab(icon: Icon(Icons.live_tv), text: "Media"),
                  // Tab(icon: Icon(Icons.calendar_today), text: "Plans"),
                ],
                unselectedLabelColor: Color(0xff999999),
                labelColor: Colors.lightGreen,
                indicatorColor: Colors.lightGreen),
            body: TabBarView(
              children: [
                HomePage(),
                SearchPage(),
                Center(child: Text("Page 3")),
                // Center(child: Text("Page 4")),
                // Center(child: Text("Page 5")),
                // Center(child: Text("Page 6")),
              ],
            ),
          ),
        ));
  }
}
