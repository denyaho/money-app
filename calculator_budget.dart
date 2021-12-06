import 'package:flutter/material.dart';
import 'calculator_page.dart';
import 'window.dart';

void main() => runApp(Calculator());

const inactiveCardColor= Color(0xFFE0E0E0);
const activeCardColor= Color(0xFF0288D1);


class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator>{

  int firstNum;
  int secondNum;
  String history = '0';
  String textToDisplay = '0';
  String result;
  String operations;
  String temp;
  String store;
  String buttonDisplay ='0';
  int purpose;

  Color rightCardColor = inactiveCardColor;
  Color leftCardColor = activeCardColor;

  void updateColor(int button){
    if(button ==1){
      if (leftCardColor == inactiveCardColor){
        leftCardColor = activeCardColor;
        rightCardColor = inactiveCardColor;
      }
      else{
        leftCardColor = inactiveCardColor;}
    }
    if(button == 2){
      if(rightCardColor == inactiveCardColor){
        rightCardColor = activeCardColor;
        leftCardColor = inactiveCardColor;
      }
      else{
        rightCardColor = inactiveCardColor;
      }
    }
  }

  void buttonClick(String value){
    print(value);
    if (value == 'AC') {
      textToDisplay = '0';
      firstNum = 0;
      secondNum = 0;
      temp = '0';
      result = '0';
      history = '0';}
    else if(value == '+' || value == '-' || value == '×' || value == '÷'){
      firstNum = int.parse(textToDisplay);
      operations = value;
      temp = textToDisplay;
      history = firstNum.toString() + value;
    }else if(value == '='){
      secondNum = int.parse(textToDisplay);
      if(operations == '+'){
        result = (firstNum + secondNum).toString();
        history = firstNum.toString() + operations.toString() + secondNum.toString();}
      if(operations == '-'){
        result = (firstNum - secondNum).toString();
        history = firstNum.toString() + operations.toString() + secondNum.toString();}
      if(operations == '÷'){
        result = (firstNum / secondNum).toString();
        history = firstNum.toString() + operations.toString() + secondNum.toString();}
      if(operations == '×'){
        result = (firstNum * secondNum).toString();
        history = firstNum.toString() + operations.toString() + secondNum.toString();}}
    else {
      if(temp != '0'){
        textToDisplay = '0';
        result = int.parse(textToDisplay + value).toString();
        temp = '0';
      }
//        history = int.parse(history + value).toString();}
      else{
        result = int.parse(textToDisplay + value).toString();
        history = int.parse(textToDisplay + value).toString();}
    }

    setState((){
      textToDisplay = result;
      buttonDisplay = result;
    });}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculate'),
          centerTitle: true,
        ),
        body: Container(
            child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: ElevatedButton(
                          onPressed: (){
                            setState((){
                              updateColor(1);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: leftCardColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            elevation: 10.0,
                          ),
                          child: Text(
                              'Payment',
                              style: TextStyle(
                                  color: Colors.white
                              )
                          ),),),
                      Container(
                          margin: EdgeInsets.only(left:20.0,right:20.0),
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                updateColor(2);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: rightCardColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 10.0,
                            ),
                            child: Text(
                                'Salary',
                                style: TextStyle(
                                    color: Colors.white
                                )),)),],),
                  Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 10.0),
                      child: Text(history,
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF000080)
                        ),)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget>[
                        Align(
                          alignment:
                          Alignment.centerLeft,
                          child: Container(
                            child: ElevatedButton(
                              child: Text('Next'),
                              onPressed: (){
                                if (leftCardColor==activeCardColor){
                                  purpose =1;
                                }
                                else if(rightCardColor==activeCardColor){
                                  purpose =2;
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) {
                                          return Window(textDisplay: buttonDisplay);
                                        }));},
                              style: OutlinedButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Color(0xFF00FF00)
                              ),
                            ),),
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: 10.0,bottom: 20.0),
                            child: Text(textToDisplay,
                              style: TextStyle(
                                  fontSize: 40
                              ),)),
                      ]
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                          color:Colors.black,
                          child: GridView.count(
                            crossAxisCount: 4,
                            mainAxisSpacing: 3.0,
                            crossAxisSpacing: 3.0,
                            childAspectRatio: 1.2,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              '7','8','9','÷',
                              '4','5','6','×',
                              '1','2','3','-',
                              'AC','0','=','+',
                            ].map((key){
                              return GridTile(
                                child: Calculator_page(text: key,
//                        fillColor: 0xFF8AC4D0,
                                  fillColor: 0xFF000000,
                                  textSize: 20.0,
                                  callback: buttonClick,
                                ),
                              );
                            }).toList(),
                          ))),


/*              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Calculator_page(text: '9',
                  fillColor: 0xFF8AC4D0,
                  textSize: 20.0,
                  callback: buttonClick,),
                  Calculator_page(text: '8',
                    fillColor: 0xFF8AC4D0,
                    textSize: 20.0,
                  callback: buttonClick,),
                  Calculator_page(text: '7',
                    fillColor: 0xFF8AC4D0,
                    textSize: 20.0,
                  callback: buttonClick),
                  Calculator_page(text: '÷',
                    fillColor: 0xFFF4D160,
                    textSize: 20.0,
                      callback: buttonClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Calculator_page(text: '6',
                    fillColor: 0xFF8AC4D0,
                    textSize: 20.0,
                      callback: buttonClick),
                  Calculator_page(text: '5',
                    fillColor: 0xFF8AC4D0,
                    textSize: 20.0,
                      callback: buttonClick),
                  Calculator_page(text: '4',
                    fillColor: 0xFF8AC4D0,
                    textSize: 20.0,
                      callback: buttonClick),
                  Calculator_page(text: '×',
                    fillColor: 0xFFF4D160,
                    textSize: 20.0,
                      callback: buttonClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Calculator_page(text: '3',
                    fillColor: 0xFF8AC4D0,
                    textSize: 20.0,
                      callback: buttonClick),
                  Calculator_page(text: '2',
                    fillColor: 0xFF8AC4D0,
                    textSize: 20.0,
                      callback: buttonClick),
                  Calculator_page(text: '1',
                    fillColor: 0xFF8AC4D0,
                    textSize: 20.0,
                      callback: buttonClick),
                  Calculator_page(text: '+',
                    fillColor: 0xFFF4D160,
                    textSize: 20.0,
                      callback: buttonClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Calculator_page(text: 'AC',
                    fillColor: 0xFF8AC4D0,
                    textSize: 15.0,
                      callback: buttonClick),
                  Calculator_page(text: '0',
                    fillColor: 0xFF8AC4D0,
                    textSize: 20.0,
                      callback: buttonClick),
                  Calculator_page(text: '.',
                    fillColor: 0xFF8AC4D0,
                    textSize: 20.0,
                      callback: buttonClick),
                  Calculator_page(text: '-',
                    fillColor: 0xFFF4D160,
                    textSize: 20.0,
                      callback: buttonClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Calculator_page(text: '3',
                      fillColor: 0xFF8AC4D0,
                      textSize: 20.0,
                      callback: buttonClick),
                  Expanded(
                  child: ElevatedButton(
                      child: Text('='),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: StadiumBorder(),
                  ),
                  onPressed: (){buttonClick('=');},)),
                  Calculator_page(text: '',
                      fillColor: 0xFFF4D160,
                      textSize: 20.0,
                      callback: buttonClick),
                ],
              ),*/
                ]
            )
        ),
      ),
    );
  }
}