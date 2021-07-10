import 'package:load_n_go_task/Utils/styles.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  TextEditingController controller;
  String label;
  bool obsecureText =false;
  IconButton suffixIcon;
  final ValueChanged<String> onChanged;
  Function onEditingComplete;
  GestureTapCallback onTap;
  bool enabled=true;
  int maxLines;
  String hintText;
  TextInputType keyboardType;
  bool autoFocus;
  double height;
  ///Constructor
  MyTextField({
    @required this.controller,
    @required this.label,
    this.obsecureText,
    this.onChanged,
    this.suffixIcon,
    this.onEditingComplete,
    this.enabled,
    this.onTap,
    this.maxLines,
    this.hintText,
    this.keyboardType,
    this.autoFocus,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    bool _passwordVisible = false;
    return Container(
      height: height??45,
      child: GestureDetector(
        onTap: onTap,
        child: TextField(
          autofocus: autoFocus??false,
          keyboardType: keyboardType,
          maxLines: maxLines??1,
          enabled: enabled,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onChanged:onChanged,
          controller: controller,
          obscureText: obsecureText??false,
          cursorColor: Colors.blue,
          style: Styles.textFieldTextStyle(),
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            fillColor: Colors.blue,
              focusColor: Colors.blue,
              hoverColor: Colors.blue,
              labelText: label,
              hintStyle:TextStyle(
                color: Colors.black54,
                fontSize: 12
              ),
              labelStyle: TextStyle(
                color: Colors.blue,
              ),
              disabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue,
                  )
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue,
                  )
              ),
              focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue,
                  )
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue,
                )
              ),
              // hintText: label,
          ),
        ),
      ),
    );
  }
}
