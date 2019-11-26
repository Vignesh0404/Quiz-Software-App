import 'package:flutter/material.dart';
import 'package:testsoft/home.dart';
import 'placements.dart';
import 'higheredu.dart';
import 'package:testsoft/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SVCE QUIZ MASTER",
      theme: ThemeData(
        cardColor: Colors.red,
        primarySwatch: Colors.indigo,
      ),
      home: splashscreen(),
      
      routes: {
        homepage.routename:(ctx) => homepage(),
        placements.routename:(ctx) => placements(),
        higheredu.routename:(ctx) => higheredu(),
      },
    );
  }
}
