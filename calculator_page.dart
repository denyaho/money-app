import 'package:flutter/material.dart';

class Calculator_page extends StatelessWidget{

  Calculator_page({this.text ,this.fillColor,this.textSize,this.callback});
  final String text;
  final int fillColor;
  final double textSize;
  final Function callback;

  @override
  Widget build(BuildContext context){
    return Container(
      child: ElevatedButton(
        onPressed: (){
          callback(text);
        },
        child:
        Text(text,
            style: TextStyle(
              fontSize: textSize,
            )),
        style: ElevatedButton.styleFrom(
          primary: Color(fillColor),
        ),),);
  }
}
