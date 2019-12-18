import 'package:flutter/material.dart';

class higheredu extends StatelessWidget {
  static const routename = '/higheredu';
 final String title;

  const higheredu({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Higher Education',
        style: TextStyle(
          fontFamily: "teko",
          fontSize: 30,
        ),),
      ),
      body: new Center (
        child: new Text("Higher education | Tips"),

      ),
      
    );
  }
}