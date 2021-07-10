import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
class Utils{
  static push(BuildContext context,Widget secondRoute){

    // Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: secondRoute));
    //
    // Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: secondRoute));
    //
    // Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: secondRoute));
    //
    // Navigator.push(context, PageTransition(type: PageTransitionType.topToBottom, child: secondRoute));
    //
    // Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: secondRoute));
    //
    // Navigator.push(context, PageTransition(type: PageTransitionType.scale, alignment: Alignment.bottomCenter, child: secondRoute));
    //
    // Navigator.push(context, PageTransition(type: PageTransitionType.size, alignment: Alignment.bottomCenter, child: secondRoute));
    //
    // Navigator.push(context, PageTransition(type: PageTransitionType.rotate, child: secondRoute));
    //
    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: secondRoute));
    //
    // Navigator.push(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: secondRoute));

  }


  static pushReplacement(BuildContext context,Widget secondRoute){
    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: secondRoute));

  }
  static Widget showToast(String msg){
    Fluttertoast.showToast(msg: msg,
    timeInSecForIosWeb: 5,
    );
  }
  // static screenWidth(){
  //   SharedPreferences.getInstance().then((pref) {
  //    return  pref.getDouble("screen width");
  //   });
  // }
  // static screenHeight(){
  //   SharedPreferences.getInstance().then((pref) {
  //     return  pref.getDouble("screen height");
  //   });
  // }
  // static setScreenDimentions(BuildContext context){
  //   SharedPreferences.getInstance().then((preferences) {
  //     preferences.setDouble("screen width", MediaQuery.of(context).size.width);
  //     preferences.setDouble("screen height", MediaQuery.of(context).size.height);
  //   });
  // }
}

