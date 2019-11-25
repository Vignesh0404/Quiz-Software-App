import 'package:flutter/material.dart';
import 'package:testsoft/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FORESE TEST SOFTWARE",
      theme: ThemeData(
        cardColor: Colors.red,
        primarySwatch: Colors.indigo,
      ),
      home: splashscreen(),
    );
  }
}
