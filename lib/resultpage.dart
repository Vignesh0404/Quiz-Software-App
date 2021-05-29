import 'package:flutter/material.dart';
import 'package:testsoft/home.dart';

class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key key, @required this.marks}) : super(key: key);

  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {
  // List<String> images = [
  //   //a list to display different images for differnt marks
  //   "images/success.png",
  //   "images/bad.png"
  // ];
  String msg;
  String img;

  @override
  void initState() {
    // to display different images and messages based on the marks scored

    if (marks < 3) {
      //img = images[1];
      msg = "Keep working on it! You'll eventually get there";
    } else if (marks > 3) {
      //img = images[0];
      msg = "Congragulations! Keep Quizzing";
    }
    super.initState();
  }

  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "QUIZ RESULTS",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontFamily: "teko",
            fontSize: 30.0,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.picture_as_pdf_outlined, color: Colors.black),
              onPressed: () {})
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              "You have scored $marks/5 marks!",
              style: TextStyle(
                  fontFamily: "Odibee Sans",
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            (marks >= 3)
                ? Container(
                    height: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                        image: DecorationImage(
                            image: AssetImage('images/success.png'))),
                  )
                : Container(
                    height: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                        image: DecorationImage(
                            image: AssetImage('images/bad.png'))),
                  ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Student Info',
                style: TextStyle(
                    fontFamily: 'Teko',
                    fontWeight: FontWeight.w900,
                    fontSize: 30),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Container(
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1.5, color: Colors.grey.shade200)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                              fontFamily: 'Odibee Sans',
                              fontWeight: FontWeight.w900,
                              fontSize: 20),
                        ),
                        Spacer(),
                        Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.yellow.shade300),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(Icons.badge,
                                  color: Colors.yellow.shade700),
                            ))
                      ],
                    ),
                    Text(
                      'Vasupratha Belman bhat',
                      style: TextStyle(
                          fontFamily: 'Odibee Sans',
                          fontWeight: FontWeight.w100,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Reg Number',
                      style: TextStyle(
                          fontFamily: 'Odibee Sans',
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                    Text(
                      '170501156',
                      style: TextStyle(
                          fontFamily: 'Odibee Sans',
                          fontWeight: FontWeight.w100,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Phone Number',
                      style: TextStyle(
                          fontFamily: 'Odibee Sans',
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                    Text(
                      '+918668088824',
                      style: TextStyle(
                          fontFamily: 'Odibee Sans',
                          fontWeight: FontWeight.w100,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            )),
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
            //   child: Center(
            //     child: Text(
            //       msg + "\nYou have scored $marks/5 marks!",
            //       style: TextStyle(
            //           fontFamily: "Quando",
            //           fontWeight: FontWeight.w700,
            //           fontSize: 20.0,
            //           color: Colors.black45),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Color(0xFFEC4E4E),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  'RETAKE',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Teko',
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => homepage(),
                ));
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Teko',
                        fontWeight: FontWeight.w700,
                        fontSize: 22),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
