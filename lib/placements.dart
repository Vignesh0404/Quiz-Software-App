import 'package:flutter/material.dart';

class placements extends StatelessWidget {
  static const routename = '/placements';
 final String title;

  const placements({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Techincal Domains ',
        style: TextStyle(
          fontFamily: "teko",
          fontSize: 30,
        ),),
      ),
      body: new Center (
        child: new Text("Techincal   | Domains"),

      ),
      
    );
  }
}