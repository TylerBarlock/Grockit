import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grockit/UI/Login.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(context, PageTransition(
        child: Login(),
        type: PageTransitionType.rightToLeft
      ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: Text('Grockit',
                    style: TextStyle(
                        fontFamily: 'Antra', color: Colors.red, fontSize: 36)),
              ),
              SizedBox(
                  height: 200.0,
                  width: 200.0,
                  child: Lottie.asset('animations/loading.json')),
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Text('Beta version',
                    style: TextStyle(
                        fontFamily: 'Antra',
                        color: Colors.blueGrey,
                        fontSize: 10.0)),
              )
            ],
          ),
        ),
      ),
    );
  }
}