import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  @override
  String txt="button";
  GestureTapCallback ontap;
  Color gradient1=Colors.blue;
  Color gradient2=Colors.blue[300];
  Color borderColor=Colors.blue;
  double leftRightpadding;
  double borderRadius;
  MyFilledButton({this.txt, this.ontap,this.leftRightpadding,this.borderRadius});

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
          padding:  EdgeInsets.only(left: leftRightpadding??0,  right:leftRightpadding?? 0),
          child: InkWell(
            splashColor: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius??80.0),
            onTap: ontap,
            child: Ink(
              height: 45.0,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor,
                ),
                borderRadius: BorderRadius.circular(borderRadius??80.0),
                gradient: LinearGradient(colors: [
                  gradient1,
                  gradient2,
                ]),
              ),
              child: Center(
                  child: Text(
                    txt,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Sofia",
                        letterSpacing: 0.9),
                  )),
            ),
          ),
        ),
    );
  }
}
