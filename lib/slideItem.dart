import 'package:flutter/material.dart';
import 'Slidemodel.dart';

class SlideItem extends StatelessWidget {
  final int index; 
  SlideItem(this.index); 
  @override 
  Widget build(BuildContext context) {
    return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(SlideList[index].imageURL),
                            fit: BoxFit.cover
                          )
                            
                        ),
                        
                      ),
                      SizedBox(height: 40.0,),
                      Text(  
                        SlideList[index].title,
                        style: TextStyle(
                          fontFamily: "Satisfy",
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor
                           ),
                      ),
                      SizedBox(height: 12.0,),
                      Text(  
                        SlideList[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Satisfy",
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,

                          color: Theme.of(context).primaryColor
                           ),
                      )
                    ,
                ],
        );
  }
}