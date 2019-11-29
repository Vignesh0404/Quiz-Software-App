import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testsoft/about.dart';
import 'package:testsoft/quizpage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:testsoft/higheredu.dart';
import 'package:testsoft/placements.dart';

class homepage extends StatefulWidget {
  static const routename = '/home';
  @override 
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  List<String> images = [
    "images/code.jpg",
    "images/analysis.jpg"
  ];

  List<String> content =[
    "This quiz consists of questions from the basic fundamental programming language python",
    "This quiz consists of questions from the basic fundamental Data Analytics"
  ];

  Widget customcard(String langname, String image, String content){
    return Padding(
      padding: EdgeInsets.all(
        20.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => getquiz()
          ));
          
        },
        child: Material(
          color: Colors.indigo.withOpacity(0.7),
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
    SystemChrome.setPreferredOrientations([  //to make sure the app is alway on portrait mode
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: 
         Text(
          "SIS | SUNDARAM FINANCE",
          style: TextStyle(
            fontSize: 30.0,
           fontFamily: 'Teko',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        actions: <Widget>[ //for the search bar
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: Datasearch());
          })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
              color: Colors.indigo[300],
              image: DecorationImage(
                      image: new ExactAssetImage('images/cpo.jpg'),
                      fit: BoxFit.cover,
                    ),
              ),
              accountName: new Container(
                child: Text(
                  "\nSUNDARAM QUIZ MASTER",
                style: TextStyle(
                   color: Colors.white,
                   fontSize: 20,
                   fontFamily: "teko"
                ),
              )),
              accountEmail: new Text("Powered by SIS©",
              style: TextStyle(
                fontFamily: "teko",
                fontSize: 20,
                
              ),
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white38,
              ),
            ),
            new ListTile (
              trailing: new Icon(Icons.home),
              title: new Text('Home'),
              onTap: () {
                       Navigator.of(context).pushReplacementNamed(homepage.routename);
                     },
              ),
              new ListTile (
              trailing: new Icon(Icons.info),
              title: new Text('About | SIS'),
              onTap: () {
                Navigator.of(context).pop();
                       Navigator.of(context).pushNamed(about.routename);
              },
              ),
            new ListTile (
              trailing: new Icon(Icons.work),
              title: new Text('Techincal   | Domains'),
              onTap: () {
                        Navigator.of(context).pop();
                       Navigator.of(context).pushNamed(placements.routename);
                     },
              ),
               new ListTile (
              trailing: new Icon(Icons.account_balance),
              title: new Text('Analytical  | Concepts'),
              onTap: () {
                      Navigator.of(context).pop();
                       Navigator.of(context).pushNamed(higheredu.routename);
                     },
              ),
               new ListTile (
              trailing: new Icon(Icons.web),
              title: new Text('Visit Site'),
              onTap: () => launch('https://vignesh0404.github.io/')
 
                    
              ),
              new ListTile (
              trailing: new Icon(Icons.code),
              title: new Text('View Code - Github'),
              onTap: () => launch('https://github.com/Vignesh0404/Quiz-Software-App')
              
              ),
              new ListTile (
              trailing: new Icon(Icons.rate_review),
              title: new Text('Rate'),
              ),
               new ListTile (
              trailing: new Icon(Icons.close),
              title: new Text('Close'),
              onTap: () => Navigator.of(context).pop(),
              ),
              new Divider(),
                 new ListTile (
              trailing: new Icon(Icons.verified_user),
              title: new Text('Version - 1.0'),
              onLongPress: () => launch('https://vignesh0404.github.io/')
                
              )
              
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Technical Quiz", images[0], content[0]),
          customcard("Data Analytics", images[1], content[1]),
        ],
      ),
    );
  }
}

class Datasearch extends SearchDelegate<String> { //flutter has some inbuilt type of functions for search
  final questions = [ //list which can be searched
    "python",
    "java",
    "c",
    "c++",
    "html",
    "css",
    "javascript"
  ];

  final recentSearch = [ //list for displaying the recent search
   "python",
   "javascript",
    "c",
    "c++",
    "html",
    "css",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: assign the actions to the search
    return [
      IconButton(icon: Icon(Icons.clear),onPressed: (){
        query = ""; //to clear the content written
      },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: leading icon
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: show result based on search
    return homepage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: show searches
    final suggestionlist = query.isEmpty?recentSearch:questions.where((q)=>q.startsWith(query)).toList();
    return ListView.builder(itemBuilder: (context,index)=>ListTile(
      onTap: () { //to go the selected quiz
        showResults(context);
      },
      leading: Icon(Icons.code),
      title: RichText( //to make the searched alphabet bold
        text: TextSpan(
          text: suggestionlist[index].substring(0,query.length),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          children: [
            TextSpan(
              text: suggestionlist[index].substring(query.length),
              style: TextStyle(
                color: Colors.grey
                )
            )
          ]
        ),
      ),
    ),
    itemCount: suggestionlist.length,
    );
  } 

}