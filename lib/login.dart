import 'package:flutter/material.dart';
import 'package:testsoft/forgotpass.dart';
import 'package:testsoft/home.dart';
import 'package:testsoft/signup.dart';

class login extends StatefulWidget {
  static const routename = '/login';
  login({Key key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                     "Hello",
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
                     "User",
                     style : TextStyle(
                       fontSize: 80.0,
                       fontWeight: FontWeight.bold,
                       fontFamily: "teko"
                     )
                   ),
                 ),
                
                 Container(
                   padding: EdgeInsets.fromLTRB(150.0, 175.0, 0.0, 0.0),
                   child: Text(
                     ".",
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
                     labelText: 'EMAIL',
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
                  SizedBox(height:20.0), //to give some space betwen the inputs
                 TextField(
                   decoration: InputDecoration(
                     labelText: 'PASSWORD',
                     labelStyle: TextStyle(
                       fontFamily: "teko",
                       fontWeight: FontWeight.bold,
                       color: Colors.grey,
                     ),
                     focusedBorder: UnderlineInputBorder( //to give attributes to the underderline
                       borderSide: BorderSide(color: Colors.indigo[200])
                     )
                   ),
                   obscureText: true, //to make it as a password
                 ),
                  SizedBox(height:20.0), //to give some space betwen the inputs
                  Container( //to make a clickable text for forgot password
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(forgotpass.routename);
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "teko",
                          decoration: TextDecoration.underline
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
                          builder: (context) => homepage(),
                          ));
                        },
                        child: Center(
                          child: Text(
                            "LOGIN",
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
           SizedBox(height: 35.0),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text(
                 "New to Quiz Master?\t",
                 style: TextStyle(
                   fontFamily: "teko",
                   fontWeight: FontWeight.w400,
                   fontSize: 20.0
                 ),),
                 SizedBox(height: 10.0),
                 InkWell(
                   onTap: () {
                     Navigator.of(context).pushNamed(signup.routename);
                   },
                   child: Text(
                     "Register now",
                     style: TextStyle(
                       fontFamily: "teko",
                       fontWeight: FontWeight.w400,
                       fontSize: 20.0,
                       color: Colors.indigo,
                       decoration: TextDecoration.underline
                     )
                   ),
                 )
             ],
           )
         ],
       ),
    );
  }
}