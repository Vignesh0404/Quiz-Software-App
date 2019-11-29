import 'package:flutter/material.dart';
import 'package:testsoft/home.dart';
import 'package:testsoft/login.dart';

class forgotpass extends StatefulWidget {
  static const routename = '/forgotpass';
  forgotpass({Key key}) : super(key: key);

  @override
  _forgotpassState createState() => _forgotpassState();
}

class _forgotpassState extends State<forgotpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           Container(
             child: Stack(
               children: <Widget>[
                 Container(
                   padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                   child: Text(
                     "Forgot",
                     style : TextStyle(
                       fontSize: 80.0,
                       fontWeight: FontWeight.bold,
                       fontFamily: "teko"
                     )
                   ),
                 ),
                 Container(
                   padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                   child: Text(
                     "Password",
                     style : TextStyle(
                       fontSize: 80.0,
                       fontWeight: FontWeight.bold,
                       fontFamily: "teko"
                     )
                   ),
                 ),
                
                 Container(
                   padding: EdgeInsets.fromLTRB(3200.0, 175.0, 0.0, 0.0),
                   child: Text(
                     "?",
                     style : TextStyle(
                       fontSize: 80.0,
                       fontWeight: FontWeight.bold,
                       color: Colors.indigo,
                       fontFamily: "teko"
                     )
                   ),
                 )
               ],
             ),
           ),
           Container(
             padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
             child: Column(
               children: <Widget>[
                 TextField(
                   decoration: InputDecoration(
                     labelText: 'ENTER THE EMAIL TO SEND VERIFICATION CODE',
                     labelStyle: TextStyle(
                       fontFamily: "teko",
                       fontWeight: FontWeight.bold,
                       color: Colors.grey,
                     ),
                     focusedBorder: UnderlineInputBorder( //to give attributes to the underderline
                       borderSide: BorderSide(color: Colors.indigo[200])
                     )
                   ),
                 ),
                  
                  
                  SizedBox(height:40.0), //to give some space betwen the inputs
                  Container(
                    height: 40.0,
                    width: 250.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.indigo[300],
                      color: Colors.indigo,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed(homepage.routename);
                        },
                        child: Center(
                          child: Text(
                            "SEND LINK",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "teko",
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:40.0), //to give some space betwen the inputs
                  Container(
                    height: 40.0,
                    width: 250.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.indigo[300],
                      color: Colors.indigo,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: (){
                         Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => login(),
                          ));
                        },
                        child: Center(
                          child: Text(
                            "Go to Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "teko",
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
               ],
             ),
           ),
           
         ],
       ),
       
    );
  }
}