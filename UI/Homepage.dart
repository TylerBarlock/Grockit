import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:grockit/Screens/Maps.dart';
import 'package:grockit/Model/MyAds.dart';
import 'package:grockit/Screens/Searchpage.dart';
import 'package:grockit/Screens/mainHomePage.dart';
import 'package:grockit/Widgets/HomepageDrawer.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: 'GR',
                style: TextStyle(fontFamily: 'Antra', color: Colors.white)),
            TextSpan(
                text: 'O',
                style: TextStyle(fontFamily: 'Antra', color: Colors.lightBlue)),
            TextSpan(
                text: 'CKIT',
                style: TextStyle(fontFamily: 'Antra', color: Colors.white))
          ]),
        ),
      ),
      drawer: HomepageDrawer(),
      body: PageView(
        controller: pageController,
        onPageChanged: (int) {},
        children: <Widget>[MainHomePage(), MapsPage(), SearchPage()],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MaterialButton(
                splashColor: Colors.red,
                child: Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    pageController.jumpToPage(0);
                  });
                },
              ),
              MaterialButton(
                splashColor: Colors.lightBlue,
                child: Icon(Icons.map),
                onPressed: () {
                  setState(() {
                    pageController.jumpToPage(1);
                  });
                },
              ),
              MaterialButton(
                splashColor: Colors.greenAccent,
                child: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    pageController.jumpToPage(2);
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
