import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  @override 
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  List<String> images = [
    "images/placements.png",
    "images/eu.png"
  ];

  List<String> content =[
    "Hello nibbas, Welcome to placement 101. Fucking solve these shit to get placed da dei.",
    "Waddup bitach, what's poppin', tatz how we role. To more endless fake accents, get good gre score da"
  ];

  Widget customcard(String langname, String image, String content){
    return Padding(
      padding: EdgeInsets.all(
        20.0,
      ),
      child: InkWell(
        onTap: (){
          print('card tapped');
          
        },
        child: Material(
          color: Colors.lightBlueAccent,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(40.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                       height: 150.0,
                      width: 150.0,
                      
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontFamily: "Teko",
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    content,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontFamily: "Teko",
                      fontWeight: FontWeight.w700
                      
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forese Test Software",
          style: TextStyle(
            fontSize: 30.0,
           fontFamily: 'Teko',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Option A - Placements", images[0], content[0]),
          customcard("Option B - Higher Education", images[1], content[1]),
        ],
      ),
    );
  }
}