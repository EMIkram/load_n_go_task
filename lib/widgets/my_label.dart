import 'package:flutter/material.dart';
import 'package:load_n_go_task/Utils/styles.dart';

class MyLabel extends StatelessWidget {
  bool borderWidth;
  String label;
  Color backGroundColor;
  Color textColor;

  GestureTapCallback onTap;
  MyLabel({
  @required this.label,
      this.onTap,
      this.borderWidth,
  this.backGroundColor,
  this.textColor});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
              decoration: BoxDecoration(
            color: backGroundColor??Colors.black12,
            borderRadius: BorderRadius.circular(5),
          ),
            child: Center(child: Text(label,style: Styles.labelTextStyle().copyWith(
              color: textColor??Colors.blue,
            ))),
          ),
        ),
      ],
    );
  }
}
