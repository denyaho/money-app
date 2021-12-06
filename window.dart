import 'package:flutter/material.dart';
import 'calculator_budget.dart';
import 'package:money_app/analyze_budget.dart';

void main() => runApp(Window());

class Window extends StatelessWidget{
  String textDisplay;
  Window({this.textDisplay});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment detail'),
        centerTitle: true,),
      body: WindowDetail(textToDisplay: textDisplay,),);}}

class WindowDetail extends StatefulWidget{
  String textToDisplay;
  WindowDetail({this.textToDisplay});

  @override
  _WindowDetailState createState() => _WindowDetailState();}

class _WindowDetailState extends State<WindowDetail>{
  TextEditingController _controller;

  @override
  void initState(){
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context){
    return Container(
        child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        child: Text('￥',
                          style: TextStyle(
                            fontSize: 20.0,),),),
                      Container(
                        child: Text("JPY",
                          style: TextStyle(
                              fontSize: 20.0),),)],),
                  Container(
                      child: Text(widget.textToDisplay,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50.0,
                          ))
                  ),],),
              SizedBox(height: 50.0,),
              Container(
                  child: SingleChildScrollView(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Category(food,Dailygoods etc):',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black
                            ),
                          ),
                        ),
                        controller: _controller,
                        onSubmitted: (String value) async{
                          await showDialog <void> (
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('Thanks!'),
                                  content: Text('You typed "$value",which has length ${value.characters.length}.'),
                                  actions: <Widget>[
                                    ElevatedButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'))
                                  ],
                                );
                              });
                        },))),
              ElevatedButton(
                onPressed: (){

                },
                child: Text('done'),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.lightGreenAccent,
                ),)
            ]));}}