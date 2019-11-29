import 'package:flutter/material.dart';
import 'package:testsoft/forgotpass.dart';
import 'package:testsoft/home.dart';
import 'package:testsoft/signup.dart';
import 'placements.dart';
import 'higheredu.dart';
import 'about.dart';
import 'package:testsoft/splashscreen.dart';
import 'forgotpass.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SVCE QUIZ MASTER",
      theme: ThemeData(
        
        primarySwatch: Colors.indigo,
      ),
      home: splashscreen(),
      
      routes: {
        homepage.routename:(ctx) => homepage(),
        placements.routename:(ctx) => placements(),
        higheredu.routename:(ctx) => higheredu(),
        about.routename:(ctx) => about(),
        forgotpass.routename:(ctx) =>forgotpass(),
        signup.routename:(ctx) =>signup()
      },
    );
  }
}
