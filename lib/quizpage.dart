import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testsoft/resultpage.dart';

class getquiz extends StatelessWidget {
  const getquiz({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/python.json"),
      builder: (context, snapshot){
        List mydata = json.decode(snapshot.data.toString());
        if(mydata == null){
          return Scaffold(
            body: Center(
              child: Text("Now Loading"),
            )
          );
        }
        else {
          return quizpage(mydata : mydata);
        }
      },
    );
  }
}

class quizpage extends StatefulWidget {
  var mydata; // to validate the mydata so that we can return it as a list
  quizpage({Key key, @required this.mydata}): super(key : key);
  

  @override
  _quizpageState createState() => _quizpageState(mydata);
}
//quizpage 28:00
class _quizpageState extends State<quizpage> {
  var mydata;
  _quizpageState(this.mydata);
  int marks = 0; //fo the initial marks to be 0
  int timer = 30; //setting the timer seconds
  String showtimer1 = "30"; 
  int i = 1; //to make sure the user does not click more than one option
  Color colordisp = Colors.black26;
  Color rightans = Colors.green[300];
  Color wrongans = Colors.red[300];

  Map<String , Color> buttoncolor = {  // making the color of the button a string so that it can be used below for the btn color
    "a" : Colors.black,
    "b" : Colors.black,
    "c" : Colors.black,
    "d" : Colors.black,
  };

  bool canceltimer = false; //to make sure the timer is not cancelled

  void changequestion ()  //function to change to the next question
  {
    canceltimer = false; // to make sure the timer does not go infite
    timer = 30;
    setState(() {
      if(i < 5) {
      i++; 
    }else { // it navigates to the result page when the quiz is done
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => resultpage(marks : marks),
      ));

    } // to reset the color of the options when it changes to the next question
    buttoncolor["a"] = Colors.black;
    buttoncolor["b"] = Colors.black;
    buttoncolor["c"] = Colors.black;
    buttoncolor["d"] = Colors.black;
    });
    showtimer();
  }

  @override
  void initState() { //starting timer by default
    showtimer(); // to start the timer 
    super.initState();
    
  }

  void showtimer() async { // function to start and run the timer for each question
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t){
      setState(() {
        if(timer < 1){ //to cancel the timer when the timer reaches it's limit
          t.cancel(); 
          changequestion(); // calling the next question when the timer runs out
        } else if(canceltimer == true) {
          t.cancel(); // if the cancel timer is true, timer is cancelled
        }
        else {
          timer = timer -1;
        }
        showtimer1 = timer.toString(); 
      });
    });
  }
  

  void answercheck(String choice) {
    if(mydata[2]["1"] == mydata[1]["1"][choice]){  //to check the answer and display the corresponding color
      marks = marks + 1; //increment mark by 1
      colordisp = rightans;
    }
    else {
      colordisp = wrongans;
    }
    setState(() {
      buttoncolor[choice] = colordisp; //the choice selected = the corresponding color the button should show
      canceltimer = true; 
    });
      Timer(Duration(seconds : 1 ), changequestion); //to change the question to the next one after 2 seconds

  }

Widget choicebutton(String choice) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ),
    child: MaterialButton(
      onPressed: () => answercheck(
        choice),
      child: Text(
        mydata[1][i.toString()][choice],  //getting the options from the json file using the string choice
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontFamily: "Quando",
          fontWeight: FontWeight.bold
        ),
        maxLines: 1, //only line is allowed in the button
      ),
      splashColor: Colors.white54,
      color: buttoncolor[choice], //to use the respective color of choice
      highlightColor: Colors.grey,
      minWidth: 200.0,
      height: 50.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    )
     ,);
}

  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([  //to make sure the app is alway on portrait mode
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp,
    ]);
    return WillPopScope( // to make sure the user does not goes back when the back button is clicked
      onWillPop: (){
        return showDialog(  // creating a alert dialog box to prompt the user 
          context: context,
          builder:(context) => AlertDialog(
            title: Text("SVCE QUIZ MASTER",
            ),
            content: Text(
              "I'm afraid you gotta complete the quiz to go back. You cann do this!!"
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop(); 
                },
                child: Text(
                  "OK", 
                ),
              )
            ],
          )
        );
      },
      child: Scaffold(
       body: Column(
         children: <Widget>[
           Expanded( flex: 3, 
           child: Container(
             decoration: BoxDecoration(
               color: Colors.white12,
               /*image: DecorationImage(
                 image: AssetImage("images/quiz.jpg"),
                 fit: BoxFit.cover
               ) */
               ),
             padding: EdgeInsets.all(16.0),
             alignment: Alignment.bottomCenter,
             child: Text(
               mydata[0][i.toString()], //to get respective questions and converting a string
             style: TextStyle(
               fontSize: 18.0,
               fontFamily: "Quando",
               fontWeight: FontWeight.w700
             ),),
           ),),
           Expanded( flex: 6,
           child: Container(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 choicebutton('a'),
                 choicebutton('b'),
                 choicebutton('c'),
                 choicebutton('d'),
               ],
             ),
             
           ),),
           Expanded( flex: 1,
           child: Container(
             alignment: Alignment.topCenter,
             decoration: BoxDecoration(color: Colors.green[200]),
             child: Center(
               child: Text(
                 showtimer1,
                 style: TextStyle(
                   fontFamily: "teko",
                   fontSize: 40.0,
                   fontWeight: FontWeight.w700,
                 ),
                 ),
             ),
           ),)
         ],
       ),
    ),
    );
  }
}