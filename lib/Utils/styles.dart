import 'package:flutter/material.dart';

class Styles{

  static TextStyle textFieldlabelTextStyle(){
   return TextStyle(
     fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Colors.blue
    );
  }
  static TextStyle textFieldTextStyle(){
    return TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Colors.black
    );
  }
  static TextStyle labelTextStyle(){
    return TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.blue
    );
  }
  static TextStyle homeScreenListItemTextStyle(){
    TextStyle(
        color: Colors.blue[700],
      fontSize: 15,
      fontWeight: FontWeight.bold
    );
  }

}