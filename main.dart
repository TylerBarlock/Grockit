import 'package:flutter/material.dart';
import 'package:grockit/UI/Splashscreen.dart';

void main() => runApp(Base());
class Base extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        theme: ThemeData(
          splashColor: Colors.lightBlueAccent),
        debugShowCheckedModeBanner: false,
        home: Splashscreen());
  }
}