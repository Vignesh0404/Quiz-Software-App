import 'package:flutter/material.dart';
import 'package:testsoft/home.dart';

class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key key, @required this.marks}) : super(key : key);
  

  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {
  List<String> images = [ //a list to display different images for differnt marks
  "images/success.png",
  "images/bad.png"
  ]; 
  String msg;
  String img;

   @override
  void initState() {  // to display different images and messages based on the marks scored
    
    if(marks < 3){
      img = images[1];
      msg = "Keep working on it! You'll eventually get there";
    }else if (marks > 3)  {
      img = images[0];
      msg = "Congragulations! Keep Quizzing" ;
    }
    super.initState();
  }

  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "QUIZ RESULTS",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "teko",
            fontSize: 30.0,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Material(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 200.0,
                        height: 300.0,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(
                              img
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 15.0
                      ),
                      child: Center(
                        child: Text(
                          msg +"\nYou have scored $marks/5 marks!",
                          style: TextStyle(
                            fontFamily: "Quando",
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                            color: Colors.black45
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => homepage(),
                    ));
                  },
                  child: Text(
                    "CONTINUE",
                   style: TextStyle(
                     fontFamily: "teko",
                     fontSize: 30.0,
                     fontWeight: FontWeight.w700,
                     color: Colors.black
                   ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 7.0,
                    horizontal: 20.0
                  ),
                  borderSide: BorderSide(width: 3.0, color: Colors.black87),
                  splashColor: Colors.indigoAccent,
                )
              ],
            ),
          )
        ],
      ), 
    );
  }
}