import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectableContainer extends StatelessWidget {
  String label;
  bool isSelected;
  double height;
  double width;
  GestureTapCallback onTap;
  double borderWidth;
  SelectableContainer({
    @required this.label,
    @required this.isSelected,
    this.width,
    this.height,
    this.borderWidth,
    this.onTap});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 2.0,horizontal: 1),
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.black12,
              border: isSelected?Border.all(color: Colors.blue,width: borderWidth??2):null,
                  borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                child: Text(label,style: TextStyle(
                  color: Colors.blue,
                ),),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


// class MySelectableContainer extends StatefulWidget {
//   String label;
//   bool isSelected;
//   double height;
//   double width;
//   GestureTapCallback onTap;
//   MySelectableContainer(
//       {
//         @required this.label,
//         @required this.isSelected,
//         this.width,
//         this.height,
//         this.onTap}
//       );
//   @override
//   _MySelectableContainerState createState() => _MySelectableContainerState();
// }
//
// class _MySelectableContainerState extends State<MySelectableContainer> {
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.onTap,
//       child: Container(
//         height: widget.height,
//         width: widget.width,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: widget.isSelected?Border.all(color: AppColors.primaryColor2):null,
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: Center(
//           child: Text(widget.label),
//         ),
//       ),
//     );
//   }
// }
//
