import 'package:flutter/material.dart';

class about extends StatelessWidget {
  static const routename = '/about';
 final String title;

  const about({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ABOUT US | FORESE '),
      ),
      body: new Center (
        child: new Text("ABOUT US"),

      ),
      
    );
  }
}