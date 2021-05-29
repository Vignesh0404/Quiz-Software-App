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
    "images/py.png",
    "images/linux.png",
    "images/java.png"
  ];

  List<String> content = [
    "This quiz consists of questions from the basic fundamental programming language python",
    "This quiz consists of questions from the basic fundamentals of Linux",
    "This quiz consists of questions from the basic fundamental of Java"
  ];

  Widget quizCard(
      String langname, String image, String content, String qAsset) {
    return Padding(
      padding: EdgeInsets.all(
        20.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => getquiz(
                    questionAsset: qAsset,
                  )));
        },
        child: Material(
            color: Colors.white,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(20.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(image),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quiz 1',
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 20.0,
                              fontFamily: 'Teko',
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          Text(
                            langname,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontFamily: 'Teko',
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'Odibee Sans',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Container(
                      height: 45,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color(0xFFEC4E4E),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '                 BEGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Teko',
                                fontWeight: FontWeight.w700,
                                fontSize: 22),
                          ),
                          Spacer(),
                          Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.shade200),
                              child: Icon(Icons.arrow_forward,
                                  color: Colors.white)),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      //to make sure the app is alway on portrait mode
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade100,
        elevation: 0.0,
        title: Text(
          "FORESE - Placement Cell",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontFamily: 'Teko',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        actions: <Widget>[
          //for the search bar
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
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
                "\nSVCE QUIZ MASTER",
                style: TextStyle(
                    color: Colors.white, fontSize: 20, fontFamily: "teko"),
              )),
              accountEmail: new Text(
                "Powered by Forese© ",
                style: TextStyle(
                  fontFamily: "teko",
                  fontSize: 20,
                ),
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white38,
              ),
            ),
            new ListTile(
              trailing: new Icon(Icons.home),
              title: new Text('Home'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(homepage.routename);
              },
            ),
            new ListTile(
              trailing: new Icon(Icons.info),
              title: new Text('About | FORESE'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(about.routename);
              },
            ),
            new ListTile(
              trailing: new Icon(Icons.work),
              title: new Text('Placements | Tips'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(placements.routename);
              },
            ),
            new ListTile(
              trailing: new Icon(Icons.account_balance),
              title: new Text('HigherEdu | Tips'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(higheredu.routename);
              },
            ),
            new ListTile(
                trailing: new Icon(Icons.web),
                title: new Text('Visit Site'),
                onTap: () => launch('https://vignesh0404.github.io/')),
            new ListTile(
                trailing: new Icon(Icons.code),
                title: new Text('View Code - Github'),
                onTap: () =>
                    launch('https://github.com/Vignesh0404/Quiz-Software-App')),
            new ListTile(
              trailing: new Icon(Icons.rate_review),
              title: new Text('Rate'),
            ),
            new ListTile(
              trailing: new Icon(Icons.close),
              title: new Text('Close'),
              onTap: () => Navigator.of(context).pop(),
            ),
            new Divider(),
            new ListTile(
                trailing: new Icon(Icons.verified_user),
                title: new Text('Version - 1.0'),
                onLongPress: () => launch('https://vignesh0404.github.io/'))
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Row(
              children: [
                Text(
                  'Top Quiz Categories',
                  style: TextStyle(
                      fontFamily: 'Teko',
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Container(
                  height: 35,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.lightGreen.shade300),
                  child: Center(
                    child: Text(
                      'View All',
                      style: TextStyle(
                          fontFamily: 'Teko',
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
          ),
          quizCard("Introduction to python", images[0], content[0],
              'assets/python.json'),
          quizCard("Introduction to linux", images[1], content[1],
              'assets/java.json'),
          quizCard("Introduction to Java", images[2], content[2],
              'assets/java.json'),
        ],
      ),
    );
  }
}

class Datasearch extends SearchDelegate<String> {
  //flutter has some inbuilt type of functions for search
  final questions = [
    //list which can be searched
    "python",
    "java",
    "c",
    "c++",
    "html",
    "css",
    "javascript"
  ];

  final recentSearch = [
    //list for displaying the recent search
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
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ""; //to clear the content written
        },
      )
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
      onPressed: () {
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
    final suggestionlist = query.isEmpty
        ? recentSearch
        : questions.where((q) => q.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          //to go the selected quiz
          showResults(context);
        },
        leading: Icon(Icons.code),
        title: RichText(
          //to make the searched alphabet bold
          text: TextSpan(
              text: suggestionlist[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionlist[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestionlist.length,
    );
  }
}
