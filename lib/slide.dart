import 'package:flutter/material.dart';
import 'package:testsoft/Slidemodel.dart';
import 'package:testsoft/slidedots.dart';
import 'dart:async';
import 'SlideItem.dart';
import 'slidedots.dart';
import 'home.dart';

class SlideScreen extends StatefulWidget {
  @override
  _SlideScreenState createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController (initialPage:0 );

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if(currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _pageController.animateToPage(
        currentPage, 
        duration: Duration(milliseconds: 300), 
        curve: Curves.bounceInOut 
        );
    });

  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      currentPage = index;
      
    });
  }

 

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
         Container(
           color: Colors.white38,
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Column(
              children: <Widget>[
              Expanded(
                   child: Stack(
                     alignment: AlignmentDirectional.bottomCenter,
                     children: <Widget>[
                        PageView.builder(
                       scrollDirection: Axis.horizontal,
                       controller: _pageController,
                       onPageChanged: _onPageChanged,
                       itemCount: SlideList.length,
                       itemBuilder: (ctx, i) => SlideItem(i),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 35),
                               child: Row(
                                 mainAxisSize: MainAxisSize.min,
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: <Widget>[
                                   for(int i=0;i<SlideList.length;i++)
                                    if(i== currentPage)
                                      SlideDots(true)
                                      else
                                      SlideDots(false)
                                 ],),)
                          ],
                        )
                        ],
                       ),
                  
              ),  
        SizedBox(height: 20.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                FlatButton(
                  child: Text('Get Started', style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "teko",
                    
                    fontWeight: FontWeight.w700,
                    ),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                     ),
                     padding: const EdgeInsets.all(15.0),
                     color: Theme.of(context).primaryColor ,
                     textColor: Colors.white,
                     onPressed: () {
                       Navigator.of(context).pushReplacementNamed(homepage.routename);
                     },
                ),
        
              ],)
      ],),
           ),
         ),
     
    );
  }
}