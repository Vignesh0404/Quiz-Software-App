import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testsoft/resultpage.dart';

class getquiz extends StatelessWidget {
  const getquiz({Key key, this.questionAsset}) : super(key: key);
  final String questionAsset;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(questionAsset),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
              body: Center(
            child: Text("Now Loading"),
          ));
        } else {
          return quizpage(mydata: mydata);
        }
      },
    );
  }
}

class quizpage extends StatefulWidget {
  var mydata; // to validate the mydata so that we can return it as a list
  quizpage({Key key, @required this.mydata}) : super(key: key);

  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<quizpage> {
  var mydata;
  _quizpageState(this.mydata);
  int marks = 0; //fo the initial marks to be 0
  int timer = 15; //setting the timer seconds
  int showtimer1 = 15;
  int i = 1; //to make sure the user does not click more than one option
  Color colordisp = Colors.black26;
  Color rightans = Colors.green[300];
  Color wrongans = Colors.red[300];

  Map<String, Color> buttoncolor = {
    // making the color of the button a string so that it can be used below for the btn color
    "a": Colors.black,
    "b": Colors.black,
    "c": Colors.black,
    "d": Colors.black,
  };

  bool canceltimer = false; //to make sure the timer is not cancelled

  void changequestion() //function to change to the next question
  {
    canceltimer = false; // to make sure the timer does not go infite
    timer = 15;
    setState(() {
      if (i < 5) {
        i++;
      } else {
        // it navigates to the result page when the quiz is done
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(marks: marks),
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
  void initState() {
    //starting timer by default
    showtimer(); // to start the timer
    super.initState();
  }

  void showtimer() async {
    // function to start and run the timer for each question
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          //to cancel the timer when the timer reaches it's limit
          t.cancel();
          changequestion(); // calling the next question when the timer runs out
        } else if (canceltimer == true) {
          t.cancel(); // if the cancel timer is true, timer is cancelled
        } else {
          timer = timer - 1;
        }
        showtimer1 = timer;
      });
    });
  }

  void answercheck(String choice) {
    if (mydata[2]["1"] == mydata[1]["1"][choice]) {
      //to check the answer and display the corresponding color
      marks = marks + 1; //increment mark by 1
      colordisp = rightans;
    } else {
      colordisp = wrongans;
    }
    setState(() {
      buttoncolor[choice] =
          colordisp; //the choice selected = the corresponding color the button should show
      canceltimer = true;
    });
    Timer(Duration(seconds: 1),
        changequestion); //to change the question to the next one after 2 seconds
  }

  Widget choicebutton(String choice) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () => answercheck(choice),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: buttoncolor[choice]),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  ' ' + mydata[1][i.toString()][choice],
                  style: TextStyle(
                      fontFamily: 'Teko',
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                      fontSize: 23),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: buttoncolor[choice]),
                      shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: buttoncolor[choice],
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      //to make sure the app is alway on portrait mode
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp,
    ]);
    return WillPopScope(
      // to make sure the user does not goes back when the back button is clicked
      onWillPop: () {
        return showDialog(
            // creating a alert dialog box to prompt the user
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "SVCE QUIZ MASTER",
                  ),
                  content: Text(
                      "I'm afraid you gotta complete the quiz to go back. You cann do this!!"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "OK",
                      ),
                    )
                  ],
                ));
      },
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PYTHON QUIZZ',
                          style: TextStyle(
                              fontFamily: 'Teko',
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w300,
                              fontSize: 18),
                        ),
                        Row(
                          children: [
                            Text(
                              'Question 0' + mydata[0][i.toString()][0] + ' ',
                              style: TextStyle(
                                  fontFamily: 'Teko',
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 30),
                            ),
                            Text(
                              '/10',
                              style: TextStyle(
                                  fontFamily: 'Teko',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade500,
                                  fontSize: 28),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      (showtimer1 > 5)
                          ? Icon(
                              Icons.timer_outlined,
                              color: Colors.green.shade300,
                            )
                          : Icon(
                              Icons.timer_outlined,
                              color: Colors.red.shade300,
                            ),
                      SizedBox(
                        height: 5,
                      ),
                      (showtimer1 > 5)
                          ? Text(
                              showtimer1.toString(),
                              style: TextStyle(
                                  fontFamily: 'Teko',
                                  fontWeight: FontWeight.w800,
                                  color: Colors.green.shade300,
                                  fontSize: 25),
                            )
                          : Text(
                              showtimer1.toString(),
                              style: TextStyle(
                                  fontFamily: 'Teko',
                                  fontWeight: FontWeight.w800,
                                  color: Colors.red.shade300,
                                  fontSize: 25),
                            )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  mydata[0][i.toString()],
                  style: TextStyle(
                      fontFamily: 'Odibee Sans',
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                      fontSize: 23),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              choicebutton('a'),
              choicebutton('b'),
              choicebutton('c'),
              choicebutton('d'),
              Spacer(),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.settings_power),
                        Text(
                          '  Quit Quiz',
                          style: TextStyle(
                              fontFamily: 'Teko',
                              fontWeight: FontWeight.w100,
                              color: Colors.black,
                              fontSize: 23),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 50,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Color(0xFFEC4E4E),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Teko',
                            fontWeight: FontWeight.w700,
                            fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
