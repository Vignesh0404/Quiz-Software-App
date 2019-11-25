
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Slidemodel {

  final String imageURL;
  final String title;
  final String description; 


  Slidemodel( {

   @required  this.imageURL,
    @required this.title,
    @required  this.description,

  });
}

 final SlideList = [
    Slidemodel(
      imageURL: 'images/slide1.jpg',
      title: 'this is the title 1 ',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'
    ),

     Slidemodel(
      imageURL: 'images/slide2.jpg',
      title: 'this is the title 2 ',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'
    ),

     Slidemodel(
      imageURL: 'images/slide3.jpg',
      title: 'this is the title 3',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'
    ),

    
  ];