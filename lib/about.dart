import 'package:flutter/material.dart';
import 'package:testsoft/home.dart';
import 'package:url_launcher/url_launcher.dart';

class about extends StatelessWidget {
  static const routename = '/about';
 final String title;

  const about({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          ClipPath(
            child : Container(
              color: Colors.indigo[100].withOpacity(1.0)),
              clipper: getClipper(),
          ),
          Positioned( // used to postion the widget 
           top: 40,
           left: 5,
            child: Center(
           child: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => homepage(),
              ));
            },
            icon: Icon(Icons.arrow_back_ios),
             iconSize: 30.0,
            )
             ),
               
          ),
          Positioned(
            width: 350.0,
            height: 450.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new ExactAssetImage('images/about.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(75.0)
                    ),
                    boxShadow: [
                      BoxShadow(blurRadius: 3.0, color: Colors.black38, spreadRadius: 2.0)
                    ]
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "SUNDARAM FINANCE",
                  style: TextStyle(
                    fontFamily: "teko",
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '"Enduring values. New age thinking."',
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
                ),
                SizedBox(height: 25.0),
                Container(
                  height: 30.0,
                  width: 95.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.indigo,
                    shadowColor: Colors.indigoAccent,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () => launch('https://www.sundaramfinance.in/'),
                      child: Center(
                        child: Text(
                          "Know more",
                          style : TextStyle(
                            fontFamily: "teko",
                            color: Colors.white,
                            fontSize: 20
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Text(
                  "SUNDARAM INFOTECH SOLUTIONS",
                  style: TextStyle(
                    fontFamily: "teko",
                    fontWeight: FontWeight.w400,
                    fontSize: 30.0,
                  ),
                ),
                Center(
                  child: Text(
                    "\n“We are the backbone of SF”",
                    style: TextStyle(
                      fontFamily: "Poppins, sans-serif",
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w100,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              
              ],
            ),
          )
        ],

      ),
      
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override 
  Path getClip(Size size) {
    var path = new Path(); 
    path.lineTo(0.0, size.height / 2.6); //to clipp the height at a point
    path.lineTo(size.width +200, 0.0); // end width
    path.close();
    return path;
  }
  @override 
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}