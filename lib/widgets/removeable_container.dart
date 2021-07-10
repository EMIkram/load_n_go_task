import 'package:flutter/material.dart';

class RemoveableContainer extends StatelessWidget {
  String label;
  bool isSelected=true;
  double height;
  double width;
  GestureTapCallback onIconTap;
  double borderWidth;
  RemoveableContainer({
    @required this.label,
    this.width,
    this.height,
    this.borderWidth,
    @required this.onIconTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black12,
        border: isSelected?Border.all(color: Colors.blue,width: borderWidth??2):null,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom:15,left: 12),
              child: Text(label,style: TextStyle(
                  color:Colors.blue,
              ),),
            ),
            IconButton(color: Colors.redAccent,
              icon: Icon(Icons.clear),
              onPressed: onIconTap,
            )
          ],
        ),
      ),
    );
  }
}
