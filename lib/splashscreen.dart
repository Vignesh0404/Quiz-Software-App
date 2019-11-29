import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testsoft/login.dart';
import 'package:testsoft/signup.dart';
import 'slide.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState(); 
}

class _splashscreenState extends State<splashscreen> {
  
  @override 
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => SlideScreen(),
      ));
    });
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.indigo.withOpacity(0.7)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40.0,
                        child: Icon(
                          Icons.code,
                          color: Colors.black,
                          size: 40.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "SUNDARAM FINANCE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontFamily: "teko",
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        "Enduring values. New age thinking.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: "teko",
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      Text("SF QUIZZ - initiative by SIS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontFamily: "teko",
                        fontWeight: FontWeight.w700
                      ),
                         )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("Test your technical knowledge",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21.0,
                        fontFamily: "teko",
                        fontWeight: FontWeight.w400
                      ),
                         )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}